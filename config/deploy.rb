require 'bundler/capistrano' # for bundler support

set :application, "nomdeplume"
set :repository,  "git@github.com:picodegallo/nom-de-plume.git"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts
set :user, 'hemingway'
set :deploy_to, "/home/#{ user }/#{ application }"
set :use_sudo, false

set :scm, :git

# load "config/recipes/faye"

default_run_options[:pty] = true

role :web, "192.241.168.144"                          # Your HTTP server, Apache/etc
role :app, "192.241.168.144"                          # This may be the same as your `Web` server
role :db, "192.241.168.144", :primary => true                          # This may be the same as your `Web` server

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
before 'deploy:assets:precompile', 'deploy:symlink_config'
# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts


# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :symlink_config, :roles => :app do 
    run "ln -nfs #{shared_path}/application.yml #{current_release}/config/application.yml"
    run "ln -nfs #{shared_path}/database.yml #{current_release}/config/database.yml"

  end

end

