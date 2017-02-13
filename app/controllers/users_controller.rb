class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @question_lists = QuestionList.where(user_id: params[:id])
    @user = User.find(params[:id])
  end

  def following
    @title = "Following"
    @users = @user.followed_users.paginate(page: params[:page])
    render :show_follow
  end

  def followers
    @title = "Followers"
    @users = @user.followers.paginate(page: params[:page])
    render :show_follow
  end

end
