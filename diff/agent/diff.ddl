metadata    :name        => "diff",
            :description => "Compare local file and remote file.",
            :author      => "TAKAHASHI Masaki",
            :license     => "MIT License",
            :version     => "0.1",
            :url         => "http://github.com/tarhashi/mcollective-plugins/",
            :timeout     => 60


action "compare", :description => "Compare files." do
    display :always

    input :path,
          :prompt      => "file path",
          :description => "The full path of the target file",
          :type        => :string,
          :validation  => '^/.+$',
          :optional    => false,
          :maxlength   => 255

    input :file,
          :prompt      => "file content",
          :description => "file content(base64)",
          :type        => :string,
          :validation  => '^.+$',
          :optional    => false,
          :maxlength   => 1024 * 1024

    output :diff,
          :description => "The status of the download operation",
          :display_as  => "Status"

end

