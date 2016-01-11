json.array!(@presentations) do |presentation|
  json.extract! presentation, :id, :title, :author
  json.url presentation_url(presentation, format: :json)
end
