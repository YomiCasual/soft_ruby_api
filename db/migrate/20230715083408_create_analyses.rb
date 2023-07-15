class CreateAnalyses < ActiveRecord::Migration[7.0]
  def change
    create_table :analyses do |t|
      t.string :title
      t.string :description
      t.text :long_description
      t.string :image
      t.string :photo_credit
      t.boolean :is_hot_news

      t.timestamps
    end
  end
end
