# Require core library
require 'middleman-core'
require 'thor'

module Holoman
  #ROOT = File.expand_path('../../', __FILE__)
  ROOT_PATH = Pathname(__FILE__).dirname.expand_path

  autoload :VERSION,  'holoman/version.rb'
  autoload :ExitCode, 'holoman/exit_code.rb'
  autoload :CLI,      'holoman/cli.rb'

  #def self.root_path(*a)
  #  File.join ROOT, *a
  #end
  def self.root
    @root ||= Pathname(__FILE__).dirname.expand_path
  end
end

# Register extensions which can be activated
# Make sure we have the version of Middleman we expect
# Name param may be omited, it will default to underscored
# version of class name
require 'holoman/extension'
::Holoman::Extension.register(:holoman)

