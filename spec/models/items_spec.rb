require 'rails_helper'

describe Item do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should validate_presence_of :dish_type }
    it { should validate_presence_of :image }
    it { should validate_presence_of :restaurant }
  end
end
