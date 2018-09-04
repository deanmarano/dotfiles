require 'pry'

branches = `git branch`
branches.split.reject { |b| ['master', '*'].include? b }.each do |branch|
  `git checkout #{branch}`
  `git pull --rebase --ff-only origin master`
  `git rebase --abort`
end
`git checkout master`
`git merged`
