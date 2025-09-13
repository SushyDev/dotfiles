{
	description = "dotfiles";

	outputs = { self }: {	
		homeManagerModules.default = { config, lib, pkgs, ... }: {
			options = {
				dotfiles.enable = lib.mkOption {
					type = lib.types.bool;
					default = false;
					description = "Enable dotfiles";
				};
			};

			config = 
				let
					dotfilesPath = ./.;
				in
				lib.mkIf config.dotfiles.enable {
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

					programs.zsh = {
						enable = true;
						dotDir = "${config.xdg.configHome}/zsh";
						profileExtra = ". ${dotfilesPath}/.config/zsh/.zshrc";
					};

					programs.git = {
						enable = true;
						includes = [
							{
								path = "${dotfilesPath}/.config/git/config";
							}
						];
					};
				};
		};
	};
}
