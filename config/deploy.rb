require 'capistrano/ext/multistage'
set :stages, %w(staging production development)
set :default_stage, "production"

set :application, "rate"
set :user, "p46649r7"
set :domain, "66.84.0.136"

set :deploy_to, "/home/#{user}/apps/#{application}"   # Where on the server your app will be deployed
set :deploy_via, :checkout                            # For this tutorial, svn checkout will be the deployment method, but check out :remote_cache in the future
set :group_writable, false                            # By default, Capistrano makes the release group-writable. You don't want this with HostingRails
set :shared_config_path, "#{deploy_to}/config"
set :shared_path, "#{deploy_to}/shared"
# set :release_path, "home/#{user}/apps/chef"
# set :shared_config_path, "#{release_path}/config"
set :keep_releases, 2

# Use Git source control
set :scm_username, "greyling.gary@gmail.com"                   #if http
set :scm_password, "kwlw07japp"
set :scm, :git
set :repository, "git@github.com:garygreyling/rate.git"
set :branch, "chef"
set :scm_verbose, true

set :runner, user
set :use_sudo, false
ssh_options[:keys] = %w(/home/p46649r7/.ssh/id_rsa)              # If you are using ssh_keys
default_run_options[:pty] = true

role :app, domain
role :web, domain
role :db,  domain, :primary => true

# namespace :deploy do
#   desc "Restarting passenger with restart.txt"
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "touch #{current_path}/tmp/restart.txt"
#   end
# 
#   [:start, :stop].each do |t|
#     desc "#{t} task is a no-op with mod_rails"
#     task t, :roles => :app do ; end
#   end
# end
# 
namespace :shared do
  desc "Copy shared config files"
  task :copy_config_files, :roles => :app do
    run "cp #{shared_config_path}/* #{deploy_to}/current/config/"
  end
  after "deploy:symlink", "shared:copy_config_files"
  
  desc "Link shared public directories"
  task :link_shared_public_directories do
    %w(photos files).each do |dir|
      run "rm -fr #{deploy_to}/current/public/#{dir}"
      run "ln -s #{shared_path}/public/#{dir}/ #{deploy_to}/current/public/#{dir}"
    end
  end
  after "shared:copy_config_files", "shared:link_shared_public_directories"
end


