class AddWeightToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :weight, :float
  end
end
