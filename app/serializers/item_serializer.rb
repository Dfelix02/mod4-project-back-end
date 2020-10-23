class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :released, :background_image, :rating, :rating_top, :playtime, :clip, :clip_preview, :screenshots, :price 
end
