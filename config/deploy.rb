# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# set :deploy_to, '/var/www/my_app'
# set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

# config valid only for Capistrano 3.1
lock '3.4.0'
set :application, 'School'
set :repo_url, 'git@github.com:roomaroom/event-registration.git'
set :shared_path, "/home/school/production/school/shared"
set :branch, 'master'
set :scm, :git
set :deploy_to, '/home/school/production/school'
# set :format, :pretty
# set :pty, true
set :preload_app, true
set :default_stage, 'production'
set :rails_env, "production"
#set :use_sudo, false
#set :deploy_via, :copy
set :deploy_via, :remote_cache
#set :log_level, :info
set :linked_files, %w(config/database.yml)
# Default value for :scm is :git
# set :scm, :git
set :unicorn_config_path, "/home/school/production/school/shared/config/unicorn.rb"
set :unicorn_pid, "/home/school/production/school/shared/pids/unicorn.pid"
set :linked_dirs, %w{ bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads }
# Default value for :format is :pretty
# set :format, :pretty
#set :port, 2225
# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
