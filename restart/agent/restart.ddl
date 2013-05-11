metadata    :name        => "restart",
            :description => "Mcollective restart agent.",
            :author      => "TAKAHASHI Masaki",
            :license     => "Apache2 License",
            :version     => "0.1",
            :url         => "http://github.com/tarhashi/mcollective-plugins/",
            :timeout     => 60


action "restart", :description => "Restart mcollective" do
    display :always

end

