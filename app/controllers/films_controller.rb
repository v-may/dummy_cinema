class FilmsController < ApplicationController
  def index
    json_response FilmSerializer.new(scope, links: collection_links(scope)).serializable_hash
  end

  private

  def scope
    scope = Film.listed
    scope = scope.where(type: params[:type].titleize) if params[:type]
    scope = scope.order(:created_at).page(params[:page]).per(params[:per_page])
  end
end
