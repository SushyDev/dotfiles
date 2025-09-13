# Dotfiles

Minimal dotfiles optimizing efficiency, screen real-estate and removing distractions. This repository contains configurations for various development tools to create a cohesive and efficient workflow. You can find additional README's inside each repository (Look in the .config directory)

## Tools

- **[zsh](https://github.com/zsh-users/zsh)** - Shell with productivity enhancements
  - Plugins: fast-syntax-highlighting, zsh-autocomplete, zsh-autosuggestions
- **[tmux](https://github.com/tmux/tmux)** - Terminal multiplexer with vim-like keybindings
  - Themes: monochromatic, vapor
- **[neovim](https://neovim.io)** - Text editor with extensive plugin ecosystem
  - Plugin manager: lazy.nvim
  - Core plugins: telescope, lsp, treesitter, copilot, git integration, debugging, tmux integration
- **[ghostty](https://ghostty.org/)** - Fast, native terminal emulator
- **[git](https://git-scm.com/)** - Version control with enhanced diff visualization
  - Uses difftastic for improved diffs
  - Custom hooks for commit message formatting
- **[ideavim](https://github.com/JetBrains/ideavim)** - Vim emulation in IntelliJ IDEA
  - Plugins: vim-surround, nerdtree, vim-highlightedyank

## Integrations

- **GitHub Codespaces**: Try most configs such as tmux, neovim and the shell in Codespaces
  - Configure your terminal profile to start as interactive login shell:
    ```json
    "terminal.integrated.profiles.linux": {
        "zsh": {
            "path": "zsh",
            "args": ["-l", "-i"]
        },
    }
    ```
  - Or [configure your dotfiles for codespaces](https://github.com/settings/codespaces) to this repo
  - Start a codespace in this repo and run the [activation script](scripts/activate.sh)
- **Nix**: Declarative dependency management and configuration

## Configuration

- Custom configurations for each tool optimized for productivity
- Vim-like keybindings across tools
- Theme consistency with monochromatic and vapor options

## System Dependencies

### Required

These must be installed for the dotfiles to function properly:

- **zsh** - Core shell environment
- **git** - Version control system (required for git integration in zsh prompt and neovim)
- **difftastic** - Enhanced diff visualization for git
- **tmux** - Terminal multiplexer
- **neovim** - Primary text editor
- **nodejs** - Required for Neovim LSP servers (TypeScript/JavaScript/Vue), ESLint, CSS/HTML LSP, and GitHub Copilot
- **ripgrep (rg)** - Required for Neovim Telescope live grep functionality
- **make** - Required to build Neovim's telescope-fzf-native plugin for improved performance

### Optional Dependencies

These enhance functionality but are not strictly required:

- **nix** - Package manager for declarative dependency management and zsh integration
- **fd** - Faster file finding for Neovim Telescope (falls back to `find` if not available)
- **fzf** - Fuzzy finder for project selection in zsh session management
- **fnm** - Node.js version manager (alternative to nvm)
- **Rust** - Required only for Rust LSP (rust_analyzer) and fuzzy matching in Neovim's blink.cmp
- **Go** - Required only for Go LSP (gopls)

## Installation

### Nix (Recommended - Simplest)
If you use Nix with home-manager:

1. Add this flake to your `flake.nix`:
```nix
{
  inputs.dotfiles = {
    type = "git";
    url = "https://github.com/sushydev/dotfiles";
    submodules = true;
  };

  outputs = { self, dotfiles, ... }: {
    # ... your existing outputs
  };
}
```

2. In your `home.nix`, add:
```nix
{
  imports = [ inputs.dotfiles.homeManagerModules.default ];

  dotfiles.enable = true;
}
```

This automatically installs dependencies (git, neovim, tmux, etc.) and sets up all symlinks.

### Manual
For manual installation, you will need to ensure that the required dependencies are installed on your system. The dotfiles will utilize your installed packages, but any missing dependencies must be installed manually.
Install these using your system's package manager (apt, brew, etc.) before proceeding with the dotfiles setup.

You can use [scripts/activate.sh](scripts/activate.sh) to setup the symlinks for all the dotfiles using `stow`,
it will also write an uninstall script in `$XDG_CONFIG_HOME/dotfiles/uninstall.sh`
