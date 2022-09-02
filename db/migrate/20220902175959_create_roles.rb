class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table(:roles) do |t|
      t.integer(:salary)
      t.string(:character_name)
      t.integer(:actor_id)  #foreign key for the actors table
      t.integer(:movie_id)  #foreign key for the movies table
    end
  end
end
