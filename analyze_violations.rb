require 'bundler/setup'
require 'query_packwerk'

puts "=== PACKWERK VIOLATION ANALYSIS ==="
puts

violations = QueryPackwerk::Violations.all
total = violations.count
puts "Total violations: #{total}"
puts

if total == 0
  puts "No violations found!"
  exit
end

# Violations by type
privacy_violations = violations.select { |v| v.type == "privacy" }
dependency_violations = violations.select { |v| v.type == "dependency" }
puts "By type:"
puts "  Privacy violations: #{privacy_violations.count}"
puts "  Dependency violations: #{dependency_violations.count}"
puts

# Top consuming packs
puts "Top consuming packs (who has the most violations):"
consuming_counts = Hash.new(0)
violations.each { |v| consuming_counts[v.consuming_pack.name] += 1 }
consuming_counts.sort_by { |_, count| -count }.first(10).each do |pack, count|
  puts "  #{pack}: #{count} violations"
end
puts

# Top producing packs
puts "Top producing packs (who is being accessed the most):"
producing_counts = Hash.new(0)
violations.each { |v| producing_counts[v.producing_pack.name] += 1 }
producing_counts.sort_by { |_, count| -count }.first(10).each do |pack, count|
  puts "  #{pack}: #{count} violations"
end
puts

# Most commonly violated classes
puts "Most commonly violated classes:"
class_counts = Hash.new(0)
violations.each { |v| class_counts[v.class_name] += v.files.count }
class_counts.sort_by { |_, count| -count }.first(15).each do |class_name, count|
  puts "  #{class_name}: #{count} references"
end
puts

# Packs with violations
puts "Packs with outgoing violations:"
QueryPackwerk::Packages.all.each do |pack|
  todos = pack.todos.to_a
  next if todos.count == 0
  puts "  #{pack.name}: #{todos.count} violations"
end
puts

# Check for circular dependencies
puts "Checking for circular dependencies..."
circular = []
QueryPackwerk::Packages.all.each do |pack|
  pack.todos.each do |violation|
    producing_pack = violation.producing_pack
    # Check if producing pack also has violations back to this pack
    if producing_pack.todos.any? { |v| v.producing_pack.name == pack.name }
      pair = [pack.name, producing_pack.name].sort
      circular << pair unless circular.include?(pair)
    end
  end
end

if circular.any?
  puts "Found circular dependencies:"
  circular.each do |pack1, pack2|
    puts "  #{pack1} <-> #{pack2}"
  end
else
  puts "No circular dependencies found!"
end

