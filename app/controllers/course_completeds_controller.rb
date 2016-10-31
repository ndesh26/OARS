class CourseCompletedsController < ApplicationController
  before_action :set_course_completed, only: [:show, :edit, :update, :destroy]

  # GET /course_completeds
  # GET /course_completeds.json
  def index
    @course_completeds = CourseCompleted.all
  end

  # GET /course_completeds/1
  # GET /course_completeds/1.json
  def show
  end

  # GET /course_completeds/new
  def new
    @course_completed = CourseCompleted.new
  end

  # GET /course_completeds/1/edit
  def edit
  end

  # POST /course_completeds
  # POST /course_completeds.json
  def create
    @course_completed = CourseCompleted.new(course_completed_params)

    respond_to do |format|
      if @course_completed.save
        format.html { redirect_to @course_completed, notice: 'Course completed was successfully created.' }
        format.json { render :show, status: :created, location: @course_completed }
      else
        format.html { render :new }
        format.json { render json: @course_completed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_completeds/1
  # PATCH/PUT /course_completeds/1.json
  def update
    respond_to do |format|
      if @course_completed.update(course_completed_params)
        format.html { redirect_to @course_completed, notice: 'Course completed was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_completed }
      else
        format.html { render :edit }
        format.json { render json: @course_completed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_completeds/1
  # DELETE /course_completeds/1.json
  def destroy
    @course_completed.destroy
    respond_to do |format|
      format.html { redirect_to course_completeds_url, notice: 'Course completed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_completed
      @course_completed = CourseCompleted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_completed_params
      params.require(:course_completed).permit(:name, :code, :credit, :grade)
    end
end
