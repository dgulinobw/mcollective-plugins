require 'rubygems'
require 'open3'

module MCollective
  module Agent
    class Restart<RPC::Agent

      action 'restart' do
        begin
          ::Process.fork do
            sleep 3
            `/sbin/service mcollective restart`
            exit
          end
        rescue => e
          reply.fail! "An error occurred. #{e.to_s}"
        end
      end

    end
  end
end

