module Sabnzb
  class Client < Sabnzb::Base
    class << self
      def add_file(url)
        get("&mode=addurl&name=" + url)
      end

      def status
        get(base_url + "&mode=qstatus&output=json")
      end
    end
  end
end
