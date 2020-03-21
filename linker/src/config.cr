require "yaml"

module Linker
  class Config
    alias GroupOption = String | Array(String)

    include YAML::Serializable

    getter name : String
    getter path : String
    getter groups : GroupOption?

    def self.parse(path)
      Array(self).from_yaml(File.read(path))
    end
  end
end
