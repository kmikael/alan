# Alan

Alan is a simple DSL for creating and running different automations. Currently a finite state machine and a deterministic pushdown automata is available. A program in the fsm or the dpa language is also a ruby program and can be run from the command-line, supply the word to process as a command-line argument.

## Installation

    $ gem install alan

## Usage

### Example 1: A fsm

```ruby
# example1.rb
require 'alan'

# Accept a*ba+
Alan::FSM.define do
  start :s
  
  state :s do |x|
    if x == 'a'
      goto :s
    elsif x == 'b'
      goto :p
    end
  end
  
  state :p do |x|
    if x == 'a'
      goto :q
    end
  end
      
  state :q do |x|
    if x == 'a'
      goto :q
    elsif x == nil
      accept
    end
  end
end
```

Example run: `ruby example1.rb aaaaba`

### Example 2: A dpa

```ruby
# example2.rb
require 'alan'
    
# Accept 0^n 1^n
Alan::DPA.define do
  start :s
  
  state :s do |x|
    if x == '0'
      push 'Z'
      goto :s
    elsif x == '1'
      y = pop
      if y == 'Z'
        goto :q
      end
    end
  end
  
  state :q do |x|
    y = pop
    if x == '1' && y == 'Z'
      goto :q
    elsif x == nil && y == nil
      accept
    end
  end
end
```

Example run: `ruby example2.rb 00001111`
