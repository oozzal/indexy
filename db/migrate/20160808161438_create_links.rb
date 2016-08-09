class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.references :web_page, foreign_key: true
      t.text :href
      t.string :content

      t.timestamps
    end
  end
end
