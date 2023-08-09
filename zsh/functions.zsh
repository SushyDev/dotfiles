function d2u() {
	git config core.autocrlf false
	git rm --cached -r .
	git reset --hard
}


function tap-sync() {
	ddev magento adwise:dbsync:config:import .config.local.json --skip-denylist
	ddev magento cache:flush
	ddev auth ssh
	ddev exec vendor/bin/tap-sync.sh $1 $2
}
