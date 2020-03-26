require "./command"

module OpenVPN
  module Commands
    class Start < Command
      def run
        system("#{@options.bin} --config #{@vpn_config} --writepid #{@pid_file} --daemon")
      end
    end
  end
end
