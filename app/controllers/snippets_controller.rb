class SnippetsController < ApplicationController

  before_filter :logged_in_user

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = current_user.snippets.build(params[:snippet])
    if @snippet.save
      redirect_to snippet_path(@snippet.id)
    else
      render 'new'
    end
  end

  def destroy
  end

end
