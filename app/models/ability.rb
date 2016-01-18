class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud
    can :read, Task
    can [:read, :create], Comment
    can [:update, :destroy], Comment, user_id: user.id

    if user.admin?
      can :manage, Project
    elsif user.moderator?
      can [:create, :read, :destroy], Task
      can :update, Task, status: "not_started"
      can :read, Project, user_id: user.id
    elsif user.simple_user?
      can [:start, :finish], Task, user_id: user.id
      can :read, Project do |project|
        project.tasks.where(user_id: user.id).any?
      end
    end
  end
end
