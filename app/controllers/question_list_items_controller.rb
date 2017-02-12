class QuestionListItemsController < ApplicationController
  before_action :set_question_list
  before_action :set_question_list_item, only: [:show, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  def show
  end

  def create
    @question_list.question_list_items.build(question_list_item_params)

    if @question_list.save
      redirect_to @question_list
    else
      redirect_to @question_list, alert: 'Oops! Please type in some text'
    end
  end

  def update
    @question_list_item.update(question_list_item_params)
    redirect_to :back
  end

  def destroy
    if @question_list_item.destroy
      flash[:success] = "Question deleted."
    else
      flash[:error] = "Question couldn't be deleted."
    end
    redirect_to @question_list
  end

  private

  def set_question_list_item
    @question_list_item = QuestionListItem.find(params[:id])
  end

  def set_question_list
    @question_list = QuestionList.find(params[:question_list_id])
  end

  def question_list_item_params
    params[:question_list_item].permit(:content, :translation, :notes, :my_response, :question_variations)
  end
end
