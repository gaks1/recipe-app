require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'raihan', email: 'a@gmail.com', password: '123456', confirmed_at: Time.now) }
  before { subject.save }

  it 'should have a correct name' do
    expect(subject.name).to eq('raihan')
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a correct email' do
    expect(subject.email).to eq('a@gmail.com')
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
