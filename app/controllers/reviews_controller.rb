class ReviewsController < ApplicationController

  before_filter :logged_in_user

  def new
    @review = Review.new
  end

  def create
    snippet_id = params[:review][:snippet_id]
    params[:review].delete :snippet_id
    @review = current_user.reviews.build(params[:review])
    @review.snippet_id = snippet_id
    if @review.save
      render :json => { "success" => true, "redirect" => root_path }
    else
      render 'new'
    end
  end

  def destroy
  end

end
