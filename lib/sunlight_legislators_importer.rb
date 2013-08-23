require 'csv'
require_relative '../db/config'
require_relative '../app/models/legislator.rb'
require 'active_record'




class SunlightLegislatorsImporter

  def self.import(filename)
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      return_values = row.to_hash.select { |k, v| Legislator.column_names.include?(k) }
      puts "imported #{return_values["firstname"]}"
      
      legislator = Legislator.new(return_values)
      legislator.save!
    end
  end
end

#  t.string :name
      # t.string :phone
      # t.string :fax
      # t.string :website
      # t.string :webform #for email
      # t.string :party_affiliation 
      # t.string :gender
      # t.date   :birthday 
      # t.string :twitter_id

# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
begin
  raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
  SunlightLegislatorsImporter.import(ARGV[0])
rescue ArgumentError => e
  $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
rescue NotImplementedError => e
  $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
end
# p SunlightLegislatorsImporter.import('../db/data/legislators.csv')  # How will you run your importer? Is this a "one-off" task? Refer to previous challenges like AR Student Schema if you get lost on this.this driver code is running this file 