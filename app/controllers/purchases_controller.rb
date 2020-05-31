class PurchasesController < ApplicationController
  def create
    res = MakePurchase.call current_user.id, params[:content_id]
    if res.success?
      head :ok
    else
      render_error res.errors.join(' ')
    end
  end

  private

  def current_user
    User.find params[:user_id]
  end
end
