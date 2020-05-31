module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def render_error(error_message, status = :unprocessable_entity)
    render json: {error: error_message}, status: status
  end

  def collection_links(collection)
    {
      self: request.original_url,
      next: pagination_url(collection.next_page),
      prev: pagination_url(collection.prev_page),
      last: pagination_url(collection.total_pages),
      first: pagination_url(1)
    }
  end

  def pagination_url(page)
    url_for(collection_permitted_params.merge(page: page)) if page
  end

  def collection_permitted_params
    params.permit(:page, :per_page)
  end
end