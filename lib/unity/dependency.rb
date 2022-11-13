# frozen_string_literal: true

require_relative "dependency/version"

module Unity
  module Dependency
    class Error < StandardError; end

    # @return [Hash<String, self>]
    def __dependency_thread_instances__
      Thread.current[:__dependency_thread_instances__] ||= {}
    end

    # Returns an instance of self attached to the current thread
    # @return [self]
    def instance
      instances = __dependency_thread_instances__
      klass_name = self.name
      return instances[klass_name] if instances.key?(klass_name)

      instances[klass_name] = new
    end
  end
end
