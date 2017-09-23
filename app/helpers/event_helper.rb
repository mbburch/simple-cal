module EventHelper
  def listing_color(event)
    if event.category
      "#{event.category.color}"
    else
      "black"
    end
  end
end
