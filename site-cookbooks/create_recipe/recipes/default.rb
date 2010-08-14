directory"#{node[:location]}/#{node[:recipe_name]}"  do
  owner node[:owner]
  group node[:group]
  action :create
end

%w{ recipes attributes files templates }.each do |sub_folder|
  directory "#{node[:location]}/#{node[:recipe_name]}/#{sub_folder}" do
    owner node[:owner]
    group node[:group]
    action :create
  end
end

%w{ files templates }.each do |sub_folder|
  directory "#{node[:location]}/#{node[:recipe_name]}/#{sub_folder}/default" do
    owner node[:owner]
    group node[:group]
    action :create
  end
end

bash "create default files" do 
  cwd "#{node[:location]}/#{node[:recipe_name]}"
  code <<-EOH
    touch attributes/#{node[:recipe_name]}.rb
    touch recipes/default.rb
    chown #{node[:owner]}:#{node[:group]} attributes/#{node[:recipe_name]}.rb
    chown #{node[:owner]}:#{node[:group]} recipes/default.rb
     
  EOH
end

template "#{node[:location]}/#{node[:recipe_name]}/metadata.rb" do
  source "metadata.rb.erb"
  owner node[:owner]
  group node[:group]
  
end

template "#{node[:location]}/#{node[:recipe_name]}/readme.md" do
  source "readme.md.erb"
  owner node[:owner]
  group node[:group]

end

