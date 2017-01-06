class CreateInstructors < ActiveRecord::Migration[5.0]
    def change
        create_table :instructors do |t|
            t.string :middle
            t.string :last
            t.string :first
            t.string :email
            t.integer :unique_id

            t.timestamps
        end
    end
end
