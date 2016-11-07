class CourseStoresController < ApplicationController
  before_action :set_course_store, only: [:show, :edit, :update, :destroy]

  # GET /course_stores
  # GET /course_stores.json
  def index
    @course_stores = CourseStore.all
  end

  # GET /course_stores/1
  # GET /course_stores/1.json
  def show
  end

  # GET /course_stores/new
  def new
    @course_store = CourseStore.new
  end

  # GET /course_stores/1/edit
  def edit
  end

  # POST /course_stores
  # POST /course_stores.json
  def create
    @course_store = CourseStore.new(course_store_params)

    respond_to do |format|
      if @course_store.save
        format.html { redirect_to @course_store, notice: 'Course store was successfully created.' }
        format.json { render :show, status: :created, location: @course_store }
      else
        format.html { render :new }
        format.json { render json: @course_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_stores/1
  # PATCH/PUT /course_stores/1.json
  def update
    respond_to do |format|
      if @course_store.update(course_store_params)
        format.html { redirect_to @course_store, notice: 'Course store was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_store }
      else
        format.html { render :edit }
        format.json { render json: @course_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_stores/1
  # DELETE /course_stores/1.json
  def destroy
    @course_store.destroy
    respond_to do |format|
      format.html { redirect_to course_stores_url, notice: 'Course store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_store
      @course_store = CourseStore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_store_params
      params.require(:course_store).permit(:title, :code, :dept, :credit, :grade, :sem, :user_id)
    end
end
