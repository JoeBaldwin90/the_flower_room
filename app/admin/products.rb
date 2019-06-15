ActiveAdmin.register Product do

  permit_params :title, :description, :price,
      :image1, :image2, :image3, :image4, :image5,
      :is_featured, :is_sold_out

       form do |f|

         f.inputs "Product info" do
          f.input :title
          f.input :price, placeholder: "Penny value (1000 = £10.00)"
          f.input :description
        end

         f.inputs "Filters" do
          f.input :is_featured, label: 'Featured on homepage'
          f.input :is_sold_out, label: 'Sold out'
        end

         f.inputs "Images" do
          f.input :image_1
          f.input :image_2
          f.input :image_3
          f.input :image_4
          f.input :image_5
        end

         f.actions
      end

end
