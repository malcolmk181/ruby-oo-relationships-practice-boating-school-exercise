class Instructor
    attr_accessor :name

    @@all = []

    def self.all
        @@all
    end

    def initialize(name)
        @name = name

        self.class.all << self
    end

    def tests
        BoatingTest.all.select {|bt| bt.instructor == self }
    end

    def all_students
        tests.map(&:student).uniq
    end

    def passed_students
        tests.select {|bt| bt.status == "passed"}.map(&:student).uniq
    end

    def update_test_status(student, test_name, status)
        t = BoatingTest.find_test(student, test_name)
        if !t.nil?
            t.status = status
            t.instructor = self
        else
            t = BoatingTest.new(student, test_name, status, self)
        end
        t
    end

    def pass_student(student, test_name)
        update_test_status(student, test_name, "passed")
    end

    def fail_student(student, test_name)
        update_test_status(student, test_name, "failed")
    end
end
