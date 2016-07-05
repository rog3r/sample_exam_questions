class Admin::SurveysController  < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  respond_to :html
  responders :flash

  def index
    @surveys = Survey.all
  end

  def show
  end

  def new
    @survey = Survey.new
    @survey.questions.build
  end

  def edit
  end

  def create
    @survey = Survey.create(survey_params)
    respond_with(:admin, @survey)
  end

  def update
    @survey.update(survey_params)
    respond_with(:admin, @survey)
  end

  def destroy
    @survey.destroy
    respond_with @survey, location: admin_surveys_path
  end

  private
  def set_survey
    @survey = Survey.find(params[:id])
  end


  def survey_params
    params.require(:survey)
        .permit(
            :id,
            :name, :description, :attempts_number, :active,
            # has_many :questions (Nested Attributes)
            questions_attributes: [
                :survey_id,
                :id,
                :text,
                :explanation,
                :_destroy,
                :multiple_choice,
                # :has_many :options (Nested Attributes)
                options_attributes: [
                    :question_id,
                    :id,
                    :text,
                    :_destroy,
                    :weight,
                    :correct
                ]
            ]
        )
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