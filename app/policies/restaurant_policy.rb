class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope == Restaurant
      scope.all
      #              👇 Restaurant attribute
      # scope.where(user: user)
      #                    👆 Current User
    end
  end

  def create?
    user
  end

  def show?
    true
  end

  def update?
    # The owner should be able to edit
    # current_user == @restaurant.user
    user == record.user || user.admin?
  end

  def destroy?
    user == record.user
  end
end
