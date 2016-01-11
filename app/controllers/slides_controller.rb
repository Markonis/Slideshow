class SlidesController < ApplicationController
  before_action :set_slide, only: [:show, :edit, :update, :destroy]

  before_action :set_presentation

  # GET /presentation/1/slides
  # GET /presentation/1/slides.json
  def index
    @slides = Slide.where(presentation_id: @presentation.id)
  end

  # GET /presentation/1/slides/1
  # GET /presentation/1/slides/1.json
  def show
  end

  # GET /presentation/1/slides/new
  def new
    @slide = Slide.new
  end

  # GET /presentation/1/slides/1/edit
  def edit
  end

  # POST /presentation/1/slides
  # POST /presentation/1/slides.json
  def create
    @slide = Slide.new(slide_params)

    respond_to do |format|
      if @slide.save
        format.html { redirect_to presentation_slide_path(@presentation, @slide), notice: 'Slide was successfully created.' }
        format.json { render :show, status: :created, location: @slide }
      else
        format.html { render :new }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presentation/1/slides/1
  # PATCH/PUT /presentation/1/slides/1.json
  def update
    respond_to do |format|
      if @slide.update(slide_params)
        format.html { redirect_to presentation_slide_path(@presentation, @slide), notice: 'Slide was successfully updated.' }
        format.json { render :show, status: :ok, location: @slide }
      else
        format.html { render :edit }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentation/1/slides/1
  # DELETE /presentation/1/slides/1.json
  def destroy
    @slide.destroy
    respond_to do |format|
      format.html { redirect_to presentation_slides_path @presentation, notice: 'Slide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slide
      @slide = Slide.find(params[:id])
    end

    def set_presentation
      @presentation = Presentation.find(params[:presentation_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slide_params
      params.require(:slide).permit(:title, :page_number, :image_url, :presentation_id)
    end
end
