require_relative 'models/legislator'
require_relative '../db/config.rb'
# Given any state, first print out the senators for that state (sorted by last name),
 # then print out the representatives (also sorted by last name). Include the party affiliation next to the name.
Legislator.by_state("Ohio").where(:title => 'Rep').all
Legislator.by_state("Ohio").where(:title => 'Sen').all



 # 2.Given a gender, print out what number and percentage of the senators are of that gender as well as what number 
 # and percentage of the representatives, being sure to include only those congresspeople who are actively in office,
p (Legislator.by_gender("M").count/Legislator.count)*100
p Legislator.by_gender("M").where(:title => 'Sen').count


 # 3.Print out the list of states along with how many active senators and representatives are in each, in descending order 


 #4.For Senators and Representatives, count the total number of each (regardless of whether or not they are actively in office).
Legislator.total('Sen')
Legislator.total('Rep')


 # 5.Now use ActiveRecord to delete from your database any congresspeople who are not actively in office, 
 # then re-run your count to make sure that those rows were deleted.

 P Legislator.remove_inactive