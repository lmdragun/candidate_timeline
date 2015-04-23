class CandidatesController < ApplicationController
  before_action :find_candidate, only: [:show, :edit, :update, :destroy]



  	def index
  		@candidates = Candidate.all
  	end

    def new
  		@candidate = Candidate.new
  	end

  	def show
      @candidate = Candidate.find(params[:id])
      @articles = @candidate.articles.all
  	end

  	def edit

  	end

  	def create
  		@candidate = Candidate.create!(candidate_params)
  		redirect_to @candidate
  	end

  	def update
  		@candidate.update(candidate_params)
  		redirect_to @candidate
  	end

  	def destroy
  		@candidate.destroy
  		redirect_to candidate_url
  	end

  	private

    def candidate_params
      return params[:candidate].permit(:name, :party)
    end

    private

    def find_candidate
      @candidate = Candidate.find(params[:id])
    end

end
