class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.text :description
      t.integer :attempts_number
      t.boolean :active

      t.timestamps null: false
    end
  end
end
