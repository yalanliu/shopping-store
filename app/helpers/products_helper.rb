module ProductsHelper
  def preview_images(product, image)
    if product.images.attached?
      image_tag image.variant(resize_to_limit: [100, 100])
    else
      image_tag image.preview(resize_to_limit: [100, 100])
    end
  end
end
