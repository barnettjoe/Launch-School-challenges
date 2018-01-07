class Garden
  PLANTS = {"R"=>:radishes, "G"=>:grass, "C"=>:clover, "V"=>:violets}

  DEFAULT_STUDENTS = %w[alice
                        bob
                        charlie
                        david
                        eve
                        fred
                        ginny
                        harriet
                        ileana
                        joseph
                        kincaid
                        larry]

  def initialize(str, students = nil)
    @row1, @row2 = str.split.map { |row| row.chars.map { |let| PLANTS[let] } }
    @students = (students ? students.sort.map(&:downcase) : DEFAULT_STUDENTS)
    define_student_methods
  end

  def define_student_methods
    @students.each_with_index do |student, idx|
      define_singleton_method student do
        @row1[idx * 2, 2] + @row2[idx * 2, 2]
      end
    end
  end
end

