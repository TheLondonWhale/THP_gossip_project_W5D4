class GossipsController < ApplicationController

  before_action :set_gossip, only: [:show, :edit, :update, :destroy]


  def index
    @gossip = Gossip.all.order('created_at ASC')
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.create(gossip_params)
    redirect_to gossip_path(@gossip.id)
  end

  def show

  end

  def edit

  end

  def update
    @gossip.update(gossip_params)
    redirect_to gossip_path(@gossip.id)
  end

  def destroy
    @gossip.destroy
    redirect_to gossips_path
  end

  private

  def set_gossip
    @gossip = Gossip.find(params[:id])
  end

  def gossip_params
    params.require(:gossip).permit(:title, :content, :anonymous_gossiper)
  end
end
