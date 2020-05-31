class BaseService
  include Callable

  attr_reader :data, :errors

  def initialize
    @errors = []
  end

  def success?
    errors.none?
  end

  private

  def error(message)
    self.errors << I18n.t(message)
  end
end