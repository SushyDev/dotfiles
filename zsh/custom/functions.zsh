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
	PROJECT=$(ls $PROJECTS | fzf --height 30%)
	[ -z "$PROJECT" ] || new $PROJECTS/$PROJECT
}

compdef {} dev

function ch() {
	history 1 | awk '{$1=""; print $0}' | fzf | xargs | pbcopy
}

compdef {} ch
