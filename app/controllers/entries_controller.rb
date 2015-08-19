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
      params.require(:entry).permit(:email, :mobile, :location, :brand, :type_of)
    end
end