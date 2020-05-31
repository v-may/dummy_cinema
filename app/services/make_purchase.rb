class MakePurchase < BaseService
  def call(user_id, content_id)
    user = User.find_by_id user_id
    error(:user_not_found) and return self unless user
    error(:content_already_bought) and return self if user.purchases.active.where(content_id: content_id).exists?
    purchase = user.purchases.create content_id: content_id
    if purchase.errors.none?
      @data = purchase
    else
      purchase.errors.full_messages.each { |msg| error msg }
    end
    self
  end
end