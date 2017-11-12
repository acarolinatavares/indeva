class Ability
  include CanCan::Ability

  def initialize(owner)
    can :create, :all
    can [:read, :update, :destroy], Store, id: Store.with_role(:admin, owner).pluck(:id)
    can [:read, :update, :destroy], Goal, id: Goal.with_role(:admin, owner).pluck(:id)
    can [:read, :update, :destroy], Employee, id: Employee.with_role(:admin, owner).pluck(:id)
  end
end
