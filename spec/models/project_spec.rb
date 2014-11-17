require "rails_helper"

describe 'Project' do
  let(:project) do
    create(:project)
  end

  describe 'validations' do
    it 'is valid' do
      expect(project).to be_valid
    end

    it 'is not valid without a name'
    context 'when the name is longer than 30 chars' do
      it 'is not valid'
    end
    context 'when the name is already taken' do
      it 'is not valid'
    end
    context 'when the name has special characters' do
      it 'is not valid'
    end
  end
end
