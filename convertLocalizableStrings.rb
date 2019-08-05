require "pp"
dictionary = Hash.new { |h,k| h[k] = {} }

stringFiles = File.join("**", "*.strings")
pp stringFiles
pp Dir.glob(stringFiles)
Dir.glob(stringFiles).each do |filename|
    dirname = File.dirname(filename)
    lang = File.basename(dirname, ".lproj")
    pp lang
    File.open(filename) do |file|
        file.each do |line|
            line.chomp!
            puts line
            key_value = line.split(" = ")
            next unless key_value.count == 2
            regexp = /^"|";$/
            puts key = key_value[0].gsub(regexp, "")

            puts value = key_value[1].gsub(regexp, "")
            dictionary[key][lang] = value
        end
    end
end
pp dictionary

puts "key,ja,en"
dictionary.each do |key, item| 
    puts "#{key},#{item["ja"]},#{item["Base"]}"
end