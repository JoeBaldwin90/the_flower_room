class AddColumnsToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :title, :string
    add_column :products, :description, :text
    add_column :products, :price, :integer
    add_column :products, :image1, :string
    add_column :products, :image2, :string
    add_column :products, :image3, :string
    add_column :products, :image4, :string
    add_column :products, :image5, :string
    add_column :products, :is_sold_out, :boolean, default: false
    add_column :products, :is_featured, :boolean, default: false
  end
end
