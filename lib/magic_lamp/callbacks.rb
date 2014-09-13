module MagicLamp
  module Callbacks
    def execute_before_each_callback
      execute_callback(:before)
    end

    def execute_after_each_callback
      execute_callback(:after)
    end

    private

    def execute_callback(type)
      callback = MagicLamp.configuration.send("#{type}_each_proc")
      callback.call unless callback.nil?
    end
  end
end