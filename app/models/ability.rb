class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    if 1 == 2 #current_user #user ||= User.new # guest user (not logged in)
      if user.is_admin?
        can :manage, :all
      elsif user.is_user?

      can :manage, :all

=begin

      #can :manage, Image # I will have to come back to this
      can :read, Post
      can :new, Post
      can :update, Post, :user_id => user.id
      can :destroy, Post, :user_id => user.id
      can :manage, User, :id => user.id


      # collection based permissions
      # http://stackoverflow.com/questions/5904996/using-cancan-to-authorize-a-resource-based-on-a-many-to-many-association/7260446
      can :create, Post, :communities => {:user_id => user.id}
      # this is for collections to but I can't figure it out
      # https://spin.atomicobject.com/2015/04/29/complex-permissions-rails-cancancan/


=end

    end
    else
    can :manage, :all
      # Something for guests ?
    end
  end
end
