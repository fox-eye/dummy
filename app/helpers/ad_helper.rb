module AdHelper
  def show_ad_img type
    if @ad.photo.content_type =~ /image/
      image_tag @ad.photo.url(type)
    end
  end
end

