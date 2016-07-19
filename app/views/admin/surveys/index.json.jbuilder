json.array!(@surveys) do |survey|
  json.extract! survey, :id, :name, :description, :attempts_number, :finished, :active
  json.url survey_url(survey, format: :json)
end