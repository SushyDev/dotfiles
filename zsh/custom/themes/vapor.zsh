local user_symbol='%(!.#.$)'
local reset_color="%F{015}%"
local return_code="%F{009}%(?..%? ↵%{$reset_color})"
local user_host="%F{213}%n@%m%{$reset_color}"
local current_dir="%F{045}%~%{$reset_color}"

precmd() {
	local vcs_branch=$(git_prompt_info)

	PROMPT="╭${user_host} ${current_dir} ${vcs_branch}
╰${user_symbol} "
}

RPROMPT="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{202}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color}"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{011}●% %F{202}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{010}●% %F{202}"
