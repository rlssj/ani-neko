# ani-neko 🐱

Ver anime en español desde la terminal

Watch anime from your terminal (Spanish subtitles)

CLI tool powered by **mpv + fzf**, usando [AnimeAV1](https://animeav1.com)

⚡ Rápido | 🎯 Sin anuncios | 🖥️ Ligero | ❤️ Open Source

> Inspirado en [ani-cli](https://github.com/pystardust/ani-cli) y [ani-cli-mx](https://github.com/Gildedboy/ani-cli-mx)

---

**Busca, reproduce y continúa tus animes — todo desde la terminal.**

---

![Platforms](https://img.shields.io/badge/platform-Linux%20%7C%20Windows-blue)
![License](https://img.shields.io/github/license/rlssj/ani-neko)
![Made with Bash](https://img.shields.io/badge/made%20with-bash-1f425f)
![Uses mpv](https://img.shields.io/badge/player-mpv-orange)

---

## ✨ Características

* 🔍 Búsqueda de animes desde la terminal, con **menú numerado** (`1 Death Note`,
  `2 Death Note: Rewrite`, ...) igual que ani-cli
* 🎬 La búsqueda incluye **temporadas, secuelas y rewrites** de la franquicia
* 📺 Reproducción directa con **mpv**
* ⏭️ Navegación entre episodios (siguiente / anterior)
* 💾 Guarda automáticamente el último episodio y el minuto
* 🔄 Auto-actualización del script
* ⚡ Interfaz interactiva con **fzf**
* 🧠 Varios servidores con respaldo automático (HLS, Voe, MP4Upload, ...)
* 📦 Compatible con múltiples distribuciones Linux

---

## ⚡ Instalación

### Instalación rápida (un solo comando)

```bash
curl -fsSL https://raw.githubusercontent.com/rlssj/ani-neko/main/install.sh | bash
```

El instalador detecta tu distribución, comprueba e instala las dependencias que
falten y deja `ani-neko` disponible en el PATH (en `~/.local/bin`, sin necesidad
de sudo).

Después podrás usar:

```bash
ani-neko
```

---

### Instalación por distribución

*Soporte de nivel 1: Linux*

Si ya tienes las dependencias, el comando de arriba es suficiente. Estas
instrucciones son para instalar todo a mano, distro por distro.

<details><summary><b>Linux</b></summary>

#### Paquetes nativos

*El instalador detecta tu gestor de paquetes e instala solo lo que falte.*

<details><summary>Debian / Ubuntu / Mint / Pop!_OS</summary>

```sh
sudo apt update
sudo apt install curl fzf python3 mpv jq grep sed
```

</details><details><summary>Fedora / RHEL / CentOS</summary>

Fedora no incluye `mpv` en sus repos oficiales; habilita **RPM Fusion free**
primero:

```sh
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install curl fzf python3 mpv jq grep sed
```

</details><details><summary>Arch Linux / Manjaro / EndeavourOS</summary>

```sh
sudo pacman -S --needed curl fzf python3 mpv jq grep sed
```

</details><details><summary>openSUSE Leap / Tumbleweed</summary>

Para que `mpv` reproduzca todos los formatos, añade el repositorio
[Packman](https://en.opensuse.org/Additional_package_repositories#Packman):

```sh
sudo zypper addrepo -cfp 90 https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/ packman
sudo zypper dup --from packman --allow-vendor-change
sudo zypper install curl fzf python3 mpv jq grep sed
```

</details><details><summary>Alpine Linux</summary>

```sh
sudo apk add curl fzf python3 mpv jq grep sed bash
```

</details><details><summary>Void Linux</summary>

```sh
sudo xbps-install -S curl fzf python3 mpv jq grep sed
```

</details><details><summary>Gentoo</summary>

```sh
sudo emerge -a net-misc/curl app-shells/fzf dev-lang/python media-video/mpv app-misc/jq sys-apps/grep sys-apps/sed
```

</details><details><summary>NixOS / Nix</summary>

```sh
nix-env -iA nixpkgs.curl nixpkgs.fzf nixpkgs.python3 nixpkgs.mpv nixpkgs.jq nixpkgs.gnugrep nixpkgs.gnused
```

</details></details><details><summary><b>Windows (WSL)</b></summary>

```sh
wsl --install
```

Reinicia y luego, dentro de Ubuntu:

```sh
cd ~/
git clone https://github.com/rlssj/ani-neko.git
cd ani-neko
chmod +x install.sh
./install.sh
```

#### Nota sobre mpv

Descarga mpv desde su [página oficial](https://mpv.io/installation/) y añádelo
al PATH de Windows. Después:

```sh
wsl ani-neko
```

</details>

---

### Instalación desde el código fuente

Cualquier Linux (incluidas Gentoo y NixOS):

```sh
git clone https://github.com/rlssj/ani-neko.git
cd ani-neko
chmod +x install.sh
./install.sh
```

Si tu distro no tiene uno de los gestores soportados (`apt-get`, `dnf`, `yum`,
`pacman`, `zypper`, `apk`, `xbps-install`), instala las dependencias a mano y
copia el script:

```sh
install -m 755 ani-neko ~/.local/bin/ani-neko
```

---

## 🖥️ Uso

```bash
ani-neko
```

O directamente:

```bash
ani-neko death note
```

Continuar un anime donde lo dejaste:

```bash
ani-neko -c
```

---

## 📦 Compatibilidad

Funciona en:

* Debian / Ubuntu / Mint / Pop!_OS
* Fedora / RHEL / CentOS
* Arch Linux / Manjaro / EndeavourOS
* openSUSE Leap / Tumbleweed
* Alpine Linux
* Void Linux
* Gentoo
* NixOS / Nix
* Windows (WSL)

Gestores soportados: `apt-get`, `dnf`, `yum`, `pacman`, `zypper`, `apk`, `xbps-install`.

---

## 🔧 Dependencias

* `python3`
* `mpv`
* `fzf`
* `curl`
* `jq`
* `grep`
* `sed`

El instalador se encarga de todo automáticamente.

---

## 💾 Historial

El script guarda automáticamente:

* Último anime visto
* Último episodio
* El minuto en el que lo dejaste

en `~/ani-es/history.json`.

---

## ❌ Desinstalar

```bash
./uninstall.sh
```

---

## ⚠️ Nota

Este proyecto es solo una interfaz CLI para interactuar con sitios de streaming.
No aloja contenido propio.

---

## 🙏 Créditos

* Fuente de datos: [AnimeAV1](https://animeav1.com)
* Inspirado en [ani-cli](https://github.com/pystardust/ani-cli) de pystardust
  y [ani-cli-mx](https://github.com/Gildedboy/ani-cli-mx)
* Basado originalmente en [ani-es](https://github.com/Zhuchii/ani-es) de Zhuchii

---

## ⭐ Apoya el proyecto

Si te gusta el proyecto, dale una estrella ⭐
