require "gga4r"

class Population < Array

  OPTIMAL_VALUE = 50

  def fitness
    val = self.inject(:+).to_f/ OPTIMAL_VALUE
    if val > 1
      val = 0
    end
    #puts val
    val
  end

  def recombine(c2)
    cross_point = (rand * c2.size).to_i
    c1_a, c1_b = self.separate(cross_point)
    c2_a, c2_b = c2.separate(cross_point)
    Population.new(c1_a + c2_b)
  end

  def mutate
    mutate_point = (rand * self.size).to_i
    self[mutate_point] = 1
  end

  def separate(position)
    return self[0..position], self[position+1..-1]
  end
end
