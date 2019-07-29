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

        def self.all  #Methode which will show all gossip
            all_gossips = []
            CSV.read("./db/gossip.csv").each do |csv_line|
            all_gossips << Gossip.new(csv_line[0], csv_line[1])
            end
            return all_gossips
        end

        def self.find(id) #methode to find the author via his id
            
            return Gossip.all[id.to_i]
        end

        def self.update(id, author, content) #methode to edit the gossip
            gossips = []
            CSV.read("./db/gossip.csv").each_with_index do |row, index|
                if id.to_i == (index)
                    gossips << [author, content]
                else 
                    gossips << [row[0], row[1]]
                end
            end

            CSV.open("./db/gossip.csv", "w") do |csv|
                gossips.each do |row|
                    csv << row
                end
            end
        end



end
