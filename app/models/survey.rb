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


  # def self.import_from_csv(file)
  #   file = File.read(file.path)
  # end # end self.import(file)



  require 'json'
  def self.import_from_json#(file)

    file = File.read("#{Rails.root}/doc/survey_2.json")
    data_hash = JSON.parse(file)


    new_record = Survey.new
    #new_record.id = data_hash['id']
    new_record.name = data_hash['name']
    new_record.description = data_hash['description']
    new_record.attempts_number = data_hash['attempts_number']
    new_record.active = data_hash['active']

    data_hash['questions'].each do |question|
      new_question =  new_record.questions.new
      #new_question.id              = question['id']
      new_question.survey_id       = question['survey_id']
      new_question.text            = question['text']
      new_question.multiple_choice = question['multiple_choice']
      new_question.weight          = question['weight']
      question['options'].each do |option|
        new_option =  new_question.options.new
        #new_option.id          = option['id']
        new_option.question_id = option['question_id']
        new_option.text        = option['text']
        new_option.correct     = option['correct']
      end
    end

    new_record.save
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
