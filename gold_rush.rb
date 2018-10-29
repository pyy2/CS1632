def show_usage_and_exit
    puts 'Usage:'
    puts 'ruby gold_rush.rb *seed* *number of prospectors*'
    puts '*seed* should be an integer'
    puts '*number of prospectors* should be nonnegative integers'
    exit 1
end

def check_args(args)
    args.count == 2 && args[0].to_i > 0 && args[0] = Integer(args[0]) && args[1].to_i && Integer(args[1])
rescue StandardError
    false
end

valid_args = check_args ARGV

if valid_args
    seed = ARGV[0].to_i
    prospectors = ARGV[1].to_i
    m = Main.new seed prospectors
    m.play
    m.show_results
  else
    show_usage_and_exit
end

