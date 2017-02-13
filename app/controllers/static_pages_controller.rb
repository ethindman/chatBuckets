class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @card  = current_user.cards.build
    end
    @cards = Card.all
  end
end
