require_relative 'mine.rb'
require_relative 'seed_rand.rb'

# Unpack command line arguments
seed, prospectors = ARGV

# Print the usage message to STDOUT and then exit the program
# with exit code 1
def show_usage_and_exit
  puts 'Usage:'
  puts 'ruby gold_rush.rb *seed* *number of prospectors*'
  puts '*seed* should be an integer'
  puts '*number of prospectors* should be a nonnegative integer'
  exit 1
end

# Returns true if and only if:
# 1. There is two and only two argument
# 2. That argument 1 can be converted to an integer
# 3. That argument 2, when converted to an integer, is nonnegative
# Returns false otherwise
# If any errors occur (e.g. args is nil), returns false with exit 1
def check_args(args)
  args.count == 2 && args[0] = Integer(args[0]) && args[1].to_i > 0 && args[1] = Integer(args[1])
rescue StandardError
  false
end

# EXECUTION STARTS HERE

# Verify that the arguments are valid
valid_args = check_args ARGV

# If arguments are valid, create a loop of new simulation for each prospector
# Otherwise, show proper usage message and exit program
if valid_args
  Seed.new seed.to_i
  (1..prospectors.to_i).each do |i|
    m = Mine.new i
    m.start
    m.show_results
    puts
  end
else
  show_usage_and_exit
end
