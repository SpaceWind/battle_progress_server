class HeroDescsController < ApplicationController
  before_action :set_hero_desc, only: [:show, :edit, :update, :destroy]

  # GET /hero_descs
  # GET /hero_descs.json
  def index
    @hero_descs = HeroDesc.all
  end

  # GET /hero_descs/1
  # GET /hero_descs/1.json
  def show
  end

  # GET /hero_descs/new
  def new
    @hero_desc = HeroDesc.new
  end

  # GET /hero_descs/1/edit
  def edit
  end

  # POST /hero_descs
  # POST /hero_descs.json
  def create
    @hero_desc = HeroDesc.new(hero_desc_params)

    respond_to do |format|
      if @hero_desc.save
        format.html { redirect_to @hero_desc, notice: 'Hero desc was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hero_desc }
      else
        format.html { render action: 'new' }
        format.json { render json: @hero_desc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hero_descs/1
  # PATCH/PUT /hero_descs/1.json
  def update
    respond_to do |format|
      if @hero_desc.update(hero_desc_params)
        format.html { redirect_to @hero_desc, notice: 'Hero desc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hero_desc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hero_descs/1
  # DELETE /hero_descs/1.json
  def destroy
    @hero_desc.destroy
    respond_to do |format|
      format.html { redirect_to hero_descs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hero_desc
      @hero_desc = HeroDesc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hero_desc_params
      params.require(:hero_desc).permit(:heroid, :name, :lvl, :mood, :pack_max_size, :exp, :exp_to_next_lvl, :x, :y, :class, :race)
    end
end
