require 'pry'

branches = `git branch`
to_delete = []
branches.split.reject { |b| ['develop', 'master', '*'].include? b }.each do |branch|
  result = `git checkout #{branch}`
  if (result.match? "upstream is gone")
    to_delete << branch
  else
    `git pull --rebase --ff-only origin develop`
    `git rebase --abort`
  end
end
`git checkout develop`
`git merged`
to_delete.each { |b| `git branch -D #{b}`}
