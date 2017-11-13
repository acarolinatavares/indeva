class Goal::Create
  attr_reader :instance

  def self.call(params)
    this = new
    this.call(params)
    this
  end

  def initialize
    @instance = Goal.new
  end

  def call(params)
    @instance.assign_attributes(params)
    @instance.reference_month = @instance.init_date
    create_goal_dates if @instance.save
  end

  private

  def create_goal_dates
    dates = (@instance.init_date..@instance.end_date).to_a
    dates.each do |date|
      GoalDate.create(goal_id: @instance.id, day: date)
    end
  end

end