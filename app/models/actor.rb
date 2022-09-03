class Actor < ActiveRecord::Base
    has_many(:roles) #gives us the  #roles instance method
    has_many(:movies,through: :roles) #gives us access to #movies

    def actor_salary  #Return the total salary for a worker based on the total salary foor their roles
      #First find the roles that the actor plays
      #Enumerate through the roles and add sum up the salaries or
      #Append #sum at the end thata takes in salary column amd this will sum all the salaries of the roles fetched
        self.roles.sum("salary")
    end

    def blockbusters  #query using where
        #Select all movies assocaiated with an instance of this Actor
        #Add a condition to filter the selection by the value of the box_office_earnings
        #Return that array
        self.movies.where("box_office_earnings > ?",50000000)
    end

    def self.most_successful  #Class method - group by somewhere
        #First get all the instances using .all method
        #For every actor, consume the above #actor_salary method - use map to produce a new array of summed-up salaries for each of the actor's roles
        #Find the maximum value in the array
        #Compare each actor's salary sumup with the maximuM
        #Return the match.
        actors_summed_salary = self.all.map{|actor| actor.actor_salary}.max() #Lots of method chaining
        self.all.find{|actor| actor.actor_salary == actors_summed_salary}
    end
end