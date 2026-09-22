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
						default = "";
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
							default = "";
							description = "SSH signing program for git";
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
							default = "";
							description = "Path to the SSH identity agent socket";
						};
					};
				};
			};

			config = 
				let
					dotfilesPath = ./.;
					mkIfNotEmptyString = str: lib.mkIf (str != "") str;

					basePackages = [
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

					linuxPackages = [
						pkgs.wl-clipboard-rs
					];
				in
				lib.mkIf config.dotfiles.enable {
					home.packages = basePackages ++ lib.optionals pkgs.stdenv.isLinux linuxPackages;

					home.activation.installDotfiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
						PATH="${pkgs.git}/bin:${pkgs.stow}/bin:$PATH" \
						XDG_CONFIG_HOME="${config.xdg.configHome}" \
						XDG_STATE_HOME="${config.xdg.stateHome}" \
						DOTFILES_DIR="${dotfilesPath}" \
						${dotfilesPath}/scripts/activate.sh;
					'';

					programs.zsh = lib.mkIf config.dotfiles.zsh.enable {
						enable = true;
						enableCompletion = true;
						dotDir = "${config.xdg.configHome}/zsh";
						initContent = ". ${dotfilesPath}/.config/zsh/.zshrc";
					};

					programs.git = lib.mkIf config.dotfiles.git.enable {
						enable = true;
						includes = [
							{
								path = "${dotfilesPath}/.config/git/config";
							}
						];
						signing = {
							format = "ssh";
							signer = mkIfNotEmptyString config.dotfiles.git.sshSignPackage;
						};
						settings = {
							safe.directory = mkIfNotEmptyString config.dotfiles.systemFlakePath;

							commit = {
								gpgsign = true;
							};
						};
					};

					programs.ssh = lib.mkIf config.dotfiles.ssh.enable {
						enable = true;
						enableDefaultConfig = false;
						includes = [
							"${config.xdg.configHome}/ssh/extra_config"
						];
						settings."*".IdentityAgent = lib.mkIf (config.dotfiles.ssh.identityAgentPath != "") ''"${config.dotfiles.ssh.identityAgentPath}"'';
					};
				};
		};
	};
}
