class CourseCompletedsController < ApplicationController
  before_action :set_course_completed, only: [:show, :edit, :update, :destroy]

  # GET /course_completeds
  # GET /course_completeds.json
  def index
    #1st you retrieve the post thanks to params[:post_id]
    user = User.find(params[:user_id])
    #2nd you get all the comments of this post
    @course_completeds = user.course_completeds

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @course_completeds }
    end
  end

  # GET /course_completeds/1
  # GET /course_completeds/1.json
  def show
    #1st you retrieve the post thanks to params[:post_id]
    user = User.find(params[:user_id])
    #2nd you retrieve the comment thanks to params[:id]
    @course_completed = user.course_completeds.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course_completed }
    end
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
