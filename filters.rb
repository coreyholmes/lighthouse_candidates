# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
LINE = "-" * 50

def find
  puts "Enter Candidate ID: ".white.on_red
  input = gets.chomp.to_i
  puts LINE
  pp @candidates.find { |i| i[:id] == input }
  puts LINE
  return options
end


def options
  # puts LINE
  puts "\n[1]Find [2]View Qualified [3]List All [4]Quit".white.on_red
  # puts LINE
  input = gets.chomp
  case input
  when "1"
    return find
  when "2"
    return qualified_candidates
  when "3"
    return list
  when "4"
    return 
  else
    return options
  end
end

def experienced?(candidate)
 if candidate[:years_of_experience] >= 2
   return true
 else
   return false
 end
end

def github?(candidate)
 if candidate[:github_points] >= 100
   return true
 else
   return false
 end
end

def languages?(candidate)
 candidate[:languages].each do |i| 
    if i == "Ruby" || i == "Python" 
    return true
    end
  end
    return false
end

def date_applied?(candidate)
 if candidate[:date_applied] >= 15.day.ago.to_date
    return true
 else
    return false
 end
end

def age?(candidate)
 if candidate[:age] >= 18
    return true
 else
    return false
 end
end

def qualified(i)
  github?(i) == true && experienced?(i) && age?(i) == true && date_applied?(i) == true && languages?(i) == true 
end

def list
 @candidates.each do |i|
    if qualified(i)
      puts " Qualified [✓] ".black.on_green
      pp i
      puts LINE
    else
      puts " Not Qualified [✗] ".white.on_red
      pp i
      puts LINE
    end
  end
  return options
end

def qualified_candidates
  @candidates.each do |i|
    if qualified(i)
      puts " Qualified [✓] ".black.on_green
      pp i
      puts LINE
    end
  end
  return options
end
