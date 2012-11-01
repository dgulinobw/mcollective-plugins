class MCollective::Application::Diff<MCollective::Application
  description "Compare local and remote file Client"
  usage "diff localpath remotepath"

  def post_option_parser(configuration)
    if ARGV.size == 2
      configuration[:local] = ARGV.shift
      configuration[:remote] = ARGV.shift
    end
  end

  def validate_configuration(configuration)
    raise "No such file." unless File.file?(configuration[:local])
    raise "You must specity remote path" unless configuration[:remote]
  end

  def main
    client = rpcclient("diff")

    body = [File.open(configuration[:local]).read].pack('m').split.join
    client.send('compare', {:file => body, :path => configuration[:remote]}).each do |node|
      printf("%-40s %s\n", node[:sender], node[:statusmsg]) unless node[:statuscode] == 0
      puts node[:data][:diff] if node[:data][:diff]
    end
    printrpcstats
  end
end

