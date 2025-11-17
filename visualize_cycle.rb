require 'yaml'

cycle = [
  'packs/domain_blocking',
  'packs/relationships', 
  'packs/federation',
  'packs/interactions',
  'packs/trends',
  'packs/timelines',
  'packs/conversations',
  'packs/polls',
  'packs/moderation',
  'packs/domain_blocking'
]

puts "=== CIRCULAR DEPENDENCY CHAIN ==="
puts

cycle.each_cons(2) do |from, to|
  config = YAML.load_file("#{from}/package.yml")
  deps = config['dependencies'] || []
  
  if deps.include?(to)
    puts "#{from}"
    puts "  ↓ depends on"
    puts "#{to}"
    puts
  end
end

puts "=== BREAKING THE CYCLE ==="
puts
puts "The cycle exists because:"
puts "1. domain_blocking needs relationships (for blocking followers)"
puts "2. relationships needs federation (for ActivityPub follow/unfollow)"
puts "3. federation needs interactions (for ActivityPub like/boost)"
puts "4. interactions needs trends (for trending content)"
puts "5. trends needs timelines (for feed analysis)"
puts "6. timelines needs conversations (for DM timelines)"
puts "7. conversations needs polls (for poll conversations)"
puts "8. polls needs moderation (for poll moderation)"
puts "9. moderation needs domain_blocking (for blocking domains)"
puts
puts "Solution: Extract ActivityPub protocol layer to break federation dependencies"

