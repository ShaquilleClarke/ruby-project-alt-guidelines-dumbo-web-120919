class CreateTheorists < ActiveRecord::Migration[5.2] #has not been migrated yet
    def change
        create_table :theorists do |t|
            t.string :name
            t.timestamps
        end
    end
end