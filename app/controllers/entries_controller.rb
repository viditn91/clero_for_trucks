class EntriesController < ActionController::Base
  
  def create
    entry = Entry.new(create_params)
    if(entry.save)
      redirect_to "/terms"
    else
      redirect_to "/"
    end
  end

  private
    def create_params
      params.permit(:source, :destination, :material_id, :truck_type_id, :weight, :date, :number_of_trucks, :mobile)
    end
end