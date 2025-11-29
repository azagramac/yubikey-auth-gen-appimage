# 🔐 Yubico Authenticator
![Yubikey](https://img.shields.io/github/v/release/azagramac/yubikey-auth-gen-appimage?label=yubikey&logo=yubico&color=green)

<img width="480" alt="img1" src="https://github.com/user-attachments/assets/94ca92f7-2362-4c72-a8cd-0d035d06c0fc" />

<img width="480" alt="img2" src="https://github.com/user-attachments/assets/994105c7-f469-4a96-8e9a-9b833521c1e5" />

## 📌 Descripción

Paquete **Yubico Authenticator** en formato `.AppImage` para Linux compilado desde el .tar.gz oficial

> 💡 La imagen base proviene directamente de las **fuentes oficiales de Yubico** ([Yubico Authenticator Releases](https://developers.yubico.com/yubioath-flutter/Releases/)), garantizando integridad y fiabilidad.


## 🚀 Instalación y uso

1. Instala el servicio `pcscd` necesario para la comunicación con las YubiKeys:

```bash
sudo apt update && sudo apt install -y pcscd pcsc-tools
sudo systemctl enable --now pcscd
sudo systemctl status pcscd
```

2. Inserta la llave Yubikey en el ordenaror y ejecuta el siguiente comando para ver si es detectado por el sistema
```bash
pcsc_scan
```

3. Descarga el archivo `yubikey-authenticator-{version}-{arch}.AppImage` desde 📦 [Github Releases](https://github.com/azagramac/yubikey-auth-gen-appimage/releases/latest) .  

4. Asigna permisos de ejecución:

```bash
chmod +x yubikey-authenticator-7.3.0-x86_64.AppImage
```

5. Ejecutalo:
```bash
./yubikey-authenticator-7.3.0-x86_64.AppImage
```

