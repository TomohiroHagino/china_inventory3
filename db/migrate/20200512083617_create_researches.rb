class CreateResearches < ActiveRecord::Migration[6.0]
  def change
    create_table :researches do |t|
      t.string :japan_image_url
      t.string :japan_title
      t.string :japan_url
      t.string :japan_description
      t.integer :japan_price
      t.integer :jpn_research_check
      t.string :china_image_url
      t.string :china_title
      t.string :china_url
      t.float :china_price
      t.integer :chn_research_check
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
