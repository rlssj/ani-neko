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

</details>

<details><summary>Windows (WSL)</summary>

```bash
wsl --install
```

Reinicia y luego, dentro de Ubuntu:

```bash
cd ~/
git clone https://github.com/rlssj/ani-neko.git
cd ani-neko
chmod +x install.sh
./install.sh
```

### ⚠️ Nota sobre mpv
Descarga mpv desde su [página oficial](https://mpv.io/installation/) y añádelo
al PATH de Windows. Después:

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

Gestores soportados: `apt-get`, `dnf`, `yum`, `pacman`, `zypper`.

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
