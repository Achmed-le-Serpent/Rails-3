class EventsController < ApplicationController

	def index

		@event = Event.all

	end

	def new

		@event = Event.new

	end

	def create

		@event = Event.create(event_params)

		session[:current_user_id] = @user.id

		redirect_to show_event_path

	end

	def show

		@event = Event.find(params[:id])

	end

	def edit

		@event = Event.find(params[:id])

		@attendees = Attendees.all

	end

	def update

		@event = Event.find(params[:id])

		@event.update(event_params)

		redirect_to show_event_path

	end

	def destroy

		@event = Event.find(params[:id])

		@event.destroy

		redirect_to events_path

	end

	private

	def event_params

		params.require(:event).permit(:description, :date, :place)

	end
end
