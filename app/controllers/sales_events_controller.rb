# frozen_string_literal: true

class SalesEventsController < ApplicationController
  before_action :set_sales_event, only: %i[show edit update destroy]

  # GET /sales_events
  def index
    @sales_events = SalesEvent.all
                              .order(updated_at: :desc)
                              .page params[:page]
  end

  # GET /sales_events/1
  def show; end

  # GET /sales_events/new
  def new
    @sales_event = SalesEvent.new
  end

  # GET /sales_events/1/edit
  def edit; end

  # POST /sales_events
  def create
    @sales_event = SalesEvent.new(sales_event_params)

    if @sales_event.save
      redirect_to @sales_event, notice: 'Sales event was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sales_events/1
  def update
    if @sales_event.update(sales_event_params)
      redirect_to @sales_event, notice: 'Sales event was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /sales_events/1
  def destroy
    @sales_event.destroy!
    redirect_to sales_events_url, notice: 'Sales event was successfully destroyed.', status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sales_event
    @sales_event = SalesEvent.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sales_event_params
    params.require(:sales_event).permit(:store, :model, :inventory)
  end
end
