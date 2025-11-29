# 🔐 Yubico Authenticator
![Yubikey](https://img.shields.io/github/v/release/azagramac/yubikey-auth-gen-appimage?label=yubikey&logo=yubico&color=green)

<img width="480" alt="img1" src="https://github.com/user-attachments/assets/94ca92f7-2362-4c72-a8cd-0d035d06c0fc" />

<img width="480" alt="img2" src="https://github.com/user-attachments/assets/994105c7-f469-4a96-8e9a-9b833521c1e5" />

## 📌 Description

**Yubico Authenticator** package in `.AppImage` format for Linux, built from the official `.tar.gz`.

> 💡 The base image comes directly from the **official Yubico sources** ([Yubico Authenticator Releases](https://developers.yubico.com/yubioath-flutter/Releases/)), ensuring integrity and reliability.

## 🚀 Installation & Usage

1. Install the `pcscd` service required for communication with YubiKeys:
```bash
sudo apt update && sudo apt install -y pcscd pcsc-tools
sudo systemctl enable --now pcscd
sudo systemctl status pcscd
```

2. Insert your YubiKey into the computer and run the following command to check if it is detected by the system:
```bash
pcsc_scan
```

3. Download the file `yubikey-authenticator-{version}-{arch}.AppImage` desde 📦 [Github Releases](https://github.com/azagramac/yubikey-auth-gen-appimage/releases/latest).

4. Make it executable:
```bash
chmod +x yubikey-authenticator-7.3.0-x86_64.AppImage
```

5. Run:
```bash
./yubikey-authenticator-7.3.0-x86_64.AppImage
```

