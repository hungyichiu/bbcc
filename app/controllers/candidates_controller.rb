class CandidatesController < ApplicationController
  before_action :find_candidate, except: [:index, :new, :create]
  def index
    @candidates = Candidate.all
  end 

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(clean_params)

    if @candidate.save
      redirect_to root_path, notice: "Create Success!"        
    else
      render :new
    end
    
  end

  def show

  end

  def edit

  end

  def update
    if @candidate.update(clean_params)
      redirect_to root_path, notice: "Update Success!"
    else
      render :edit
    end
  end

  def destroy
    @candidate.destroy
    redirect_to root_path, notice: " Deleted!"
  end

  private
  def clean_params
    params.require(:candidate).permit(:name, :party, :age, :policy)
  end

  def find_candidate
    @candidate = Candidate.find_by(id: params["id"])
  end
end
