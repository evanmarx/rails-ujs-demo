class CommentsController < ApplicationController

  def index
    @comments = Comment.order("id DESC").all
  end

  def create
    @comment = Comment.new(params[:comment])

    if @comment.save
      if request.xhr?
        render partial: "comment", locals: {comment: @comment}
      else
        redirect_to comments_url
      end
    else
      render action: "new"
    end
  end
end
