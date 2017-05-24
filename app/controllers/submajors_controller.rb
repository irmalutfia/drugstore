class SubmajorsController < ApplicationController
  before_action :set_submajor, only: [:show, :edit, :update, :destroy]

  # GET /submajors
  # GET /submajors.json
  def index
    @submajors = Submajor.all
  end

  # GET /submajors/1
  # GET /submajors/1.json
  def show
  end

  # GET /submajors/new
  def new
    @submajor = Submajor.new
  end

  # GET /submajors/1/edit
  def edit
  end

  # POST /submajors
  # POST /submajors.json
  def create
    @submajor = Submajor.new(submajor_params)

    respond_to do |format|
      if @submajor.save
        format.html { redirect_to @submajor, notice: 'Submajor was successfully created.' }
        format.json { render :show, status: :created, location: @submajor }
      else
        format.html { render :new }
        format.json { render json: @submajor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submajors/1
  # PATCH/PUT /submajors/1.json
  def update
    respond_to do |format|
      if @submajor.update(submajor_params)
        format.html { redirect_to @submajor, notice: 'Submajor was successfully updated.' }
        format.json { render :show, status: :ok, location: @submajor }
      else
        format.html { render :edit }
        format.json { render json: @submajor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submajors/1
  # DELETE /submajors/1.json
  def destroy
    @submajor.destroy
    respond_to do |format|
      format.html { redirect_to submajors_url, notice: 'Submajor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submajor
      @submajor = Submajor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submajor_params
      params.require(:submajor).permit(:konsentrasi, :major_id)
    end
end
