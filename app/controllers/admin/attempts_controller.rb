class Admin::AttemptsController < ApplicationController
  before_action :find_survey
  before_action :set_attempt, only: [:show, :edit, :update, :destroy]

  respond_to :html
  responders :flash

  def index
    @attempts = Attempt.all
  end

  def show
  end

  def new
    @attempt = @survey.attempts.new
  end

  def edit
  end

  def create
    @attempt = @survey.attempts.create(attempt_params)
    respond_with(:admin, @survey, @attempt)
  end

  def update
    @attempt.update(attempt_params)
    respond_with(:admin, @survey, @attempt)
  end

  def destroy
    @attempt.destroy
    respond_with @attempt, location: survey_attempts_path(:admin, @survey)
  end

  private
  def set_attempt
    @attempt = Attempt.find(params[:id])
  end

  def find_survey
    @survey = Survey.find(params[:survey_id])
  end

  def attempt_params
    params.require(:attempt).permit(:participant_id, :participant_type, :survey_id, :winner, :score, answers_attributes: [:id, :attempt_id, :option_id, :question_id])
  end
end



