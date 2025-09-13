# Git

This repository contains custom Git configuration settings for dotfiles management.

## Dependencies
- Uses `difft` as the external diff tool for enhanced diff visualization.

## Core Settings
- `preloadindex = true`: Speeds up Git operations by preloading the index.
- `hooksPath = ~/.config/git/hooks`: Load githooks (Assumes repository has been cloned in `~/.config/git`

## Hooks
- `prepare-commit-msg`: Automatically prepends JIRA ticket numbers (e.g., PROJ-123) from branch names to commit messages.

## GPG Signing
- Enabled with SSH format using 1Password's op-ssh-sign program.
- MacOS: Requires setting launchctl thing (TODO Docs)

## URL Aliases
- `github:` → `git@github.com:`
- `sushydev:` → `git@github.com:SushyDev/`

## Other Settings
- Auto-setup remote on push, rebase on pull, warnings for missing commits.
- Includes user-specific config from `~/.config/git/user`.
- Safe directories for Nix-related paths.
