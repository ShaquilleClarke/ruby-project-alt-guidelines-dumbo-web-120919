class AddTheoristToTheories < ActiveRecord::Migration[5.2]
    def change
        add_column :theories, :theorist_name, :string
    end
end