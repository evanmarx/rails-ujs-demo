class CommentsController < ApplicationController

  def index
    @comment = Comment.new
    @comments = Comment.order("id DESC").all
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.save

    if request.xhr?
      # Render a partial as response when using ajax requests.
      render partial: "comment", locals: {comment: @comment}
    else
      # Redirect as usual for plain html requests.
      redirect_to comments_url
    end
  end
end
