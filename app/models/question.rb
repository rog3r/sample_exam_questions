class Question < ActiveRecord::Base
  # associations
  belongs_to :survey
  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options,
                                reject_if: ->(a) { a[:text].blank? },
                                allow_destroy: true

  # validations
  validates :text, presence: true, allow_blank: false

  # TODO add Explanation Note to model
  # TODO add Topics to model


  def correct_options
    return options.corrects
  end

  def incorrect_options
    return options.incorrects
  end

  # def self.correct_options(question)
  #   return options.where(corrrect: true).pluck(:option_id)
  # end
end

# == Schema Information
#
# Table name: questions
#
#  id              :integer          not null, primary key
#  survey_id       :integer
#  text            :string
#  multiple_choice :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_questions_on_survey_id  (survey_id)
#
