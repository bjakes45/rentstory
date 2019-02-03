class ReportsController < ApplicationController
	def new
		if !params[:post].present? or !user_signed_in?
			redirect_to root_path
		end
		@report = Report.new
		@post = Post.find(params[:post])

		@rep_topics = ["Inappropriate Language", "Violent/Threatening Content", "Suspected Falsehood", "Unintelligible", "Other"]
	
	end

	def create
		report_params = params[:report]
		@post = Post.find(params[:post_id])

		@report = Report.new
		@report.user = current_user
		@report.post_id = @post.id
		@report.topic = report_params[:topic]
		@report.body = report_params[:body]

		if @report.save
	      redirect_to(root_path, :alert => 'Report was successfully created.')
	    else

	      format.html  { render :action => "index" }
	      format.json  { render :json => @report.errors,
	                    :status => :unprocessable_entity }
	    end
	end

end
