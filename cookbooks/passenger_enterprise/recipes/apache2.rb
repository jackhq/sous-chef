#
# Cookbook Name:: passenger_enterprise
# Based on passenger_apache2
# Recipe:: apache2
#
# Author:: Joshua Timberman (<joshua@opscode.com>)
# Author:: Joshua Sierles (<joshua@37signals.com>)
# Author:: Michael Hale (<mikehale@gmail.com>)
#
# Copyright:: 2009, Opscode, Inc
# Copyright:: 2009, 37signals
# Coprighty:: 2009, Michael Hale
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe "passenger_enterprise"
include_recipe "apache2"

%w{ apache2-threaded-dev libapr1-dev libaprutil1-dev }.each do |pkg|
  package pkg do
    action :install
  end
end

execute "passenger_apache2_module" do
  command "#{node[:ruby_enterprise][:install_path]}/bin/passenger-install-apache2-module -a"
  creates node[:passenger_enterprise][:module_path]
end

template "#{node[:apache][:dir]}/mods-available/passenger.load" do
  source "passenger.load.erb"
  owner "root"
  group "root"
  mode 0755
end

template "#{node[:apache][:dir]}/mods-available/passenger.conf" do
  source "passenger.conf.erb"
  owner "root"
  group "root"
  mode 0755
end

apache_module "passenger"
