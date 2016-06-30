class Option < ActiveRecord::Base
  # associations
  belongs_to :question

  # validations
  validates :text, presence: true, allow_blank: false

  # scopes
  scope :corrects,   -> { where(correct: true) }
  scope :incorrects, -> { where(correct: false) }
end

# == Schema Information
#
# Table name: options
#
#  id          :integer          not null, primary key
#  question_id :integer
#  text        :string
#  correct     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_options_on_question_id  (question_id)
#
