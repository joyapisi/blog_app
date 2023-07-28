class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    user ||= User.new

    # Define a few sample abilities
    can :read, Post, is_publised: true

    return unless user.present?

    can :manage, Post, author_id: user.id
    can :manage, Comment, author_id: user.id

    return unless user.admin?

    can :manage, :all
  end
end
