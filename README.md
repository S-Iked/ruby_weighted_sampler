# Ruby Weighted Sampler

重み付きランダムライブラリ


## Usage

    require "weighted_sampler"
    
    ab_group = {"a": 1, "b": 9}
    ws = WeightedSampler.new(ab_group)

    # ab_groupのhash keyのいずれかが返る
    r = ws.get

    # 入力値(整数）を元に判定（同じ値を指定した場合の戻り値は変わらない)
    r = ws.get(1)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/S-Iked/ruby_weighted_sampler.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
