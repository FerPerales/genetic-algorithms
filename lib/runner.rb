require "gga4r"
require_relative './population.rb'

MAX = 9

def create_population_with_that_sums_optimal_number(s_long = ARGV[0], num = ARGV[1])
    population = []
    num.to_i.times  do
      chromosome = Population.new(Array.new(s_long.to_i).collect { rand(MAX) })
      puts "Creating chromosome #{chromosome}"
      population << chromosome
    end
    population
end

ga = GeneticAlgorithm.new(create_population_with_that_sums_optimal_number)

ARGV[2].to_i.times { |i|  ga.evolve }
puts "Best fit: #{ga.best_fit}, sum: #{ga.best_fit.inject(:+)}"
puts "Target: #{Population::OPTIMAL_VALUE}"
