maintainer "Jack Russell Software Company, LLC"
maintainer_email "team@jackhq.com"
license "Apache 2.0"
long_description IO.read(File.join(File.dirname(__FILE__), 'readme.md'))
version "0.0.1"
recipe "say", "A simple recipe that tells your system to talk"

%w{redhat centos debian ubuntu}.each do |os|
  support os
end
  
