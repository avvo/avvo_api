# A command-line interface to the Avvo API, as an example of how the
# API can be used.
require 'optparse'
require 'avvo_api'

config = YAML.load(File.expand_path("~/.avvo"))
AvvoApi.setup(config[:user], config[:password])


