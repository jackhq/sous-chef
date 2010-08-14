# Sous-Chef

A simple chef cookbook repository that can get you cooking locally with chef from opscode.

## Status

The current status of this project is FUNCTIONAL, but it has not gone through any testing other than personal use.

Please use at your own risk...Don't hesitate to leave a comment or submit a pull request 

## Description

Sous-Chef, contains a recipe called create_recipe, which basically creates a scaffold of a cookbook.

It creates:

* metadata.rb
* readme.md
* recipes/default.rb
* attributes/[cookbook_name].rb
* files/default
* templates/default


## How does it work?

* Install chef on your machine, hopefully you have at least ruby 1.8.7 installed.

      gem install chef
    
* git this project, fork it our clone it:

      git clone git://github.com/jackhq/sous-chef.git
    
* open the solo.rb file and edit your paths in perspective to where you placed this cookbook repo

      file_cache_path "[your folder]/sous-chef"
      cookbook_path ["[your folder]/sous-chef/cookbooks","[your folder]/sous-chef/site-cookbooks"]

* in the dna folder modify the create_recipe.json file to your machine specs

      {
        "run_list": ["recipe[create_recipe]"],
        "owner": "[YOU]",
        "group": "[GROUP]",
        "location": "[your folder]/sous-chef/site-cookbooks",
        "recipe_name": "[NAME of Your New Recipe]",
        "recipe_description": "[Description of your new recipe]"
      }


* Run Chef-Solo and generate your scaffold of your new chef recipe

      chef-solo -c solo.rb -j dna/create_recipe.json
    
    
## Congratulations! You should now have a Recipe Scaffold ready to go!


## What are other things I can do with Sous-Chef?

* you can archive your cookbooks

      rake chef:tar

* you can push them to amazon s3 (Edit Rackfile with your bucket of choice)

      rake chef:push
    
* you can create deployment json files and remotely deploy to servers:

check out solid at [http://github.com/jackhq/solid](http://github.com/jackhq/solid)

