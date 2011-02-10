require 'rubygems'
require 'active_resource'

SLICE_PUBLIC_IP = "184.106.151.168"
api = "234fc1901b2ac939f78313c659a0ee26be5306ebbb6451d617ddfe5ab443d35a"
SITE_URL = "https://#{api}@api.slicehost.com/"

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
