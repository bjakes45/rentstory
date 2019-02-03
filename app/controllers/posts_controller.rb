class PostsController < ApplicationController
	def index

		@posts = Post.where(publish: true).paginate(:page => params[:page], :per_page => 15)
		@total_posts = Post.where(publish: true)
		@examples = @total_posts.sample(1)

		if params[:term].present?
			@posts = Post.where(publish: true).search(params[:term]).paginate(:page => params[:page], :per_page => 15)
			@total_posts = Post.where(publish: true).search(params[:term])
		end
		@post = Post.new
		@topics = Topic.all
	end

	def show
		@post = Post.find(params[:id])
		if @post.publish == false
			if @post.user == current_user
				redirect_to edit_post_path(@post)
			else
				redirect_to root_path
			end
		end
	end

	def create
		post_params = params[:post]
		post_params.permit!
		@post = Post.new
		@post.topic_id = post_params[:topic].to_i
		if user_signed_in?
			@post.user_id = current_user.id
		end
		@post.title = post_params[:title]
		@post.body = post_params[:body]
		@post.address = post_params[:address]
		@post.street = post_params[:street]
		@post.landlord = post_params[:landlord]
		if post_params[:publish].present?
			@post.publish = post_params[:publish]
		else
			@post.publish = true
		end
		respond_to do |format|
		    if @post.save
		      format.html  { redirect_to(@post,
		                    :notice => 'Post was successfully created.') }
		      format.json  { render :json => @post,
		                    :status => :created, :location => @post }
		    else
		      format.html  { render :action => "index" }
		      format.json  { render :json => @post.errors,
		                    :status => :unprocessable_entity }
		    end
		end
	end

	def edit
		@post = Post.find(params[:id])
		@topics = Topic.all
		
	end

	def update
		
	end
end
