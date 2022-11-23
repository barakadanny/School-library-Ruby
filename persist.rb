require 'json'

class Persist
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def save(data)
    arr = JSON.pretty_generate(data)
    File.write(file_path, arr.to_s)
  end

  def load
    return [] unless File.exist?(@file_path)

    file = File.read(@file_path)
    JSON.parse(file)
  end
end

load = Persist.new('student.json')
puts load.load
