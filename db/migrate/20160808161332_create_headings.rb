class CreateHeadings < ActiveRecord::Migration[5.0]
  def change
    create_table :headings do |t|
      t.references :web_page, foreign_key: true
      t.string :heading_type
      t.string :content

      t.timestamps
    end
  end
end
