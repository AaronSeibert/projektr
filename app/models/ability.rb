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
        # God mode. Nuff said.
        can :manage, :all
        
      elsif user.is_admin?
        # Admins can manage most items belonging to their tenant account
        can :manage, [Client, Project, User, Setting], :tenant_id => user.tenant.id
        
        # They can also update and read their own tenant account
        can [:update, :read], Tenant, :id => user.tenant.id
        
        # But they can't delete any tenant accounts, including their own
        cannot :destroy, Tenant
        
        # Prevent user from deleting their own record
        cannot :destroy, User, :id => user.id
        
      elsif !user.is_superuser? && !user.is_admin?
        can :read, Project, :active => true, :client_id => user.client.id
        can [:update, :read], User, :id => user.id
        cannot :destroy, :all
      end
    end    
  end
end
