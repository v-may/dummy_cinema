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
    msg = message.is_a?(Symbol) ? I18n.t(message) : message
    self.errors << msg
  end
end