class CreateTheories < ActiveRecord::Migration[5.2] #has not been migrated yet
    def change
        create_table :theories do |t|
            t.string :content
            t.timestamps
        end
    end
end