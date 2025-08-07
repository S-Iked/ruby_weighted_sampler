# frozen_string_literal: true

class WeightedSampler
  VERSION = '0.0.1'.freeze

  def initialize(elements)
    @total_weight = 0
    @elements_keys = elements.keys
    @weight_pos = []
    @elements = elements

    elements.each do |k , w|
      @total_weight += w
      @weight_pos << @total_weight
    end
  end

  def get()
    r = rand(@total_weight)
    i = @weight_pos.bsearch_index {|x| x >= r }
    @elements_keys[i]
  end
end
