{
	description = "dotfiles";

	outputs = { self }: {	
		homeManagerModules.default = { config, lib, pkgs, ... }: {
			options = {
				dotfiles = {
					enable = lib.mkOption {
						type = lib.types.bool;
						default = false;
						description = "Enable dotfiles";
					};
					systemFlakePath = lib.mkOption {
						type = lib.types.str;
						default = "/etc/nixos";
						description = "Path to the system flake";
					};
					zsh = {
						enable = lib.mkOption {
							type = lib.types.bool;
							default = true;
							description = "Enable zsh configuration";
						};
					};
					git = {
						enable = lib.mkOption {
							type = lib.types.bool;
							default = true;
							description = "Enable git configuration";
						};
						sshSignPackage = lib.mkOption {
							type = lib.types.str;
							default = lib.getExe' pkgs._1password-gui "op-ssh-sign";
							description = "The 1Password package to use";
						};
					};
					ssh = {
						enable = lib.mkOption {
							type = lib.types.bool;
							default = true;
							description = "Enable SSH configuration";
						};
						identityAgentPath = lib.mkOption {
							type = lib.types.str;
							default = "~/.1password/agent.sock";
							description = "Path to the SSH identity agent socket";
						};
					};
				};
			};

			config = 
				let
					dotfilesPath = ./.;
					mkIfNotEmptyString = str: lib.mkIf (str != "") str;
				in
				lib.mkIf config.dotfiles.enable {
					# TODO: Base dependencies off of `<module>.enabled`
					home.packages = [
						pkgs.difftastic
						pkgs.fd
						pkgs.fnm
						pkgs.fzf
						pkgs.git
						pkgs.neovim
						pkgs.nodejs
						pkgs.ripgrep
						pkgs.tmux
					];

					home.activation.installDotfiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
						PATH="${pkgs.git}/bin:${pkgs.stow}/bin:$PATH" \
						XDG_CONFIG_HOME="${config.xdg.configHome}" \
						XDG_STATE_HOME="${config.xdg.stateHome}" \
						DOTFILES_DIR="${dotfilesPath}" \
						${dotfilesPath}/scripts/activate.sh;
					'';

					programs.zsh = lib.mkIf config.dotfiles.zsh.enable {
						enable = true;
						dotDir = "${config.xdg.configHome}/zsh";
						profileExtra = ". ${dotfilesPath}/.config/zsh/.zshrc";
					};

					programs.git = lib.mkIf config.dotfiles.git.enable {
						enable = true;
						includes = [
							{
								path = "${dotfilesPath}/.config/git/config";
							}
						];
						extraConfig = {
							safe.directory = mkIfNotEmptyString config.dotfiles.systemFlakePath;

							gpg = {
								format = "ssh";
							};
							"gpg \"ssh\"" = {
								program = mkIfNotEmptyString config.dotfiles.git.sshSignPackage;
							};
							commit = {
								gpgsign = true;
							};
						};
					};

					programs.ssh = lib.mkIf config.dotfiles.ssh.enable {
						enable = true;
						enableDefaultConfig = false;
						includes = [
							"~/.config/ssh/extra_config"
						];
						matchBlocks = {
							"*" = {
								identityAgent = mkIfNotEmptyString config.dotfiles.ssh.identityAgentPath;
							};
						};
					};
				};
		};
	};
}
