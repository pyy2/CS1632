require 'minitest/autorun'

# Separated checking args to another class so source
# program doesn't start when running MiniTest
class VerifyArgs
  def verify_args(args)
    args.count == 2 && args[0] = Integer(args[0]) && args[1].to_i > 0 && args[1] = Integer(args[1])
  rescue StandardError
    false
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> separated arguments to another class
