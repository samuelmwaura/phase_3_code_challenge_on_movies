class Role < ActiveRecord::Base
   belongs_to(:movie) #This gives acess to the #Movie instance method that helps query the owner movie
   belongs_to(:actor)#This gives us #actor

   def credit  #This is a custom method to achieve desired behaviour
      "#{self.character_name}: Played by #{self.actor.name}"
   end
end