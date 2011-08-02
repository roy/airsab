require "json"
require "open-uri"

module Airdates
  class Base
    BASE_URL = "http://airdates.info/api/json/"
    class << self
      attr_accessor :key

      def establish_connection(config)
        self.key = config["key"] if config["key"]
      end

      def get(params = "")
        if params.empty? == false
          JSON.parse(open("#{BASE_URL}#{params}/#{key ? key : ""}").read)
        else
          JSON.parse(open("#{BASE_URL}").read)
        end
      end
    end
  end
end
