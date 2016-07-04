class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  respond_to :html
  responders :flash

  def index
    @surveys = Survey.all
  end

end


# Table name: questions
#
#  id              :integer          not null, primary key
#  survey_id       :integer
#  text            :string
#  multiple_choice :boolean


# Table name: options
#
#  id          :integer          not null, primary key
#  question_id :integer
#  weight      :integer
#  text        :string
#  correct     :boolean