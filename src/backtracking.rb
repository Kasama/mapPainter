class Backtracking

  def initialize(restriction, domain, vars)
    @restriction = restriction
    @domain = domain
    @vars = vars
  end

  def check_restriction(a, b)
    @restriction[a].include?(b)
  end

  def backtracking

  end

end
