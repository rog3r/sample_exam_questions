#json.extract! @survey, :id, :name, :description, :attempts_number, :finished, :active, :created_at, :updated_at


json.(@survey, :id, :name, :description, :attempts_number, :finished, :active)
#json.questions(@survey.questions, :id, :survey_id, :text, :multiple_choice)

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

# json.questions @survey.questions do |json, question|
#   json.partial! question
# end

# json.author(@post.author, :id, :name)
# json.comments(@post.comments, :id, :name, :content)


# json.array!(@users) do |user|
#   json.name user.name
#
#   json.reservations do
#     json.array!(user.reservations) do |reservation|
#       json.restaurant reservation.restaurant.name
#       json.reservation_time reservation.time
#       json.name user.name
#     end
#   end
# end


#questions
#json.extract! @question, :id, :survey_id, :text, :multiple_choice, :created_at, :updated_at

#list
# json.array!(@questions) do |question|
#   json.extract! question, :id, :survey_id, :text, :multiple_choice
#   json.url question_url(question, format: :json)
# end

#options
# json.extract! @option, :id, :question_id, :weight, :text, :correct, :created_at, :updated_at

#list
# json.array!(@options) do |option|
#   json.extract! option, :id, :question_id, :weight, :text, :correct
#   json.url option_url(option, format: :json)
# end