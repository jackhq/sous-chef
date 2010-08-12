#
# Author:: Benjamin Black (<b@b3k.us>)
# Cookbook Name:: riak
#
# Copyright (c) 2010 Basho Technologies, Inc.
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
#

set_unless[:riak][:kv][:raw_name] = "riak"
set_unless[:riak][:kv][:storage_backend] = :riak_kv_bitcask_backend
node[:riak][:kv][:storage_backend] = node[:riak][:kv][:storage_backend].to_s.to_sym
set_unless[:riak][:kv][:riak_stat_enabled] = true
set_unless[:riak][:kv][:pb_ip] = "0.0.0.0"
set_unless[:riak][:kv][:pb_port] = 8087
set_unless[:riak][:kv][:mapred_name] = "mapred"
set_unless[:riak][:kv][:handoff_port] = 8099
set_unless[:riak][:kv][:js_vm_count] = 8
