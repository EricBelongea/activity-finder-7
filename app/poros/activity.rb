class Activity
  attr_reader :name, :type, :participants, :price, :accessibility

  def initialize(data)
    @name = data[:activity]
    @type = data[:type]
    @participants = data[:participants]
    @price = data[:price]
    @accessibility = data[:accessibility]
  end
end