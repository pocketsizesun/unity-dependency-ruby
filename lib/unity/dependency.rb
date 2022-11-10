# frozen_string_literal: true

require_relative "dependency/version"

module Unity
  module Dependency
    class Error < StandardError; end

    # @return [Hash<String, self>]
    def __dependency_thread_instances__
      Thread.current[:__dependency_thread_instances__] ||= {}
    end

    # @return [self]
    def use
      instance
    end

    # @return [self]
    def instance
      instances = __dependency_thread_instances__
      return instances[self.class] if instances.key?(self.class)

      instances[name] = new
    end
  end
end
