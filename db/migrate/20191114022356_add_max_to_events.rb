class AddMaxToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :max, :integer
  end
end
