class Movie < ActiveRecord::Base
    has_many(:roles) #Gives us access #roles
    has_many(:actors,through: :roles) #actors

    def cast_role(actor, character_name, salary) #This is an istance custom method
        Role.create(salary:salary,character_name:character_name,actor:actor,movie:self)
    end
 
    def all_credits #Returns ana array of formatted movie sntrings
        self.roles.map{|role| "#{role.character_name}: Played by #{role.actor.name}"}
    end

    def fire_actor(actor)  #Takes an actor and removes their role from the movie- This has to happen through the join table where an actor is assigned a role
        matched_role = Role.find_by(movie_id:self.id,actor_id:actor.id) #We find the exact role in the roles table that has this movie instance for movie_id and the passed in actor as the actor_id
        matched_role.destroy #Then we delete the found role
    end #This method works by deleting a row in the roles table because a role has one actor and is in one movie. So when a role is deleted, the actor engagement in the movie is deleted

end

#TEST CASES
#Movie.first.cast_role(Actor.third,"Brenda Palsey",46006)
#Movie.first.fire_actor(Actor.first)
