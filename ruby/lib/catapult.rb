require 'fileutils'
require 'mustache'
require 'yaml'
module Catapult
  require_relative('catapult/global')
  # global must go first
  require_relative('catapult/addresses')
  require_relative('catapult/config')

  BASE_CONFIG_SOURCE_DIR  = File.expand_path('../catapult-templates', File.dirname(__FILE__))
  
  def self.base_config_source_dir
    BASE_CONFIG_SOURCE_DIR
  end

  def self.bind_mustache_variables(template, template_attributes_hash)
    ret = ::Mustache.render(template, template_attributes_hash)
    ret.gsub('&#39;',"'") # protection around ::Mustache.render "'" to '&#39;'
  end
end
