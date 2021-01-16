require "file_utils"
require "./command"

module Linker
  module Commands
    class Link < Command
      def run
        config.each do |option|
          path = File.expand_path(option.path, home: true)

          link(path, options.destination)

          link_by_group(option.groups, path)
        end
      end

      private def link(path : String, destination_dir : String)
        FileUtils.mkdir_p(destination_dir) unless Dir.exists?(destination_dir)
        FileUtils.ln_s(path, destination_dir) if Dir.exists?(path)
      end

      private def link_by_group(group : Nil, path : String)
      end

      private def link_by_group(group : String, path : String)
        link(path, "#{options.destination}/#{group}")
      end

      private def link_by_group(groups : Array(String), path : String)
        groups.each { |group| link_by_group(group, path) }
      end
    end
  end
end
