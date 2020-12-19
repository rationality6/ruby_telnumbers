module TelnosHelper

  def user_list
    User.order(name: :asc).pluck(:name)
  end
end
