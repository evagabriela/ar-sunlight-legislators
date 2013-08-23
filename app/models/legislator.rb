require_relative '../../db/config'

class Legislator < ActiveRecord::Base
  validates :title, :inclusion => { :in => ['Sen', 'Rep'] }

# Given any state, first print out the senators for that state (sorted by last name),
 # then print out the representatives (also sorted by last name). Include the party affiliation next to the name.
  def self.by_state(state)
    # $db.execute "select * from legislators where state = ? and title = 'sen' order by lastname"
    where(:state => state).order("lastname")
  end

 # 2.Given a gender, print out what number and percentage of the senators are of that gender as well as what number 
 # and percentage of the representatives, being sure to include only those congresspeople who are actively in office,
  def self.by_gender(gender)
    where(:in_office => true, :gender => gender)
  end

end





 # 3.Print out the list of states along with how many active senators and representatives are in each, in descending order 


 #4.For Senators and Representatives, count the total number of each (regardless of whether or not they are actively in office).

 # 5.Now use ActiveRecord to delete from your database any congresspeople who are not actively in office, 
 # then re-run your count to make sure that those rows were deleted.