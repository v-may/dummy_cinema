class PurchasesController < ApplicationController
  def create
    res = MakePurchase.call current_user.id, params[:content_id]
    if res.success?
      head :ok
    else
      render_error res.errors.join(' ')
    end
  end

  def index
    json_response FilmSerializer.new(scope).serializable_hash
  end

  private

  def scope
    current_user.purchases.active.order(:created_at).map { |p| p.content.film }
  end

  def current_user
    User.find params[:user_id]
  end
end
