# ani-neko 🐱

Ver anime en español desde la terminal

Watch anime from your terminal (Spanish subtitles)

CLI tool powered by **mpv + fzf**

⚡ Rápido | 🎯 Sin anuncios | 🖥️ Ligero | ❤️ Open Source

> Inspirado en ani-cli, enfocado en contenido en español

---

**Busca, reproduce y continúa tus animes — todo desde la terminal.**

---

![Platforms](https://img.shields.io/badge/platform-Linux%20%7C%20Windows-blue)
![License](https://img.shields.io/github/license/rlssj/ani-neko)
![Made with Bash](https://img.shields.io/badge/made%20with-bash-1f425f)
![Uses mpv](https://img.shields.io/badge/player-mpv-orange)

---

## ✨ Características

* 🔍 Búsqueda de animes desde la terminal
* 🎬 **La búsqueda incluye temporadas y secuelas**: al buscar una franquicia
  también aparecen sus precuelas, secuelas, OVAs y películas, sin llenar la
  lista de animes que no tienen nada que ver
* 📺 Reproducción directa con **mpv**
* ⏭️ Navegación entre episodios (siguiente / anterior)
* 💾 Guarda automáticamente el último episodio visto
* 🔄 Auto-actualización del script
* ⚡ Interfaz interactiva con **fzf**
* 🧠 Fallback automático entre servidores de vídeo
* 📦 Compatible con múltiples distribuciones Linux

---

## ⚡ Instalación

### Instalación rápida (un solo comando)

```bash
curl -fsSL https://raw.githubusercontent.com/rlssj/ani-neko/main/install.sh | bash
```

El instalador comprueba e instala las dependencias que falten y deja `ani-neko`
disponible en el PATH (en `~/.local/bin`, sin necesidad de sudo).

Después podrás usar:

```bash
ani-neko
```

<details><summary>Linux (clonando el repositorio)</summary>

```bash
git clone https://github.com/rlssj/ani-neko.git
cd ani-neko
chmod +x install.sh
./install.sh
```

Después podrás usar:

```bash
ani-neko
```

</details>

<details><summary>Windows (WSL)</summary>

Abre Powershell y pega esto

```bash
wsl --install
```

Reinicia el ordenador y luego en Powershell ejecuta:

```bash
wsl --install -d Ubuntu
```

Después, dentro de Ubuntu:

```bash
cd ~/
git clone https://github.com/rlssj/ani-neko.git
cd ani-neko
chmod +x install.sh
./install.sh
```

### ⚠️ Nota sobre mpv
Para poder usar mpv has de descargarlo desde su [página oficial](https://mpv.io/installation/)
y añadirlo al PATH de Windows.

Ya podrás ejecutarlo desde el CMD de Windows usando:

```bash
wsl ani-neko
```

</details>

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

* Debian / Ubuntu
* Fedora / RHEL / CentOS
* Arch Linux
* openSUSE

Gestores soportados:

* `apt-get`
* `dnf`
* `yum`
* `pacman`
* `zypper`

---

## 🔧 Dependencias

* `python3`
* `mpv`
* `fzf`
* `wget`
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

Para que puedas continuar fácilmente después.

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

## ❤️ Contribuir

Las contribuciones son bienvenidas:

* Reportar bugs
* Sugerir features
* Hacer pull requests

---

## 🙏 Créditos

Basado en [ani-es](https://github.com/Zhuchii/ani-es) de **Zhuchii**,
a su vez inspirado en [ani-cli](https://github.com/pystardust/ani-cli).

---

## ⭐ Apoya el proyecto

Si te gusta el proyecto, dale una estrella ⭐
