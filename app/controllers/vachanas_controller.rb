class VachanasController < ApplicationController
  # GET /vachanas
  # GET /vachanas.json
  def index
    if params[:vachana]
      @pada = params[:vachana]
      @vachanas = Vachana.search_vachana_pada(@pada)
      counts = @vachanas.values
      @total_counts = counts.inject{|sum,x| sum + x }
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vachanas }
    end
  end

  # GET /vachanas/1
  # GET /vachanas/1.json
  def show
    @vachana = Vachana.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vachana }
    end
  end

  # GET /vachanas/new
  # GET /vachanas/new.json
  def new
    @vachana = Vachana.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vachana }
    end
  end

  # GET /vachanas/1/edit
  def edit
    @vachana = Vachana.find(params[:id])
  end

  # POST /vachanas
  # POST /vachanas.json
  def create
    @vachana = Vachana.new(params[:vachana])

    respond_to do |format|
      if @vachana.save
        format.html { redirect_to @vachana, notice: 'Vachana was successfully created.' }
        format.json { render json: @vachana, status: :created, location: @vachana }
      else
        format.html { render action: "new" }
        format.json { render json: @vachana.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vachanas/1
  # PUT /vachanas/1.json
  def update
    @vachana = Vachana.find(params[:id])

    respond_to do |format|
      if @vachana.update_attributes(params[:vachana])
        format.html { redirect_to @vachana, notice: 'Vachana was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vachana.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vachanas/1
  # DELETE /vachanas/1.json
  def destroy
    @vachana = Vachana.find(params[:id])
    @vachana.destroy

    respond_to do |format|
      format.html { redirect_to vachanas_url }
      format.json { head :no_content }
    end
  end
end
