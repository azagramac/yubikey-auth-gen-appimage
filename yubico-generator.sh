#!/bin/bash
set -e

TARFILE="$1"
if [ -z "$TARFILE" ]; then
    echo "Uso: $0 archivo.tar.gz"
    exit 1
fi

APPDIR="$HOME/YubicoAuthenticator.AppDir"
APPIMAGETOOL="$HOME/appimagetool"

# Extraer paquete para detectar versión
tar xf "$TARFILE"
PACKAGE_FOLDER=$(find . -maxdepth 1 -type d -name "yubico-authenticator-*" | head -n1)
VERSION=$(basename "$PACKAGE_FOLDER" | sed -E 's/yubico-authenticator-(.*)-linux/\1/')

PACKAGE_NAME="yubikey-authenticator"
ARCH=$(uname -m)
OUTPUT="$HOME/${PACKAGE_NAME}-${VERSION}-${ARCH}.AppImage"

echo "🔧 Generando AppImage para $PACKAGE_NAME $VERSION ($ARCH)"

# Descargar appimagetool si no existe
if [ ! -f "$APPIMAGETOOL" ]; then
    wget -q https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage -O "$APPIMAGETOOL"
    chmod +x "$APPIMAGETOOL"
fi

rm -rf "$APPDIR"
mkdir -p "$APPDIR"

# Copiar contenido
cp -r "$PACKAGE_FOLDER"/* "$APPDIR/"

# Limpiar desktop originales
find "$APPDIR" -name "*.desktop" -delete

# Detectar binario
BIN=$(find "$APPDIR" -type f -name "authenticator" | head -n1)
if [ -z "$BIN" ]; then
    echo "❌ No se encontró el binario 'authenticator'"
    exit 1
fi
chmod +x "$BIN"

# Crear AppRun
cat > "$APPDIR/AppRun" <<EOF
#!/bin/bash
HERE="\$(dirname "\$(readlink -f "\$0")")"
exec "\$HERE/authenticator" "\$@"
EOF
chmod +x "$APPDIR/AppRun"

# Crear desktop
cat > "$APPDIR/YubicoAuthenticator.desktop" <<EOF
[Desktop Entry]
Version=1.0
Name=Yubico Authenticator
Comment=Manage YubiKeys safely and easily
Exec=AppRun
Icon=yubico
Terminal=false
Type=Application
Categories=Security;
EOF

# Icono
ICON_SRC=$(find "$APPDIR" -name "app-icon.png" | head -n1)
if [ -n "$ICON_SRC" ]; then
    cp "$ICON_SRC" "$APPDIR/yubico.png"
fi

# Generar AppImage
"$APPIMAGETOOL" "$APPDIR" "$OUTPUT"

echo "🎉 AppImage generado: $OUTPUT"
