class Attempt < ActiveRecord::Base
  # associations
  belongs_to :participant, polymorphic: true
  belongs_to :survey
  has_many :questions, through: :survey
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers ,
                                reject_if: ->(answers) { answers[:option_id].blank? }

  # validations
  # validates :participant_id, :participant_type, presence: true

  #scopes
  #scope :answered_questions, ->(attempt) { Answer.where(attempt: attempt) }

  def score
    correct_answered_questions.map(&:weight).inject(&:+)
  end


  def answered_questions
    answers.map(&:question).uniq
  end

  def answered_options(question)
    answers.includes(:option).where(options: {question_id: question.id}).pluck(:option_id)
  end

  def correct_answered_questions
    questions = answers.map(&:question)
    corrects = []
    questions.each do |question|
      corrects.push(question) if correct_answered_options?(question)
    end
    corrects.uniq
  end


  def correct_answered_options?(question)
    answered_options = self.answers.includes(:option).where(options: {question_id: question.id}).pluck(:option_id).compact
    correct_options = question.correct_options.pluck(:id)
    answered_options.uniq.sort == correct_options.uniq.sort
  end

end


# == Schema Information
#
# Table name: attempts
#
#  id               :integer          not null, primary key
#  participant_id   :integer
#  participant_type :string
#  survey_id        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_attempts_on_participant_type_and_participant_id  (participant_type,participant_id)
#  index_attempts_on_survey_id                            (survey_id)
#



# survey = Survey.first
# attempt = survey.attempt.new
# attempt.participant = User.firt
#
# attempt.answers.new({})