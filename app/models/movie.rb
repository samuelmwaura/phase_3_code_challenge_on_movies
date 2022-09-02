class Movie < ActiveRecord::Base
    has_many(:roles) #Gives us access #roles
    has_many(:actors,through: :roles) #actors

end

#TEST CASES
#Movie.first.cast_role(Actor.third,"Brenda Palsey",46006)