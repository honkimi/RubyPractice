class Seed

  def self.getSeed
    ret = []
    File.open('./data/seed.txt') do |f|
      f.each_line do |line|
        ret << line.split(',').map do |v|
          v.to_i unless v == "" || v == "\n"
        end
      end
    end
    ret
  end
end
