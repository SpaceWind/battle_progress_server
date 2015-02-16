class HDescriptorsController < ApplicationController
  before_action :set_h_descriptor, only: [:show, :edit, :update, :destroy]

  # GET /h_descriptors
  # GET /h_descriptors.json
  def index
    @h_descriptors = HDescriptor.all
  end

  # GET /h_descriptors/1
  # GET /h_descriptors/1.json
  def show
  end

  # GET /h_descriptors/new
  def new
    @h_descriptor = HDescriptor.new
  end

  # GET /h_descriptors/1/edit
  def edit
  end

  # POST /h_descriptors
  # POST /h_descriptors.json
  def create
    @h_descriptor = HDescriptor.new(h_descriptor_params)

    respond_to do |format|
      if @h_descriptor.save
        format.html { redirect_to @h_descriptor, notice: 'H descriptor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @h_descriptor }
      else
        format.html { render action: 'new' }
        format.json { render json: @h_descriptor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /h_descriptors/1
  # PATCH/PUT /h_descriptors/1.json
  def update
    respond_to do |format|
      if @h_descriptor.update(h_descriptor_params)
        format.html { redirect_to @h_descriptor, notice: 'H descriptor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @h_descriptor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /h_descriptors/1
  # DELETE /h_descriptors/1.json
  def destroy
    @h_descriptor.destroy
    respond_to do |format|
      format.html { redirect_to h_descriptors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_h_descriptor
      @h_descriptor = HDescriptor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def h_descriptor_params
      params.require(:h_descriptor).permit(:hid, :hero_name, :mood, :map, :pack_max_size, :experience, :exp_to_next_lvl, :x_pos, :y_pos, :hclass, :hrace)
    end
end
