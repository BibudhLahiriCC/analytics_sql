class DaysSinceVisitsController < ApplicationController
  # GET /days_since_visits
  # GET /days_since_visits.json
  def index
    @days_since_visits = DaysSinceVisit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @days_since_visits }
    end
  end

  # GET /days_since_visits/1
  # GET /days_since_visits/1.json
  def show
    @days_since_visit = DaysSinceVisit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @days_since_visit }
    end
  end

  # GET /days_since_visits/new
  # GET /days_since_visits/new.json
  def new
    @days_since_visit = DaysSinceVisit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @days_since_visit }
    end
  end

  # GET /days_since_visits/1/edit
  def edit
    @days_since_visit = DaysSinceVisit.find(params[:id])
  end

  # POST /days_since_visits
  # POST /days_since_visits.json
  def create
    @days_since_visit = DaysSinceVisit.new(params[:days_since_visit])

    respond_to do |format|
      if @days_since_visit.save
        format.html { redirect_to @days_since_visit, :notice => 'Days since visit was successfully created.' }
        format.json { render :json => @days_since_visit, :status => :created, :location => @days_since_visit }
      else
        format.html { render :action => "new" }
        format.json { render :json => @days_since_visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /days_since_visits/1
  # PUT /days_since_visits/1.json
  def update
    @days_since_visit = DaysSinceVisit.find(params[:id])

    respond_to do |format|
      if @days_since_visit.update_attributes(params[:days_since_visit])
        format.html { redirect_to @days_since_visit, :notice => 'Days since visit was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @days_since_visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /days_since_visits/1
  # DELETE /days_since_visits/1.json
  def destroy
    @days_since_visit = DaysSinceVisit.find(params[:id])
    @days_since_visit.destroy

    respond_to do |format|
      format.html { redirect_to days_since_visits_url }
      format.json { head :ok }
    end
  end
end
