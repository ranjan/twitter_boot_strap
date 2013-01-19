role :app, "192.34.60.3"
role :web, "192.34.60.3"
role :db, "192.34.60.3", :primary => true
set :rails_env, 'production'
set :branch, 'master'
set :deploy_to, "/root/production/#{application}"

after "deploy:create_symlink", :link_production_env

desc "Replacing Production.rb"
task :link_production_env do
  if File.exists?("#{shared_path}/config/production.rb")
    run "ln -nfs #{deploy_to}/shared/config/production.rb #{release_path}/config/environments/production.rb"
  end
end
