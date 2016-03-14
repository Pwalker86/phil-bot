class Insult
  attr_reader :response
  def initialize
    @response = Blanket.wrap("http://quandyfactory.com/insult/json").get
  end

  def insult
    @response.insult
  end

  def get_new_insult
    initialize
  end
end
