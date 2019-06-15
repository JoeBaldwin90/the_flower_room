ActiveAdmin.register Product do

  permit_params :title, :description, :price,
                :image1, :image2, :image3, :image4, :image5,
                :is_featured, :is_sold_out

  # Custom ActiveAdmin Product index view
  index do
    selectable_column
    index_column
    column 'Main image' do |product|
      image_tag product.image1.to_s, width: '75'
    end
    column :title
    column :price
    column :is_featured
    column :is_sold_out
    actions dropdown: false
  end

  # Custom ActiveAdmin new product form
  form do |f|
    f.inputs 'Product info' do
      f.input :title
      f.input :price, placeholder: 'Penny value (1000 = £10.00)'
      f.input :description
    end

    f.inputs 'Filters' do
      f.input :is_featured, label: 'Featured on homepage'
      f.input :is_sold_out, label: 'Sold out'
    end

    f.inputs 'Images' do
      f.input :image1
      f.input :image2
      f.input :image3
      f.input :image4
      f.input :image5
    end

    f.actions
  end
end
