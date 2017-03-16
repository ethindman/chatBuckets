class UsersController < ApplicationController
  before_action :set_user, only: [:show, :following, :followers]

  def index
    @users = User.all
  end

  def show
    @question_lists = QuestionList.where(user_id: params[:id])
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

  def cards
    @cards = current_user.cards.all.paginate(page: params[:page])
    render :show_cards
  end

  def journals
    @journals = current_user.journals.all.paginate(page: params[:page])
    render :show_journals
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

end
