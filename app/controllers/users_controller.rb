class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @question_lists = QuestionList.where(user_id: params[:id])
    @user = User.find(params[:id])
  end
end
