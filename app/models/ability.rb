class Ability
  include CanCan::Ability

  def initialize(owner)
    can :create, :all
    can [:read, :update, :destroy], Store, id: Store.with_role(:admin, owner).pluck(:id)
    can [:read, :update, :destroy], Goal, store_id: Store.with_role(:admin, owner).pluck(:id)
    can [:read, :update, :destroy], Employee, store_id: Store.with_role(:admin, owner).pluck(:id)
  end
end
