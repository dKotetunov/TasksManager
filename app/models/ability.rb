class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, :to => :crud
    can :read, Task

    if user.admin?
      can :manage, Project
    elsif user.moderator?
      can :crud, Task
      can :read, Project, user_id: user.id
    elsif user.simple_user?
      can [:start, :finish], Task, user_id: user.id
      can :read, Project do |project|
        project.tasks.where(user_id: user.id).any?
      end
    end
  end
end
