class FriendshipsController < ApplicationController

  def create
    #binding.pry
    #user_x = User.find(params[:id])
    user_x = User.find(friendship_params[:id])
    current_user.friendships.build(friend_id: user_x.id, status: Friendship::PENDING )
    current_user.save!

    redirect_to(request.env['HTTP_REFERER'])
  end


  def friendship_params
    params.require(:friendship).permit(:id)
  end


end
