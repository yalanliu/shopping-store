module ProductsHelper
  def cover_images(product, image, dummy_image: false)
    if dummy_image
      if product.images.attached?
        generate_cover_image(product, image)
      else
        image_tag fake_image(width, height)
      end
    else
      generate_cover_image(product, image) if product.images.attached?
    end
  end

  private
  def fake_image(width, height)
    "https://fakeimg.pl/100x100"
  end

  def generate_cover_image(product, image)
    image_tag image.variant(resize_to_limit: [100, 100]) if product.images.attached?
  end
end
