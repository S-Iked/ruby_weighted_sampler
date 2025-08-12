# frozen_string_literal: true

class WeightedSampler
  VERSION = "0.0.1"
  class Error < StandardError; end

  def initialize(elements, seed: nil)
    @total_weight = 0
    @elements_keys = elements.keys
    @weight_pos = []
    @elements = elements
    @seed = seed

    @rand = if @seed.nil?
      Random.new
    else
      Random.new(@seed.to_i)
    end

    elements.each do |k, w|
      raise WeightedSampler::Error, "weight must be a numeric value: #{k}: #{w}" if !w.is_a?(Numeric)
      @total_weight += w
      @weight_pos << @total_weight
    end
  end

  def get(seed: nil)
    r = @rand.rand(@total_weight)
    i = @weight_pos.bsearch_index { |x| x > r }
    @elements_keys[i]
  end
end
