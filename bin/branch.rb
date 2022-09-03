require 'pry'

branches = `git branch`
branches.split.reject { |b| ['main', 'trunk', '*'].include? b }.each do |branch|
  `git checkout #{branch}`
  `git pull --rebase --ff-only origin main`
  `git rebase --abort`
end
`git checkout main`
`git merged`
