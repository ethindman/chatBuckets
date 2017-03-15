class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def show
  end

  def create
    @card = current_user.cards.build(card_params)

    if @card.save
      flash[:success] = "Your card was added!"
      redirect_to :back
    else
      flash[:alert] = "Oops! Something went wrong... Please try again."
      redirect_to :back
    end
  end

  def update
    if @card.update(card_params)
      redirect_to :back
    else
      flash[:error] = "Oops! Something went wrong... Please try again."
      redirect_to :back
    end
  end

  def destroy
    if @card.destroy
      flash[:success] = "Your card was deleted!"
      redirect_to :root
    else
      flash[:error] = "Oops! Something went wrong... Please try again."
      redirect_to :back
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:body, :translation, :part_of_speech, :image)
    end
end
