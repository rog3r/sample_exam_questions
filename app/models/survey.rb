class Survey < ActiveRecord::Base
  # associations
  has_many :attempts,  dependent: :destroy
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: lambda { |question| question[:text].blank? }

  # scopes
  scope :active,   -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  # validations
  #validates :attempts_number, numericality: { only_integer: true, greater_than: -1 }
  validate :at_least_one_question
  validates :description, :name, presence: true, allow_blank: false
  validates :questions, nested_attributes_uniqueness: {field: :text}

  def to_s
    name
  end

  def correct_options# returns all the correct options for current surveys
    return self.questions.map(&:correct_options).flatten
  end


  def incorrect_options# returns all the incorrect options for current surveys
    return self.questions.map(&:incorrect_options).flatten
  end


  # def self.import_from_csv(file)
  #   CSV.foreach(file.path, headers: true) do |row|
  #
  #     product_hash = row.to_hash # exclude the price field
  #     product = Product.where(id: product_hash["id"])
  #
  #     if product.count == 1
  #       product.first.update_attributes(product_hash.except("price"))
  #     else
  #       Product.create!(product_hash)
  #     end # end if !product.nil?
  #   end # end CSV.foreach
  # end # end self.import(file)


  def self.import_from_json(file)
    JSON.parse(open("#{Rails.root}/doc/teams.json").read).each do |data|
      survey = Survey.new(data)
      survey.id = data['id']
      survey.save!
    end
  end



  # records = JSON.parse(File.read('path/to/file.json'))
  # records.each do |record|
  #   ModelName.create!(record)
  # end


  # json = ActiveSupport::JSON.decode(File.read('db/seeds/countries.json'))
  # json.each do |a|
  #   Country.create!(a['country'], without_protection: true)
  # end


  # JSON.parse(open("#{Rails.root}/doc/teams.json").read).each do |stuff|
  #   team = Team.new(stuff)
  #   team.id = stuff['id']
  #   team.save!
  # end


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
