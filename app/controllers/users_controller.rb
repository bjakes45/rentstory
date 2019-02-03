class UsersController < ApplicationController
	def profile
		if !current_user.present?
			redirect_to root_path
		end
		@drafts = current_user.posts.where.not(publish: true)
		@published = current_user.posts.where(publish: true)
		@reports = Report.all
	end

	def seagull

	end
end
