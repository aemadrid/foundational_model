require 'foundational'
require 'virtus'
require 'foundational/model/persistence'

module Foundational
  module Model

    def self.included(klass)
      klass.send :include, Virtus
      klass.send :include, Foundational::Model::Persistence
    end

  end
end
