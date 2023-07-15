class AddDefaultToIsHotNewsColumnToAnalyses < ActiveRecord::Migration[7.0]
  def up
    change_table :analyses do |t|
      t.change :is_hot_news, :boolean, default: false
    end
  end

  def down
    change_table :analyses do |t|
      t.change :is_hot_news, :boolean, default: false
    end
  end
end
