class Employee < ApplicationRecord
  validates :first_name, :last_name, presence: {message: "Please provide your first and last name"}
  validates :phone_number, length: {is: 10}, format: {with: /[9]\d{9}/, message: "Number must start with 9"}
  validates :salary, :numericality => {:greater_than_or_equal_to => 0}
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, uniqueness: true
  before_save :ensure_case_matches
  before_destroy :ask_before_delete

  def update_phone_number ph_number
    self.update(phone_number = ph_number)
  end

  def self.sorting_employees
    order(first_name: :asc)
  end

  def display_full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def self.calculate_salary
    average_salary = average(:salary).to_f
    minimum_salary = minimum(:salary)
    maximum_salary = maximum(:salary)
    salary_array = []
    salary_array.push average_salary
    salary_array.push minimum_salary
    salary_array.push maximum_salary
  end

  def self.delete_all_records
    delete_all
  end

  def ensure_case_matches
    self.first_name = first_name.capitalize
    self.middle_name = middle_name.capitalize
    self.last_name = last_name.capitalize
  end

  def ask_before_delete
    puts 'Do you want to delete the record(Y/N)?'
    answer = gets
unless answer=="n" || "N"
  puts "Record is not deleted"
end
  end
end

