require "yaml"

module OpenVPN
  class Config
    def self.parse!(path)
      new.parse!(path)
    end

    def parse!(path)
      YAML.parse(File.read(path)).as_h.each_with_object({} of String => String) do |(name_node, path_node), accumulator|
        name = name_node.as_s
        path = File.expand_path(path_node.as_s, home: true)

        raise "File '#{path}' not found!" unless File.exists?(path)

        accumulator[name] = path
      end
    end
  end
end
