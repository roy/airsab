module Airsab
  module Command
    def self.run(cmd, arguments=[])
      config = YAML.load(File.open(File.expand_path("~/.airsab")))

      Airdates::Base.establish_connection config["airdates"]
      Sabnzb::Base.establish_connection   config["sabnzb"]

      episodes = Airdates::Episode.all_from(1.day.ago)

      episodes.each do |episode|
        puts "Downloading: #{episode.ep_name}"
        puts Sabnzb::Client.add_file(episode.hd_url)
      end
    end
  end
end
