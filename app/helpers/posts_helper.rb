module PostsHelper
	def check_search
		params[:term]? "Filtered Stories" : "All Stories"	
	end

	def user_badge_generator
		if @post.user_id.present?			

			@user = User.find(@post.user_id)
			
			if @user == current_user
				
				if !current_user.admins.present?
					link_to edit_post_path(@post) do
						fa_icon "pencil", class: "text-secondary", data_toggle:"tooltip", title:"Edit Your Story"
					end
				end
			
			else
			
				fa_icon "user-plus", class: "text-success", data_toggle:"tooltip", title:"User Verified"
			
			end
		else
			fa_icon "user-times", class: "text-secondary", data_toggle:"tooltip", title:"Submitted Anonymously"
		end
	end

	def admin_badge_generator
		if user_signed_in?
			if current_user.admins.present?
				if @post.reports.present?
					link_to post_path(@post), method: :delete, data: { confirm: 'Are you certain you want to delete this?' } do
						fa_icon "times", class: "text-danger", data_toggle:"tooltip", title:"Delete this Story"
					end
				
				else
					link_to edit_post_path(@post) do
						fa_icon "pencil", class: "text-secondary", data_toggle:"tooltip", title:"Edit this Story"
					end
				end
			end
		end
	end

	def flag_link(post_id)
		if user_signed_in?
			if !current_user.admins.present?
				link_to new_report_path(post: post_id) do
					fa_icon "flag", class: "text-danger", data_toggle:"tooltip", title:"Report Story"
				end
			else
				if @post.reports.present?
					link_to edit_post_path(@post) do
						fa_icon "pencil", class: "text-secondary", data_toggle:"tooltip", title:"Edit this Story"
					end
				end
			end
		else
			fa_icon "flag", class: "text-secondary", data_toggle:"tooltip", title:"Must Login to Report"
		end
	end
end
