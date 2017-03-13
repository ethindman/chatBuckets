class StaticPagesController < ApplicationController
  def feed
    if signed_in?
      @card  = current_user.cards.build
      @journal  = current_user.journals.build

      @feed_items = current_user.feed.paginate(page: params[:page])
      @cards = current_user.cards.all.paginate(page: params[:page])
      @journals = current_user.journals.all.paginate(page: params[:page])
    else
      redirect_to :welcome
    end
  end

  def welcome
  end
end
