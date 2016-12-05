class QuestionListItemsController < ApplicationController
  before_action :set_question_list
  before_action :authenticate_user!

  def show
    @question_list_item = QuestionListItem.find(params[:id])
  end

  def create
    @question_list_item = @question_list.question_list_items.create(question_list_item_params)

    redirect_to @question_list
  end

  def destroy
    @question_list_item = @question_list.question_list_items.find(params[:id])

    if @question_list_item.destroy
      flash[:success] = "Question deleted."
    else
      flash[:error] = "Question couldn't be deleted."
    end
    redirect_to @question_list
  end

  private

  def set_question_list
    @question_list = QuestionList.find(params[:question_list_id])
  end

  def question_list_item_params
    params[:question_list_item].permit(:content)
  end
end
