class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[ show edit update destroy upvote downvote]

  # GET /candidates or /candidates.json
  def index
    if params.has_key?(:constituency)
      @constituency = Constituency.find_by_name(params[:constituency])
      @candidates = Candidate.where(constituency: @constituency)
    else
    @candidates = Candidate.all
    end
  end


  def upvote
    
    @candidate.upvote_from current_user
    redirect_to candidates_path
  end

  def downvote
    
    @candidate.downvote_from current_user
    redirect_to candidates_path
  end




  # GET /candidates/1 or /candidates/1.json
  def show
  end

  # GET /candidates/new
  def new
    @candidate = Candidate.new
  end

  # GET /candidates/1/edit
  def edit
  end

  # POST /candidates or /candidates.json
  def create
    @candidate = Candidate.new(candidate_params)

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to candidate_url(@candidate), notice: "Candidate was successfully created." }
        format.json { render :show, status: :created, location: @candidate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidates/1 or /candidates/1.json
  def update
    respond_to do |format|
      if @candidate.update(candidate_params)
        format.html { redirect_to candidate_url(@candidate), notice: "Candidate was successfully updated." }
        format.json { render :show, status: :ok, location: @candidate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1 or /candidates/1.json
  def destroy
    @candidate.destroy

    respond_to do |format|
      format.html { redirect_to candidates_url, notice: "Candidate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def candidate_params
      params.require(:candidate).permit(:partyname, :constituency_id)
    end
end
