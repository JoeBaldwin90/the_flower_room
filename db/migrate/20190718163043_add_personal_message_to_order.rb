class AddPersonalMessageToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :message, :text
  end
end
