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
	NAME=$1
	DIR=$2
	tmux new-session -d -A -s $NAME -c $DIR
	tmux switch-client -t $NAME
}

function dev() {
	NAME=$(ls $1 | fzf)
	DIR=$1/$NAME
	new $NAME $DIR
}
