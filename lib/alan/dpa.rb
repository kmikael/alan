module Alan
  class DPA < FSM
    def initialize
      super
      @stack = []
    end
    
    def push(s)
      @stack.push s
    end
    
    def pop
      @stack.pop
    end
  end
end
