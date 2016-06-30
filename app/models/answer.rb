class Answer < ActiveRecord::Base
  # associations
  belongs_to :attempt  # belongs_to :question
  belongs_to :option
  has_one :question, through: :option

  # validations
  #validates :attempt_id, presence: true
  #validates :option_id, presence: true
  #validates :option_id, uniqueness: { scope: [:attempt_id, :question_id] }

  def correct?
    option.correct?
  end

end

# == Schema Information
#
# Table name: answers
#
#  id         :integer          not null, primary key
#  attempt_id :integer
#  option_id  :integer
#  correct    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_answers_on_attempt_id  (attempt_id)
#  index_answers_on_option_id   (option_id)
#
