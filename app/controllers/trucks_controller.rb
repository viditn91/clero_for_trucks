class TrucksController < ActionController::Base
  
  def update_location
    @resource = Truck.find_by(number: params[:truck_number])
    if @resource.nil?
      render text: "Such Truck does not exist"
    end
  end

  def update
    @resource = Truck.find_by(id: params[:id])
    if @resource
      if @resource.update(update_params)
        p @resource
        p update_params
        render text: "Location of Truck-#{ @resource.number } has been updated." and return
      end
    end
    render text: "Location of Truck-#{ @resource.number } could not be updated."
  end

  private
    def update_params
      params.permit(:latitude, :longitude)
    end

end