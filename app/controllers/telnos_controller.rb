class TelnosController < ApplicationController
  before_action :set_telno, only: [:show, :edit, :update, :destroy]

  # GET /telnos
  # GET /telnos.json
  def index
    @telnos = Telno.order(name: :asc, owner: :asc)
    @telno = Telno.new
  end

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "해당하는 자료가 없습니다") and return
    else
      @parameter = params[:search].downcase
      @results = Telno.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
    end

    @telno = Telno.new
    @telnos = Telno.order(name: :asc, owner: :asc)

  end

  # GET /telnos/1
  # GET /telnos/1.json
  def show
  end

  # GET /telnos/new
  def new
    @telno = Telno.new
  end

  # GET /telnos/1/edit
  def edit
  end

  # POST /telnos
  # POST /telnos.json
  def create
    @telno = Telno.new(telno_params)

    respond_to do |format|
      if @telno.save
        format.html { redirect_to telnos_url, notice: '신규 전화번호가 등록되었습니다.' }
        format.json { render :show, status: :created, location: @telno }
      else
        format.html { render :new }
        format.json { render json: @telno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /telnos/1
  # PATCH/PUT /telnos/1.json
  def update
    respond_to do |format|
      if @telno.update(telno_params)
        format.html { redirect_to telnos_url, notice: '전화번호가 수정되었습니다.' }
        format.json { render :show, status: :ok, location: @telno }
      else
        format.html { render :edit }
        format.json { render json: @telno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telnos/1
  # DELETE /telnos/1.json
  def destroy
    @telno.destroy
    respond_to do |format|
      format.html { redirect_to telnos_url, notice: '전화번호가 삭제되었습니다.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telno
      @telno = Telno.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def telno_params
      params.require(:telno).permit(:name, :telno, :owner)
    end
end
