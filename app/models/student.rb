class Student
    attr_reader :first_name
    
    @@all = []

    def self.all
        @@all
    end
    
    def initialize(first_name)
        @first_name = first_name

        self.class.all << self
    end

    def add_boating_test(test_name, status, instructor)
        BoatingTest.new(self, test_name, status, instructor)
    end

    def tests
        BoatingTest.all.select {|test| test.student == self }
    end

    def all_instructurs
        tests.map(&:instructor).uniq
    end

    def self.find_student(first_name)
        all.find{|student| student.first_name == first_name }
    end

    def grade_percentage
        (tests.map(&:status).count("passed") / tests.count.to_f) * 100
    end
end
