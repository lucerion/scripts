require "yaml"

module OpenVPN
  class Config < Hash(String, String)
    def self.from_yaml(yaml : String) : self
      new.from_yaml(yaml)
    end

    def from_yaml(yaml : String) : self
      YAML.parse(yaml).as_h.each_with_object(self) do |(name_node, path_node), accumulator|
        name = name_node.as_s
        path = File.expand_path(path_node.as_s, home: true)

        raise "File '#{path}' not found!" unless File.exists?(path)

        accumulator[name] = path
      end
    end
  end
end
