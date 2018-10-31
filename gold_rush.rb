require_relative 'mine.rb'
require_relative 'seed_rand.rb'
require_relative 'verify_args.rb'

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

# EXECUTION STARTS HERE

# Verify that the arguments are valid
args = VerifyArgs.new
valid_args = args.verify_args ARGV

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
