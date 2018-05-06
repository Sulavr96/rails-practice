class Employee<ApplicationRecord
  validates :first_name ,:last_name ,presence: true

  def update_phone_number ph_number
    self.update(phone_number=ph_number)
  end
  def self.sorting_employees
    order(first_name: :asc)

  end
  def display_full_name
    "#{first_name} #{middle_name} #{last_name}"
  end
  def self.calculate_salary
    average_salary=average(:salary).to_f
    minimum_salary=minimum(:salary)
    maximim_salary=maximum(:salary)
    salary_array=[]
    salary_array.push average_salary
    salary_array.push minimum_salary
    salary_array.push maximim_salary
  end
  def self.delete_employees
    delete_all

  end
  end
