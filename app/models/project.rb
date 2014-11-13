class Project < ActiveRecord::Base
  has_many :entries

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: {maximum: 30}
  validates :name, format:{with: /\A[\w\s*]+\Z/}

  def self.last_created_projects(number)
    order(created_at: :desc).limit(number)
  end

  def total_hours
    hours = 0
    minutes = 0
    entries.each do | entry|
      hours += entry.hours
      minutes += entry.minutes
    end
    hours + (minutes / 60)
  end

  # def hours_jofre
  #   entries.inject(0) do |hours, entry|
  #     hours + entry.hours + entry.minutes / 60.0
  #   end.to_i
  # end
end
