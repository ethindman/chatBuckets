class JournalsController < ApplicationController
  before_action :set_journal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def create
    @journal = current_user.journals.build(journal_params)

    if @journal.save
      flash[:success] = "Your journal was added!"
      redirect_to :back
    else
      flash[:alert] = "Oops! Something went wrong... Please try again."
      redirect_to :back
    end
  end

  def update
    if @journal.update(journal_params)
      redirect_to :back
    else
      flash[:error] = "Oops! Something went wrong... Please try again."
      redirect_to :back
    end
  end

  def destroy
    if @journal.destroy
      flash[:success] = "Your journal was deleted!"
      redirect_to :root
    else
      flash[:error] = "Oops! Something went wrong... Please try again."
      redirect_to :back
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal
      @journal = Journal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_params
      params.require(:journal).permit(:title, :body, :translation, :open, :image)
    end
end
