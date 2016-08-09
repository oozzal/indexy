class AddTitleToWebPage < ActiveRecord::Migration[5.0]
  def change
    add_column :web_pages, :title, :string
  end
end
