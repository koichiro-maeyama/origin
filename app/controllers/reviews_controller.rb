class ReviewsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @review = Review.new(
      book_id: params[:book_id],  # params経由
      user_id: current_user.id,   # deviseのメソッド経由
      body:    review_params["body"] # Strong parameter経由
    )
    if @review.save
      # book_idのshowにリダイレクト
      redirect_to book_url(@review.book)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end

end
