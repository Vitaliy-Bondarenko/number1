require 'spec_helper'

describe Task, :type => :model do

  subject { FactoryGirl.build(:task) }

  it { should be_valid }
  it { should ensure_length_of(:title).is_at_least(5) }
  it { should validate_presence_of :priority }
  it { should validate_numericality_of :priority }
  it { should validate_presence_of :due_date }
  
  context 'invalid due date' do
    let(:task) { FactoryGirl.build(:task, due_date: Date.today - 3 ) }
    let(:task2) { FactoryGirl.build(:task, due_date: ' ' ) }
    let(:task3) { FactoryGirl.build(:task, due_date: 'xcxc ' ) }
    it { expect(task).to be_invalid }
    it { expect(task).to have(1).error_on(:due_date) }
    it { expect(task2).to have(1).error_on(:due_date) }
    it { expect(task3.error_on(:due_date).size).to eq(1) }
  end
  

end
