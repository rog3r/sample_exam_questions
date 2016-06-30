class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :attempt, index: true, foreign_key: true
      t.references :option, index: true, foreign_key: true
      t.boolean :correct

      t.timestamps null: false
    end
  end
end
