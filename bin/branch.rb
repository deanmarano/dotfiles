require 'pry'

branches = `git branch`
branches.split.reject { |b| ['develop', 'master', '*'].include? b }.each do |branch|
  `git checkout #{branch}`
  `git pull --rebase --ff-only origin develop`
  `git rebase --abort`
end
`git checkout develop`
`git merged`
