module Airdates
  class Episode < Airdates::Base
    attr_accessor :id, :serie_id, :airdate, :ep_num, :ep_name, :ep_url, :title, :name, :search_string, :sd_url, :hd_url, :sd_rls_name, :hd_rls_name

    class << self
      def all
        hash = self.get()

        hash.collect{|x| self.initialize_by_hash(x)}
      end

      def all_from(from = 1.day.ago)
        year, month, day = from.year, from.month, from.day
        params = "#{from.year}/#{from.month}/#{from.day}"

        get(params).collect do |hash|
          self.initialize_by_hash(hash)
        end
      end

      def initialize_by_hash(ep_hash)
        episode = self.new
        ep_hash.each do |key, value|
          episode.send("#{key}=", value)
        end
        episode
      end
    end
  end
end
