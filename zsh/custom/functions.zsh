function d2u() {
	git config core.autocrlf false
	git rm --cached -r .
	git reset --hard
}

function u2d() {
	git config core.autocrlf true
	git rm --cached -r .
	git reset --hard
}

function new() {
	NAME=$(basename $1)
	tmux new-session -d -s $NAME -c $1
	tmux switch-client -t $NAME
}

function dev() {
	PROJECT=$(ls $PROJECTS | fzf --height 50% --border --prompt='Project: ')
	[ -z "$PROJECT" ] || new $PROJECTS/$PROJECT
}

function ch() {
	history 1 | awk '{$1=""; print $0}' | fzf | xargs | pbcopy
}
