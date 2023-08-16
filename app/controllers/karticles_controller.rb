class KarticlesController < ApplicationController
  before_action :set_karticle, only: %i[ show edit update destroy ]
  before_action :authenticate_kuser!
  before_action only: [:create, :new, :destroy, :edit, :update] do
    authorize_request(["author"])
  end
  # GET /karticles or /karticles.json
  def index
    @karticles = Karticle.all
  end

  # GET /karticles/1 or /karticles/1.json
  def show
    @kcomment = Kcomment.new
    @kcomment = @karticle.kcomments
  end

  # GET /karticles/new
  def new
    @karticle = Karticle.new
  end

  # GET /karticles/1/edit
  def edit
  end

  # POST /karticles or /karticles.json
  def create
    @karticle = Karticle.new(karticle_params)
    @karticle.kuser = current_kuser
    respond_to do |format|
      if @karticle.save
        format.html { redirect_to karticle_url(@karticle), notice: "Tu articulo se creó exitosamente" }
        format.json { render :show, status: :created, location: @karticle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @karticle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /karticles/1 or /karticles/1.json
  def update
    respond_to do |format|
      if @karticle.update(karticle_params)
        format.html { redirect_to karticle_url(@karticle), notice: "Karticle was successfully updated." }
        format.json { render :show, status: :ok, location: @karticle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @karticle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /karticles/1 or /karticles/1.json
  def destroy
    @karticle.destroy

    respond_to do |format|
      format.html { redirect_to karticles_url, notice: "Karticle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_karticle
      @karticle = Karticle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def karticle_params
      params.require(:karticle).permit(:content, :kuser_id, kimages: [])
    end
end
