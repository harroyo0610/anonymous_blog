class PostsController < ApplicationController
	def index
		@posts = Post.all.reverse
	end

	def create
		p "*" * 50
		p params
		@post = Post.new(post_params)

  	if @post.save
  		flash[:success] = "Post created successfully"
  		redirect_to posts_path
  	else
  		render 'index'
  	end
	end

	private 
		def post_params
			params.require(:post).permit(:title, :body)
		end
end
