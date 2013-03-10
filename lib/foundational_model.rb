lib = File.expand_path File.dirname(__FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'foundational/model/version'
require 'foundational/model/model'
