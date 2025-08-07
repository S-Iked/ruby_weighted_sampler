# frozen_string_literal: true

RSpec.describe WeightedSampler do
  it "has a version number" do
    expect(WeightedSampler::VERSION).not_to be nil
  end

  it "test case 1" do
    ws = WeightedSampler.new({"a": 9, "b": 1})
    ret = {"a": 0, "b": 0}
    100.times.each do |n|
      _r = ws.get
      ret[_r] += 1
    end
    expect(ret[:a] > ret[:b]).to eq true
    ret.each do |k, v|
      expect(v).to be >= 1
    end
  end

  it "test case 2" do
    ws = WeightedSampler.new({"a": 1, "b": 9})
    ret = {"a": 0, "b": 0}
    100.times.each do |n|
      _r = ws.get
      ret[_r] += 1
    end
    expect(ret[:a] < ret[:b]).to eq true
    ret.each do |k, v|
      expect(v).to be >= 1
    end
  end

  it "test case 3" do
    ws = WeightedSampler.new({"a": 1, "b": 9, "c": 3})
    ret = {"a": 0, "b": 0, "c": 0}
    100.times.each do |n|
      _r = ws.get
      ret[_r] += 1
    end
    expect(ret[:a] < ret[:b] && ret[:c] < ret[:b]).to eq true
    ret.each do |k, v|
      expect(v).to be >= 1
    end
  end
end
