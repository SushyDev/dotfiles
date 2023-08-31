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
	tmux new-session -d -A -s $1 -c $2
	tmux switch-client -t $1
}

function dev() {
	NAME=$(ls $PROJECTS | fzf)
	DIR=$1/$NAME
	new $NAME $DIR
}
