class CourseCompletedsController < ApplicationController
  before_action :set_course_completed, only: [:show, :edit, :update, :destroy]

  # GET /users/:user_id/course_completeds
  # GET /users/:user_id/course_completeds.xml
  def index
    #1st you retrieve the user thanks to params[:user_id]
    user = User.find(params[:user_id])
    #2nd you get all the course_completeds of this user
    @course_completeds = user.course_completeds

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @course_completeds }
    end
  end

  # GET /users/:user_id/course_completeds/1
  # GET /users/:user_id/course_completeds/1.xml
  def show
    #1st you retrieve the user thanks to params[:user_id]
    user = User.find(params[:user_id])
    #2nd you retrieve the course_completed thanks to params[:id]
    @course_completed = user.course_completeds.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course_completed }
    end
  end

  # GET /users/:user_id/course_completeds/new
  def new
    #1st you retrieve the user thanks to params[:user_id]
    user = User.find(params[:user_id])
    #2nd you build a new one
    @course_completed = user.course_completeds.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course_completed }
    end
  end

  # GET /users/:user_id/course_completeds/1/edit
  def edit
    #1st you retrieve the user thanks to params[:user_id]
    user = User.find(params[:user_id])
    #2nd you retrieve the course_completed thanks to params[:id]
    @course_completed = user.course_completeds.find(params[:id])
  end

  # user /users/:user_id/course_completeds
  # user /users/:user_id/course_completeds.xml
  def create
    #1st you retrieve the user thanks to params[:user_id]
    user = User.find(params[:user_id])
    #2nd you create the course_completed with arguments in params[:course_completed]
    @course_completed = user.course_completeds.create(course_completed_params)

    respond_to do |format|
      if @course_completed.save
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource course_completed
        format.html { redirect_to([@course_completed.user, @course_completed], :notice => 'course_completed was successfully created.') }
        #the key :location is associated to an array in order to build the correct route to the nested resource course_completed
        format.xml  { render :xml => @course_completed, :status => :created, :location => [@course_completed.user, @course_completed] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course_completed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/:user_id/course_completeds/1
  # PATCH/PUT /users/:user_id/course_completeds/1.xml
  def update
    #1st you retrieve the user thanks to params[:user_id]
    user = User.find(params[:user_id])
    #2nd you retrieve the course_completed thanks to params[:id]
    @course_completed = user.course_completeds.find(params[:id])

    respond_to do |format|
      if @course_completed.update_attributes(course_completed_params)
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource course_completed
        format.html { redirect_to([@course_completed.user, @course_completed], :notice => 'course_completed was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course_completed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/:user_id/course_completeds/1
  # DELETE /users/:user_id/course_completeds/1.xml
  def destroy
    #1st you retrieve the user thanks to params[:user_id]
    user = User.find(params[:user_id])
    #2nd you retrieve the course_completed thanks to params[:id]
    @course_completed = user.course_completeds.find(params[:id])
    @course_completed.destroy

    respond_to do |format|
      #1st argument reference the path /users/:user_id/course_completeds/
      format.html { redirect_to(user_course_completeds_url) }
      format.xml  { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_completed
      user = User.find(params[:user_id])
      @course_completed = user.course_completeds.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_completed_params
      params.require(:course_completed).permit(:name, :code, :credit, :grade)
    end
end
