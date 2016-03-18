rebase() { git wip; git checkout master; git pull; git checkout $1; git pull --rebase origin master; git push -f; git checkout master; };
cde() { cd ~/github/espark/; if [ $# -eq 1 ]; then cd $1; fi };
alias prod-console="ssh console.esparklearning.com -t \"sudo -u deploy /home/dean/console.sh\""
