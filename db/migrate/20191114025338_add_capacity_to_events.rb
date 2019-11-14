class AddCapacityToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :capacity, :integer
  end
end
