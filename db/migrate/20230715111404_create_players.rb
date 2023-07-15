class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :rotowire_id

      t.timestamps
    end
  end
end
