class BoatingTest
    attr_reader :student, :test_name
    attr_accessor :status, :instructor

    @@all = []

    def self.all
        @@all
    end

    def initialize(student, test_name, status, instructor)
        @student = student
        @test_name = test_name
        @status = status
        @instructor = instructor

        self.class.all << self
    end

    def self.find_test(student, test_name)
        all.find {|boating_test| (boating_test.test_name == test_name && boating_test.student == student) }
    end
end
