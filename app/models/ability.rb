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
    
    unless user
      can :read, Project, :active => true
    else
      if user.is_superuser?
        can :manage, :all
      elsif user.is_admin?
        cannot :destroy, Tenant
        can :manage, [Client, Project, User, Setting], :tenant_id => user.tenant.id
        can [:update, :read], Tenant, :id => user.tenant.id
      elsif !user.is_superuser? && !user.is_admin?
        can :read, Project, :active => true, :client_id => user.client.id
        cannot :destroy, :all
        can :read, User, :id => user.id
        can :update, User, :id => user.id
      end
    end    
  end
end
