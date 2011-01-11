require 'rubygems'
require 'test/unit'
require 'avvo_api'

require 'shoulda'

require 'webmock/test_unit'
class Test::Unit::TestCase
  include WebMock::API
end

WebMock.disable_net_connect!
