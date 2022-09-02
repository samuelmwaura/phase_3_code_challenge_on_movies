class Actor < ActiveRecord::Base
    has_many(:roles) #gives us the  #roles instance method
    has_many(:actors,through: :movies) #gives us access to #movies
end