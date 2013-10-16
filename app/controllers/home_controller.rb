class HomeController < ApplicationController
	def index
		redirect_to games_url
	end
end