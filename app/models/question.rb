class Question < ActiveRecord::Base
  # associations
  belongs_to :survey
  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options,
                                allow_destroy: true,
                                reject_if: ->(a) { a[:text].blank? }

  # validations
  validate :at_least_one_option_correct
  validate :at_least_one_option


  validates :text, presence: true, allow_blank: false

  # TODO add Topics to model

  def has_correct_options?
    options.corrects.any?
  end

  def correct_options
    return options.corrects
  end

  def incorrect_options
    return options.incorrects
  end

  private

  def at_least_one_option
    errors.add(:base, :must_have_at_least_one_option) if options.size < 1
  end

  def at_least_one_option_correct
    choices_true = []
    self.options.each{|option| choices_true << option.correct if option.correct == true }
    errors.add(:base, :must_have_at_least_one_option_correct, {text: self.text}) unless choices_true.any?
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
#  explanation     :text
#  weight          :float
#
# Indexes
#
#  index_questions_on_survey_id  (survey_id)
#
