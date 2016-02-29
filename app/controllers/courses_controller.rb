class CoursesController < ApplicationController
	def index
		@courses = Course.all
	end

	def new
		@course = Course.new
		@course.sessions.build
	end

	def create
		course = Course.create(course_params)
		CourseMailer.welcome_to_course(course, User.first).deliver!
		redirect_to courses_path
	end

	def edit
		@course = Course.find(params[:id])
	end

	def update
		course = Course.find(params[:id])
		course.update(course_params)
		redirect_to courses_path
	end

	private

	def course_params
		params.require(:course).permit(:title, :cost,
		  sessions_attributes: [:id, :from_time, :to_time, :_destroy])
	end
end
