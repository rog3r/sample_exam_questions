ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' # Set up gems listed in the Gemfile.


#Hack para habilitar acesso remoto ou usar "rails s -b 0.0.0.0"
# http://fullstacknotes.com/make-rails-4-2-listen-to-all-interface/
require 'rubygems'
require 'rails/commands/server'

module Rails
  class Server
    alias :default_options_bk :default_options
    def default_options
      default_options_bk.merge!(Host: '0.0.0.0')
    end
  end
end