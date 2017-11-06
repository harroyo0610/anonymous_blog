class PostsController < ApplicationController
	def index
		@user = current_user
		@posts = Post.all.reverse
	end

	def create
		@post = Post.new(post_params)
		tags = []

		@post.body.split.each do |word| 
			if word[0] == '#' then tags << word end
		end
	  	if @post.save
	  		@post.update(user_id: current_user.id)
	  		tags.each do |tag|
	  			new_tag = Tag.find_by(body: tag[1..-1].downcase)
	  			if new_tag == nil
	  			  new_tag = Tag.create(body: tag[1..-1].downcase)
	  			end
	  			@post.tags << new_tag
	  		end
	  		flash[:success] = "Post created successfully"
	  		redirect_to posts_path
	  	else
	  		render 'index'
	  	end
	end

	def show
		@user = current_user
	end

	def destroy
		Post.find(params[:id]).destroy
		flash[:success] = "User deleted"
		redirect_to posts_path
	end

	private 
		def post_params
			params.require(:post).permit(:body)
		end
end
