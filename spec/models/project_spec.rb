require "rails_helper"

describe 'Project' do
  let(:project) do
    create(:project)
  end

  describe 'validations' do
    it 'is valid' do
      expect(project).to be_valid
    end

    it 'is not valid without a name' do
      project.name = nil
      expect(project).not_to be_valid
    end
    context 'when the name is longer than 30 chars' do
      it 'is not valid' do
        project.name = 'This is a really really really looooong name to check if it fails'
        expect(project).not_to be_valid
      end
    end
    context 'when the name is already taken' do
      it 'is not valid' do
        Project.create(name: 'Project 1')
        project.name = 'Project 1'
        expect(project).not_to be_valid
      end
    end
    context 'when the name has special characters' do
      it 'is not valid' do
        project.name = 'My project!'
        expect(project).not_to be_valid
      end
    end
  end
end
