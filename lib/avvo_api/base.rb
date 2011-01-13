# The class that all AvvoApi resources should inherit from. This
# class fixes and patches over a lot of the broken stuff in
# Active Resource, and the differences between the client-side Rails
# REST stuff and the server-side Rails REST stuff.
require 'reactive_resource'

module AvvoApi
  class Base < ReactiveResource::Base

    API_VERSION = 1
    
    self.site = "https://api.avvo.com/"
    self.prefix = "/api/#{API_VERSION}/"
    self.format = :json
    
  end
end
