metadata    :name        => "command",
            :description => "Execute command agent.",
            :author      => "TAKAHASHI Masaki",
            :license     => "Apache2 License",
            :version     => "0.1",
            :url         => "http://github.com/tarhashi/mcollective-plugins/",
            :timeout     => 60


action "execute", :description => "Execute command" do
    display :always

    input :command,
          :prompt      => "Command",
          :description => "The command(fullpath) and arguments",
          :type        => :string,
          :validation  => '^/.+$',
          :optional    => false,
          :maxlength   => 255

    output :stdout,
          :description => "Stdout",
          :display_as  => "Stdout"

    output :stderr,
          :description => "Stderr",
          :display_as  => "Stderr"
end

