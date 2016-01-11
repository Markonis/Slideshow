json.array!(@slides) do |slide|
  json.extract! slide, :id, :title, :page_number, :image_url, :presentation_id
  json.url slide_url(slide, format: :json)
end
