ActiveAdmin.register Order do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :first_name,
              :last_name,
              :email,
              :phone_number,
              :country,
              :address_1,
              :address_2,
              :city,
              :postal_code,
              order_items_attributes: [:id, :quantity, :product_id]

# Custom ActiveAdmin Product index view
index do
  selectable_column
  index_column
  column :name do |order|
    order.first_name + " " + order.last_name
  end
  column :email
  column :phone_number
  column :created_at
  actions dropdown: false
end

form do |f|

     f.inputs "Contact details" do
       f.input :first_name
       f.input :last_name
       f.input :email
       f.input :phone_number
     end

     f.inputs "Delivery address" do
       f.input :address_1
       f.input :address_2
       f.input :city
       f.input :postal_code
       f.input :country
     end

     f.has_many :order_items, heading: "Products" do |p|
       p.input :product
       p.input :quantity
     end

    f.actions
  end


end
