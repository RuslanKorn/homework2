class MoviePolicy < Struct.new(:user, :movie)
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.admin?
        scope.all
      else
        scope.where('draft = ? OR user_id = ?', false, user)
      end
    end
  end

  def create?
    user.admin?
  end
  alias_method :new?, :create?

  def update?
    user.admin? || user == movie.user
  end
  alias_method :edit?, :update?
end