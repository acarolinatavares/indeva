module GoalHelper
  def get_name(goal)
    goal.name.nil? ? "Meta #{goal.reference_month.strftime('%m/%Y')}" : goal.name
  end
end
