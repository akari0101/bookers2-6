class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comments_params)
    comment.book_id = @book.id
    comment.save
    @book_comment = BookComment.new
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.find(params[:id]).destroy
    @book.destroy
  end

  private

  def book_comments_params
    params.require(:book_comment).permit(:comment)
  end

end
