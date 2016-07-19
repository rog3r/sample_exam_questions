class AddDefaultToQuestionWeight < ActiveRecord::Migration
  def change
    change_column :questions, :weight, :float, default: 0
  end
end
