class CreateWebPages < ActiveRecord::Migration[5.0]
  def change
    create_table :web_pages do |t|
      t.text :url

      t.timestamps
    end
    add_index :web_pages, :url
  end
end
