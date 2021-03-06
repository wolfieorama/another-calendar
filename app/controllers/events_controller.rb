class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.scoped
    @events = Event.between(params['start'], params['end']) if (params['start'] && params['end'])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, :notice => 'Event was successfully created.' }
        format.json { render :json => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, :notice => 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
# class EventsController < ApplicationController
#   # before_action :set_event, only: [:show, :edit, :update, :destroy]
#
#   # GET /events
#   # GET /events.json
#   def index
#     @events = Event.scoped
#     @events = Event.between(params['start'], params['end']) if (params['start'] && params['end'])
#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render :json => @events }
#    end
#   end
#
#   # GET /events/1
#   # GET /events/1.json
#   def show
#     @event = Event.find(params[:id])
#
#     respond_to do |format|
#       format.html # show.html.erb
#       format.json { render :json => @event }
#     end
#   end
#
#   # GET /events/new
#   def new
#     @event = Event.new
#
#     respond_to do |format|
#       format.html # new.html.erb
#       format.json { render :json => @event }
#     end
#   end
#
#   # GET /events/1/edit
#   def edit
#      @event = Event.find(params[:id])
#   end
#
#   # POST /events
#   # POST /events.json
#   def create
#     @event = Event.new(params[:event])
#
#     respond_to do |format|
#       if @event.save
#         format.html { redirect_to @event, :notice => 'Event was successfully created.' }
#         format.json { render :json => @event, :status => :created, :location => @event }
#       else
#         format.html { render :action => "new" }
#         format.json { render :json => @event.errors, :status => :unprocessable_entity }
#       end
#     end
#   end
#
#   # PATCH/PUT /events/1
#   # PATCH/PUT /events/1.json
#   def update
#     @event = Event.find(params[:id])
#
#     respond_to do |format|
#       if @event.update_attributes(params[:event])
#         format.html { redirect_to @event, :notice => 'Event was successfully updated.' }
#         format.json { head :no_content }
#       else
#         format.html { render :action => "edit" }
#         format.json { render :json => @event.errors, :status => :unprocessable_entity }
#       end
#     end
#   end
#
#   # DELETE /events/1
#   # DELETE /events/1.json
#   def destroy
#       @event = Event.find(params[:id])
#       @event.destroy
#
#       respond_to do |format|
#         format.html { redirect_to events_url }
#         format.json { head :no_content }
#       end
#     end
#   end
#
#   # private
#   #   # Use callbacks to share common setup or constraints between actions.
#   #   def set_event
#   #     @event = Event.find(params[:id])
#   #   end
#   #
#   #   # Never trust parameters from the scary internet, only allow the white list through.
#   #   def event_params
#   #     params.require(:event).permit(:title, :starts_at, :ends_at, :all_day, :description)
#   #   end
# end
