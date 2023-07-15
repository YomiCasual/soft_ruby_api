class CreateAnalysesPlayersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :analyses, :players do |t|
      t.index :analysis_id
      t.index :player_id
    end
  end
end
