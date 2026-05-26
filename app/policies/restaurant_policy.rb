class RestaurantPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  # This is for the index action
  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.where(user: user)
      # user.restaurants
      scope.all
    end
  end

  # create a method name the same
  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    # do we have a restaurant or a user? YES
    # current_user -> user
    # @restaurant -> record
    user == record.user
  end

  def update?
    user == record.user
  end

  def destroy?
    user == record.user # || user.admin?
  end
end
