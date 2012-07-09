module ApplicationHelper

def new_row?( num )
  ((num + 1) % 3) == 1
end

def finish_row?( num )
  ((num +1) % 3) == 0
end

end
