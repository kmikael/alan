module Alan
  class FSM
    def self.define(&block)
      word = ARGV.first
      unless word
        puts 'Error: You must enter a word to process'
        exit 1
      end
      
      fsm = new
      fsm.instance_eval &block
      fsm.run(word)
    end
    
    def initialize
      @states = {}
    end
    
    def next_symbol
      @symbols.shift
    end
    
    def start(s)
      @initial_state = s
    end
    
    def state(s, &block)
      @states[s] = block
    end
    
    def goto(s)
      @states[s].call(next_symbol)
      reject
    end
    
    def run(symbols)
      @symbols = symbols.chars.to_a
      goto @initial_state
    end
    
    def accept
      puts 'ACCEPTED'
      exit 0
    end
      
    def reject
      puts 'REJECTED'
      exit 0
    end
  end
end
