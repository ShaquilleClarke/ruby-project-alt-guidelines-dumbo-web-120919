class CreateUserTheories < ActiveRecord::Migration[5.2] 
    def change
        create_table :user_theories do |t|
            t.integer :theorist_id
            t.integer :theory_id
            t.timestamps
        end
    end
end