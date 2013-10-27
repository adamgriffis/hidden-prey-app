class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
    	t.belongs_to :turn
    	t.belongs_to :player
		t.timestamps
    end
  end
end
