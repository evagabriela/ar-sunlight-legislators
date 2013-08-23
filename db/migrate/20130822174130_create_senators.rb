require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateSenators < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :legislators  do |t|  #create_table is a method 
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :title
      t.string :phone
      t.string :fax
      t.string :website
      t.string :webform #for email
      t.string :party_affiliation 
      t.boolean :in_office 
      t.string :gender
      t.date   :birthday 
      t.string :twitter_id
    end
  end

end


