class StaticPagesController < ApplicationController
  def feed
    if signed_in?
      @card  = current_user.cards.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      redirect_to :welcome
    end
  end

  def welcome
  end
end
