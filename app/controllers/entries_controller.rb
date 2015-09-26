class EntriesController < ActionController::Base
  
  def create
    if(Entry.create(create_params))
      redirect_to "/terms"
    else
      redirect_to "/"
    end
  end

  private
    def create_params
      params.permit(:from_city_id, :to_city_id, :material_id, :truck_type_id, :weight_id, :date, :number_of_trucks, :mobile)
    end
end
