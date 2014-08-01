class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.integer :round
      t.integer :pick_no
      t.integer :team_id

      t.timestamps
    end
    add_index :ownerships, :team_id
  end
end
