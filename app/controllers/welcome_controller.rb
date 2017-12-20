class WelcomeController < ApplicationController
  before_action :authenticate_admin!, only: [:dashboard]

  def index
  end

  def dashboard
		@article = Article.all
	end
end
