class ConstituenciesController < ApplicationController
  before_action :set_constituency, only: %i[ show edit update destroy ]

  # GET /constituencies or /constituencies.json
  def index
    @constituencies = Constituency.all
  end

  # GET /constituencies/1 or /constituencies/1.json
  def show
  end

  # GET /constituencies/new
  def new
    @constituency = Constituency.new
  end

  # GET /constituencies/1/edit
  def edit
  end

  # POST /constituencies or /constituencies.json
  def create
    @constituency = Constituency.new(constituency_params)

    respond_to do |format|
      if @constituency.save
        format.html { redirect_to constituency_url(@constituency), notice: "Constituency was successfully created." }
        format.json { render :show, status: :created, location: @constituency }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @constituency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /constituencies/1 or /constituencies/1.json
  def update
    respond_to do |format|
      if @constituency.update(constituency_params)
        format.html { redirect_to constituency_url(@constituency), notice: "Constituency was successfully updated." }
        format.json { render :show, status: :ok, location: @constituency }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @constituency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /constituencies/1 or /constituencies/1.json
  def destroy
    @constituency.destroy

    respond_to do |format|
      format.html { redirect_to constituencies_url, notice: "Constituency was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_constituency
      @constituency = Constituency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def constituency_params
      params.require(:constituency).permit(:name, :display_in_navbar)
    end
end
