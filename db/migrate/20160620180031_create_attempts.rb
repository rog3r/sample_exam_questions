class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.references :participant, polymorphic: true, index: true
      t.references :survey, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
