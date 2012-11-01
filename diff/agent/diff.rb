require 'shellwords'
require 'rubygems'
require 'open3'

module MCollective
  module Agent
    class Diff<RPC::Agent

      action 'compare' do
        begin
          target = Shellwords.escape(request[:path])
          if !File.file?(target)
            reply.fail! "#{target} does not exist"
          end
          body = request[:file].unpack('m')[0]
          tempfile = Tempfile.new(File.basename(target))
          tempfile.write body
          tempfile.close
          tmpname = tempfile.path
          command = "diff -u #{tmpname} #{target}"
          Open3.popen3(command) do |stdin, stdout, stderr|
            reply[:diff] = stdout.read
          end
          tempfile.unlink
        rescue => e
          reply.fail! "An error occurred. #{e.to_s}"
        end
      end

    end
  end
end

