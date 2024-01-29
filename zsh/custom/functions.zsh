function d2u() {
	git config core.autocrlf false
	git rm --cached -r .
	git reset --hard
}

compdef {} d2u

function u2d() {
	git config core.autocrlf true
	git rm --cached -r .
	git reset --hard
}

compdef {} u2d

function new() {
	NAME=$(basename $1)
	tmux new-session -d -s $NAME -c $1
	tmux switch-client -t $NAME
}

_new() {
	local -a arguments
	arguments=('1:directory:_path_files -/')
	_arguments $arguments
}

compdef _new new

function dev() {
	PROJECT=$(find $PROJECTS -mindepth 1 -maxdepth 1 -type d | fzf --height 30% --reverse)
	[ -z "$PROJECT" ] || new $PROJECT
}

compdef {} dev

function ch() {
	history 1 | awk '{$1=""; print $0}' | fzf | xargs | pbcopy
}

compdef {} ch

function clean-pkgx() {
	sudo rm /usr/local/bin/pkgx
	rm -rf ~/.pkgx
}

compdef {} clean-pkgx

function init() {
	if [ "$1" = 'off' ]
	then
		_pkgx_dev_off
	elif type _pkgx_dev_off > /dev/null 2>&1
	then
		echo 'dev: environment already active' >&2
		return 1
	else
		if type _pkgx_reset > /dev/null 2>&1
		then
			_pkgx_reset
		fi
		eval "$(command pkgx --internal.activate "$PWD" "$@")"
	fi
}

compdef {} init
