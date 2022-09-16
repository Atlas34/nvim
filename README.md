## Install nvim latest version

### Install latest release AppImage

The Releases page provides an AppImage that runs on most Linux systems. No installation is needed, just download nvim.appimage and run it. (It might not work if your Linux distribution is more than 4 years old.)

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
```

If the ./nvim.appimage command fails, try:

```bash
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

# Optional: exposing nvim globally.
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
nvim
```

### Install from source

If a package is not provided for your platform, you can build Neovim from source. See Building-Neovim for details. If you have the prerequisites then building is easy:

```bash
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
```

For Unix-like systems this installs Neovim to /usr/local, while for Windows to C:\Program Files. Note, however, that this can complicate uninstallation. The following example avoids this by isolating an installation under $HOME/neovim:

```bash
rm -r build/  # clear the CMake cache
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
make install
export PATH="$HOME/neovim/bin:$PATH"
```

### Uninstall

There is a CMake target to uninstall after make install:

```bash
sudo cmake --build build/ --target uninstall
```

Alternatively, just delete the CMAKE_INSTALL_PREFIX artifacts:

```bash
sudo rm /usr/local/bin/nvim
sudo rm -r /usr/local/share/nvim/
```

## Install my configuration files

Make sure to remove or move your current `nvim` directory located inside ~/,config

**IMPORTANT** Requires [Neovim v0.7.0]](https://github.com/neovim/neovim/releases).  [Upgrade](#upgrade-to-latest-release) if you're on an earlier version. 

```bash
git clone https://github.com/Atlas34/nvim.git ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed 

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim) 

## Install fonts

```bash
cp -rf ~/.config/nvim/fonts ~/.local/share/
```

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste and all tools used by null-ls formatting and linting.

Let's fix them.

### Copy/paste

- On mac `pbcopy` should be builtin

- On Debian distribution type:

  ```bash
  sudo apt install xsel
  ```

- On Arch Linux distribution type 

  ```bash
  sudo pacman -S xsel
  ```

### setup nodejs and npm

Install node-js and npm

- On Debian distribution type:

  ```bash
  sudo apt install nodejs npm
  ```

- On Arch Linux distribution type 

  ```bash
  sudo pacman -S nodejs npm
  ```

Then run npm command to install prettier

**NOTE** to install prettier without sudo previledge, run the following commanads

```bash
npm config set prefix ~/.local/npm/
```

Add the following command to your .zshrc or .bashrc according to your shell to be able to run the program installed using npm from anywhere

```bash
export PATH=$PATH:~/.local/npm/bin
```

### Install Prettier

Open a new terminal to make sure that npm bin folder is part of the PATH and run the following commanad

```bash
npm i -g prettier
```

make sure that prettier is properly install

```bash
prettier --version
```

### Install Black (Python formatter)

**NOTE** black require Python 3.6.2+ and pip

#### Install pip

```bash
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
```

Add the following command to your .zshrc or .bashrc according to your shell to be able to run the program installed using pip from anywhere

```bash
export PATH=$PATH:~/.local/bin
```
#### Install Black

```bash
pip install black
```

### Install flake8 (Python linter)

```bash
pip install flake8
```

### Install stylua (lua formatter)

**NOTE** stylua require rust

#### Install Rust

- on debian distribution type:

  ```bash
  sudo apt install rust
  ```

- on arch linux distribution type 

  ```bash
  sudo pacman -S rust
  ```

#### Install stylua

You can install StyLua using cargo. By default, this builds for just Lua 5.1. You can pass the --features <flag> argument to build for Lua 5.2 (lua52) or Luau (luau)

```bash
cargo install stylua
cargo install stylua --features lua52
cargo install stylua --features luau
```

Add the following command to your .zshrc or .bashrc according to your shell to be able to run the program installed using cargo from anywhere

```bash
export PATH=$PATH:~/.cargo/bin
```

### Install google-java-format

- On Arch Linux distribution type 

  ```bash
  trizen google-java-format
  ```

### Install ripgrep search for telescope

- on debian distribution type:

  ```bash
  sudo apt install ripgrep
  ```

- on arch linux distribution type 

  ```bash
  sudo pacman -S ripgrep
  ```

### Install clangt (C/C++ formatter and linter)

- on debian distribution type:

  ```bash
    sudo apt install clang-tools
    sudo apt install clangd  # on some distributions
  ```

- on arch linux distribution type 

  ```bash
  sudo pacman -S clang
  ```

add a link to the format option file:

```bash
ln -s ~/.config/nvim/lua/atlas/lsp/formats/.clang-format ~/.clang-format
```
