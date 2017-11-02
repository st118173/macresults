class ResultsController < ApplicationController
  #before_action :set_result, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!
  # GET /results
  # GET /results.json
  def index

    @result = Result.new
    @results = Result.all

    @res = Result.order(:standard).select(:standard).uniq
    if params[:r] != nil
      @r = params[:r]
      @results = Result.where('lower(macid) LIKE ? OR lower(name) LIKE ?  OR score >= ?  ', "%#{@r}%","%#{@r}%",@r)
    end


    if params[:macid] != nil
      @macid = params[:macid].downcase
      @clas = params[:standard]
      @h =  Result.where("lower(macid) = ? AND  standard = ?", @macid, @clas)
      if @h.present?
        flash[:notice] = 'Your Result found'
      else
        flash[:error] = 'Please check your details, Your result not found'
      end

    end
  end
@e = 'Enter correct details'
  # GET /results/1
  # GET /results/1.json
  def show
    redirect_to results_path
  end

  # GET /results/new
  def new
    @result = Result.new
    @res = Result.uniq.pluck(:standard)
    @res =Result.select(:standard).uniq


    if params[:name] != nil
      @name = params[:name].downcase
      @clas = params[:standard]
      @h =  Result.where("lower(name) = ? AND  standard = ?", @name, @clas)
    end
  end

  # GET /results/1/edit
  def edit
    @result = Result.find(params[:id])
    if @result.update macid: params[macid: 'macid'],
                      name: params[result: 'name'],
                       standard: params[standard: 'standard'],
                       score: params[score: 'score']
      flash[:notice] = 'Record updated.'
      redirect_to contact_path(@results)
    else
      render 'edit'
    end
  end

  # POST /results
  # POST /results.json
  def create
    @res =Result.select(:standard).distinct(value=true)
    # @result = Result.new(result_params)
    #
    # respond_to do |format|
    #   if @result.save
    #     format.html { redirect_to @result, notice: 'Result was successfully created.' }
    #     format.json { render :show, status: :created, location: @result }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @result.errors, status: :unprocessable_entity }
    #   end
    # end

    @result = Result.new
    if params[:result] != nil
      @result = Result.new(result_params)
      if @result.save
        if params[:result]
          @error_messages = 'Student result was successfully added to list'
          @result = Result.new
          redirect_to root_path
        end

      else
        @result = Result.new
      end

    elsif params[:result] == nil || params[:result] == ''
      redirect_to root_path
      flash[:error]= "Please fill correct details"
      end


end
  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    @result = Result.find(params[:id])
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to results_path, notice: 'Result was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
  Result.find(params[:id]).destroy
  respond_to do |format|
    format.html { redirect_to result_url, notice: 'Record was successfully destroyed.' }
    format.json { head :no_content }
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:name, :standard, :score, :macid)
    end
end
