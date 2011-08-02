module Sabnzb
  class Base
    class << self 
      attr_accessor :host, :port, :apikey, :base_url

      def establish_connection(config)
        @@host = config["host"]
        @@port = config["port"]
        @@apikey = config["apikey"]
        @@base_url = "http://#{@@host}:#{@@port}/sabnzbd/api?&apikey=#{@@apikey}"
      end

      def get(params)
        puts "base_url: #{@@base_url}"
        open(@@base_url + params).read
      end
    end
  end
end
