class CommentsController < ApplicationController

  
  def create
    @comment = Comment.create!(content: params[:content],gossip_id: params[:gossip_id] ,user_id: User.all.sample.id)
    flash[:notice] = 'Le commentaire a bien été publié !'
    redirect_to request.referrer
  end

  def edit
    @comment = Comment.find(params['id'])
  end

  def update
    @comment = Comment.find(params['id'])
    @path = Gossip.find_by(id: @comment.gossip_id)
    if @comment.update(content: params['comment']['content'])
      flash[:notice] = 'Le commentaire a bien été mis à jour !'
      redirect_to "/gossips"
    else
      flash[:alert] = @comment.errors.full_messages[0]
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Le commentaire a bien été supprimé !'
    redirect_to "/gossips"
  end
end
