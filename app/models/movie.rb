class Movie < ActiveRecord::Base
    has_many(:roles) #Gives us access #roles
    has_many(:actors,through: :roles) #actors

    def cast_role(actor, character_name, salary) #This is an istance custom method
        Role.create(salary:salary,character_name:character_name,actor:actor,movie:self)
    end
 
    def all_credits
       
    end

end

#TEST CASES
#Movie.first.cast_role(Actor.third,"Brenda Palsey",46006)