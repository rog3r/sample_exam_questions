class Survey < ActiveRecord::Base
  # associations
  has_many :attempts, dependent: :destroy
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: lambda { |question| question[:text].blank? }

  # scopes
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  # validations
  #validates :attempts_number, numericality: { only_integer: true, greater_than: -1 }
  validate :at_least_one_question
  # validate :at_least_one_option_correct
  validates :description, :name, presence: true, allow_blank: false
  validates :questions, nested_attributes_uniqueness: {field: :text}

  def to_s
    name
  end


  def correct_options # returns all the correct options for current surveys
    return self.questions.map(&:correct_options).flatten
  end


  def incorrect_options # returns all the incorrect options for current surveys
    return self.questions.map(&:incorrect_options).flatten
  end

  private

  def at_least_one_question
    errors.add(:base, :must_have_at_least_one_question) if questions.size < 1
  end

  # def available_for_participant?(participant)
  #   current_number_of_attempts = self.attempts.for_participant(participant).size
  #   upper_bound = self.attempts_number
  #   return !((current_number_of_attempts >= upper_bound) && (upper_bound != 0))
  # end
end

# == Schema Information
#
# Table name: surveys
#
#  id              :integer          not null, primary key
#  name            :string
#  description     :text
#  attempts_number :integer
#  finished        :boolean
#  active          :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
