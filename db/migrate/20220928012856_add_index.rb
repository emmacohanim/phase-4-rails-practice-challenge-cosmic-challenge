class AddIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :missions, [:scientist_id, :planet_id], unique: true
  end
end
