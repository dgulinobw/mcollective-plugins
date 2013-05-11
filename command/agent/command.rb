require 'rubygems'
require 'open3'

module MCollective
  module Agent
    class Command<RPC::Agent

      action 'execute' do
        begin
          command = request[:command]
          Open3.popen3(command) do |stdin, stdout, stderr|
            reply[:stdout] = stdout.read
            reply[:stderr] = stderr.read
          end
        rescue => e
          reply.fail! "An error occurred. #{e.to_s}"
        end
      end

    end
  end
end

