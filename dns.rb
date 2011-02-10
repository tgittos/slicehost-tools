require 'rubygems'
require 'active_resource'
require 'config'

class Slice < ActiveResource::Base
  self.site = SITE_URL
end
class Address < String; end

class Zone < ActiveResource::Base
  self.site = SITE_URL
end
class Record < ActiveResource::Base
  self.site = SITE_URL
end
