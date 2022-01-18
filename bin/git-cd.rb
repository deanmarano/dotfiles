#! /usr/bin/ruby

def root_path
  Dir.home
end

def default_remote
  File.join(root_path, "github")
end

pwd = Dir.pwd

remote_dir = nil
user_dir = nil
user_name = nil
project_dir = nil
project_name = nil

case ARGV.length
when 0
  # program
  puts "some help here"
  # option to create starter config file
when 1
  # user/project
  remote_dir = default_remote
  user_name = ARGV[0].split("/").first
  project_name = ARGV[0].split("/").last
when 2
  # user project
  remote_dir = default_remote
  user_name = ARGV[0]
  project_name = ARGV[1]

  # remote dir/project
  if ARGV[1].include?('/')
    user_name = ARGV[1].split('/').first
    project_name = ARGV[1].split('/').last
  end
when 3
  # program remote dir project
  remote_dir = File.join(root_path, ARGV[0])
  project_name = ARGV[2]
end

user_dir = File.join(remote_dir, user_name)
project_dir = File.join(user_dir, project_name)

# puts remote_dir
# puts dir
# puts project_dir


Dir.mkdir(remote_dir, 0o0700) unless Dir.exist?(remote_dir)

Dir.mkdir(user_dir, 0o0700) unless Dir.exist?(user_dir)

if Dir.exist?(project_dir)
  Dir.chdir(user_dir)
  puts "cd #{project_dir}"
else
  Dir.chdir(user_dir)
  clone_url = "git@github.com:#{user_name}/#{project_name}.git"
  command = "git clone #{clone_url}"
  result = `#{command}`
  if $?.success?
    puts "cd #{project_dir}"
  else
    raise command
  end
end
