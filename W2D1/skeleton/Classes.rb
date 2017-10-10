class Employee
  attr_reader :boss

  def initialize(name, salary, title, boss = nil)
    @name = name
    @salary = salary
    @title = title
    @boss = boss
    @bonus = 0
    if boss
      boss.add_salary(@salary)
      if boss.boss
        boss.boss.add_salary(@salary)
      end
    end

  end

  def bonus(multiplier)
    @bonus = @salary * multiplier
  end

  def add_salary(salary)
    @bonus += salary
  end


end

class Manager < Employee

  def bonus(multiplier)
    @bonus *= multiplier
  end

end

ned = Manager.new("Ned", 1000000, "Founder")
darren = Manager.new("Darren", 78000, "TA Manager", ned)
shawna = Employee.new("Shawna", 12000, "TA", darren)
david = Employee.new("David", 10000, "TA", darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
