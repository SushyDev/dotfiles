{
	description = "dotfiles";

	outputs = { self }:
		let
			dotfiles = ./.;

			dependencyPackages = pkgs: [
				pkgs.git
				pkgs.difftastic
				pkgs.fd
				pkgs.fnm
				pkgs.fzf
				pkgs.neovim
				pkgs.nodejs
				pkgs.ripgrep
				pkgs.tmux
			];
		in
		{	
			homeManagerModules.default = { config, lib, pkgs, ... }: {
				options = {
					dotfiles.enable = lib.mkOption {
						type = lib.types.bool;
						default = false;
						description = "Enable my custom configuration.";
					};
				};

				config = lib.mkIf config.dotfiles.enable {
					home.packages = dependencyPackages pkgs;

					home.activation.installDotfiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
						PATH="${pkgs.git}/bin:${pkgs.stow}/bin:$PATH" \
						DOTFILES_DIR="${dotfiles}" \
						XDG_CONFIG_HOME="${config.xdg.configHome}" \
						XDG_STATE_HOME="${config.xdg.stateHome}" \
						${dotfiles}/activate.sh;
					'';

					programs.zsh = {
						enable = true;
						dotDir = "${config.xdg.configHome}/zsh";
						profileExtra = ". ${dotfiles}/.config/zsh/.zshrc";
					};

					programs.git = {
						enable = true;
						includes = [
						{
							path = "${dotfiles}/.config/git/config";
						}
						];
					};
				};
			};
		};
}
