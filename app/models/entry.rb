class Entry < ActiveRecord::Base
  belongs_to :project
  validates :hours, :minutes, numericality: true, presence: true
  validates :date, presence: true
  validates :project_id, presence: true

  validate :project_exists

  private

  def project_exists
    unless Project.find_by(id: project_id)
      errors.add(:project_id, 'does not exist')
    end
  end
end
