module ProductsHelper
  def cover_images(product, image = image, choice_first_pic: false, width: 100, height: 100, dummy_image: false)
    if dummy_image && choice_first_pic
      if product.images.attached?
        generate_first_cover_image(product, width, height)
      else
        image_tag fake_image(width, height)
      end
    elsif dummy_image
      if product.images.attached?
        generate_cover_image(product, image, width, height)
      else
        image_tag fake_image(width, height)
      end
    else
      generate_cover_image(product, image, width, height) if product.images.attached?
    end
  end

  private
  def fake_image(width, height)
    "https://fakeimg.pl/#{width}x#{height}/?text=none-pic"
  end

  def generate_cover_image(product, image,  width, height)
    image_tag image.variant(resize: "#{width}x#{height}>")
  end

  def generate_first_cover_image(product, width, height)
    image_tag product.images.first.variant(resize: "#{width}x#{height}>")
  end
end
