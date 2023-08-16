class KcommentsController < ApplicationController
  before_action :set_kcomment, only: %i[ show edit update destroy ]
  before_action :authenticate_kuser!, except: %i[index]
  before_action only: [:create, :new, :edit, :update, :destroy] do
    authorize_request(["normal_kuser", "author"])
  end

  # GET /kcomments/1 or /kcomments/1.json
  def show
  end

  # GET /kcomments/new
  def new
    @kcomment = Kcomment.new
  end

  # GET /kcomments/1/edit
  def edit
  end

  # POST /kcomments or /kcomments.json
  def create
    @kcomment = Kcomment.new(kcomment_params)
    @kcomment.kuser = current_kuser

    respond_to do |format|
      if @kcomment.save
        format.html { redirect_to kcomments_url(@kcomment), notice: "Comentario agregado exitosamente" }
        format.json { render :show, status: :created, location: @kcomment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kcomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kcomments/1 or /kcomments/1.json
  def update
    respond_to do |format|
      if @kcomment.update(kcomment_params)
        format.html { redirect_to kcomment_url(@kcomment), notice: "ya se editó tu comentario" }
        format.json { render :show, status: :ok, location: @kpost }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kcomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kcomments/1 or /kcomments/1.json
  def destroy
    @kcomment.destroy

    respond_to do |format|
      format.html { redirect_to kcomments_url, notice: "Ya se eliminó tu comentario" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kcomment
      @kcomment = Kcomment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kcomment_params
      params.require(:kcomment).permit(:content, :kuser_id, :karticle_id)
    end
end
