class LeadsController < ActionController::Base
  def index
  	@leads = Lead.paginate(page: params[:page], per_page: 10)
  end

  def new
  	@lead = Lead.new
  end

  def create
  	# render plain: params[:lead].inspect
    # debugger
  	@lead = Lead.new(lead_params)
    @lead.user = User.first

  	if @lead.save

      UserMailer.registration_confirmation(@lead).deliver_now

  		flash[:notice] = "Lead was successfully created"
  		redirect_to lead_path(@lead)
  	else
  		render 'new'
  	end
  end

  def destroy
    @lead = Lead.find(params[:id])
    @lead.destroy
    flash[:notice] = "Lead was successfully deleted"
    redirect_to leads_path
  end
  
  def show
  	@lead = Lead.find(params[:id])
  	# render json: @lead
  end

  def edit
  	@lead = Lead.find(params[:id])
  end

  def update
  	@lead = Lead.find(params[:id])
  	if @lead.update(lead_params)
  		flash[:notice] = "Lead was successfully updated"
	  	redirect_to lead_path(@lead)
	  else
	  	render 'edit'	
  	end
  end

  private
  	def lead_params
  		params.require(:lead).permit(:name, :phoneno, :email, :category)
  	end
end
