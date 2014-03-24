function current_git_branch {
  git symbolic-ref HEAD | sed 's/refs\/heads\///'
}

# Assumes GIT URLS. No support for HTTPS
function git_repo_url {
  git config --get remote.origin.url | sed 's/git@/https:\/\//' | sed 's/com:/com\//' | sed 's/.git$//'
}

function open_branch_url {
  github_pull_request_url="`git_repo_url`/pull/new/"
  current_branch=$1
  open "$github_pull_request_url$current_branch"
}

function git_push_open {
  branch_name=$1
  if [ -z "$branch_name" ]; then
    branch_name=`current_git_branch`
  fi
  git push origin HEAD:$branch_name && open_branch_url $branch_name
}

alias gpush="git_push_open"
alias gopen="git_repo_url | xargs open"
