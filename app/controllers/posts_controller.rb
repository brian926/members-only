class PostsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create]

	def index
		@post = Post.all
	end
	
	def logged_in_user
		unless log_in?
			redirect_to root_path
		end
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.user_id
		@post.save
		redirect_to root_path
	end
end
