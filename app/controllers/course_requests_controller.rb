class CourseRequestsController < ApplicationController
  before_action :set_course_request, only: [:show, :edit, :update, :destroy]

  # GET /course_requests
  # GET /course_requests.json
  def index
    #1st you retrieve the course thanks to params[:course_id]
    course = Course.find(params[:course_id])
    #2nd you get all the course_requests of this course
    @course_requests = course.course_requests

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @course_requests }
    end
  end

  # GET /course_requests/1
  # GET /course_requests/1.json
  def show
    #1st you retrieve the course thanks to params[:course_id]
    course = Course.find(params[:course_id])
    #2nd you retrieve the course_request thanks to params[:id]
    @course_request = course.course_requests.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course_request }
    end
  end

  # GET /course_requests/new
  def new
    #1st you retrieve the course thanks to params[:course_id]
    course = Course.find(params[:course_id])
    #2nd you build a new one
    @course_request = course.course_requests.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course_request }
    end
  end

  # GET /course_requests/1/edit
  def edit
    #1st you retrieve the course thanks to params[:course_id]
    course = Course.find(params[:course_id])
    #2nd you retrieve the course_request thanks to params[:id]
    @course_request = course.course_requests.find(params[:id])
  end

  # POST /course_requests
  # POST /course_requests.json
  def create
    #1st you retrieve the course thanks to params[:course_id]
    course = Course.find(params[:course_id])
    #2nd you create the course_request with arguments in params[:course_request]
    @course_request = course.course_requests.create(course_request_params)

    respond_to do |format|
      if @course_request.save
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource course_request
        format.html { redirect_to([@course_request.course, @course_request], :notice => 'course_request was successfully created.') }
        #the key :location is associated to an array in order to build the correct route to the nested resource course_request
        format.xml  { render :xml => @course_request, :status => :created, :location => [@course_request.course, @course_request] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_requests/1
  # PATCH/PUT /course_requests/1.json
  def update
    #1st you retrieve the course thanks to params[:course_id]
    course = Course.find(params[:course_id])
    #2nd you retrieve the course_request thanks to params[:id]
    @course_request = course.course_requests.find(params[:id])

    respond_to do |format|
      if @course_request.update_attributes(course_request_params)
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource course_request
        format.html { redirect_to([@course_request.course, @course_request], :notice => 'course_request was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /course_requests/1
  # DELETE /course_requests/1.json
  def destroy
    #1st you retrieve the course thanks to params[:course_id]
    course = Course.find(params[:course_id])
    #2nd you retrieve the course_request thanks to params[:id]
    @course_request = course.course_requests.find(params[:id])
    @course_request.destroy

    respond_to do |format|
      #1st argument reference the path /courses/:course_id/course_requests/
      format.html { redirect_to(course_course_requests_url) }
      format.xml  { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_request
      course = Course.find(params[:course_id]);
      @course_request = course.course_requests.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_request_params
      params.require(:course_request).permit(:course_id, :status, :course_id)
    end
end
