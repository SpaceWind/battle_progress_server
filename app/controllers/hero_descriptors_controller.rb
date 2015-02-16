class HeroDescriptorsController < ApplicationController
  before_action :set_hero_descriptor, only: [:show, :edit, :update, :destroy]

  # GET /hero_descriptors
  # GET /hero_descriptors.json
  def index
    @hero_descriptors = HeroDescriptor.all
  end

  # GET /hero_descriptors/1
  # GET /hero_descriptors/1.json
  def show
  end

  # GET /hero_descriptors/new
  def new
    @hero_descriptor = HeroDescriptor.new
  end

  # GET /hero_descriptors/1/edit
  def edit
  end

  # POST /hero_descriptors
  # POST /hero_descriptors.json
  def create
    @hero_descriptor = HeroDescriptor.new(hero_descriptor_params)

    respond_to do |format|
      if @hero_descriptor.save
        format.html { redirect_to @hero_descriptor, notice: 'Hero descriptor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hero_descriptor }
      else
        format.html { render action: 'new' }
        format.json { render json: @hero_descriptor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hero_descriptors/1
  # PATCH/PUT /hero_descriptors/1.json
  def update
    respond_to do |format|
      if @hero_descriptor.update(hero_descriptor_params)
        format.html { redirect_to @hero_descriptor, notice: 'Hero descriptor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hero_descriptor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hero_descriptors/1
  # DELETE /hero_descriptors/1.json
  def destroy
    @hero_descriptor.destroy
    respond_to do |format|
      format.html { redirect_to hero_descriptors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hero_descriptor
      @hero_descriptor = HeroDescriptor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hero_descriptor_params
      params.require(:hero_descriptor).permit(:heroid, :name, :lvl, :mood, :map, :pack_max_size, :exp, :exp_to_next_lvl, :x, :y, :class, :race)
    end
end
