ActiveAdmin.register Product do

  permit_params :title, :description, :price,
                :image1, :image2, :image3, :image4, :image5,
                :is_featured, :is_sold_out

  # Custom ActiveAdmin Product index view
  index do
    selectable_column
    index_column
    column 'Main image' do |product|
<<<<<<< HEAD
      image_tag product.image1.thumb.to_s, width: '75' 
=======
      image_tag product.image1.to_s, width: '75'
>>>>>>> e9a7bd260e5ca8505c9e682bfdd0edf1ada8bdd5
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
      f.input :image_1
      f.input :image_2
      f.input :image_3
      f.input :image_4
      f.input :image_5
    end

    f.actions
  end
end
