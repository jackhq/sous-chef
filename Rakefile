require 'aws/s3'
namespace :chef do
  desc "tar"
  task :tar do
    system "tar zcvf sous-chef.tar.gz ./cookbooks ./site-cookbooks"
  end
  
  # change to jackhq your aws bucket...
  desc "push"
  task :push do
    AWS::S3::Base.establish_connection!(
      :access_key_id     => ENV['AMAZON_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AMAZON_SECRET_ACCESS_KEY']
    )
    AWS::S3::S3Object.store('sous-chef.tar.gz', open('sous-chef.tar.gz'), 'jackhq', :access => :public_read)
    puts "uploaded to s3...."
  end
end