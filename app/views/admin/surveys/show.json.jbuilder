json.(@survey, :id, :name, :description, :attempts_number, :active)

json.questions do
  json.array!(@survey.questions) do |question|
    json.id question.id
    json.survey_id question.survey_id
    json.text question.text
    json.multiple_choice question.multiple_choice
    json.weight question.weight
    json.options do
      json.array!(question.options) do |option|
        json.id option.id
        json.question_id option.question_id
        json.text option.text
        json.correct option.correct
      end
    end
  end
end