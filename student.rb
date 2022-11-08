require_relative 'Person'

class Student < Person

    def inititalize(age, classroom, name: 'unkown', parent_permission: true)
        @classroom = classroom
    end

    def play_hooky
        "¯\(ツ)/¯"
    end
end
