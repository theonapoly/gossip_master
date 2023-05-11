class GossipsController < ApplicationController
  def index
    @gossips = Gossip.order(:id)
  end

  def new_gossip
    @gossip = Gossip.new()
    puts "#{'$'*60} #{@gossip}"
  end

  def show_new_gossip
    @gossips = Gossip.all
    @gossip = Gossip.find(params[:id])
    @user = @gossip.user
    @city = @user.city
    puts "#{'M'*60} #{@gossip}"
  end 


  def create
    @gossip = Gossip.new(title: params['title'], content: params['content'], user_id: User.all.sample.id)
    puts "#{'€'*60} #{@gossip}"
    if @gossip.save
      flash[:notice] = 'Le potin a bien été créé'
      redirect_to "/show_new_gossip/#{@gossip.id}"
    else
      flash[:alert] = @gossip.errors.full_messages[0]
      render 'gossips/index'
    end 
  end

  def edit
    @gossip = Gossip.find(params[:id])
    puts "editgossip"*10
  end

  def update
    @gossip = Gossip.find(params[:id])
    post_params = params.require(:gossip).permit(:title, :content)
    if @gossip.update(post_params)
      flash[:notice] = 'Le potin a bien été mis à jour'
    redirect_to '/gossips'
    else
      flash[:alert] = @gossip.errors.full_messages[0]
      render 'gossips/index'
    end
  end
  
  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    flash[:notice] = 'Le potin a bien été détruit !'
    redirect_to '/gossips'
  end
end
