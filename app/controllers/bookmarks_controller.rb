class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def destroy

  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end


# # TODO: Below are three questions for you to answer. Read each of the questions
# # and make sure each of the methods `return` the correct answer.


# def rails_app
#   # TODO: Return a `String` with the right command to create a new rails app called `watch-list`.
#   "rails new watch-list"
# end

# def modern_javascript
#   # TODO: Return a `String` of what you have to add to `application.html.erb` if you want to import
#   # the JavaScript file `application.js` that is inside of `app/javascript`
#   "<%= javascript_importmap_tags %>"
# end
