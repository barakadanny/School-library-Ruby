require 'json'

class Persist
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def save(data)
    myArr = JSON.pretty_generate(data)
    File.write(file_path, myArr.to_s)
  end

  def load
    return [] unless File.exist?(@path)

    file = File.read(@path)
    JSON.parse(file)
  end
end

load = Persist.new('student.json')
puts load.load