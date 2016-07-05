class AddExplanationToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :explanation, :text
  end
end
