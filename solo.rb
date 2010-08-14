require 'fileutils'
cur_dir FileUtils.pwd
file_cache_path cur_dir
cookbook_path [cur_dir + "/site-cookbooks"]
