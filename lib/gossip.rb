require 'bundler'
Bundler.require
require 'csv'
require 'pry'
class Gossip
    attr_reader :author, :content
        def initialize(author, content)
            @content = content
            @author = author
        end

        def save
            CSV.open('./db/gossip.csv', 'a+') do |csv|
            csv << [@author, @content]
            end  
        end

        def self.all
            all_gossips = []
            CSV.read("./db/gossip.csv").each do |csv_line|
            all_gossips << Gossip.new(csv_line[0], csv_line[1])
            end
            return all_gossips
        end

        def self.find(id)
            all = all_gossips
            return all[id]
        end



end