class AddDeleteAtColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :deleted_at, :datetime
    add_index :transactions, :deleted_at
  end
end
