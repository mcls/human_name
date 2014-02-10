require 'spec_helper'

describe HumanName::Methods do
  subject { @nameable.new }

  before(:each) do
    @nameable = Class.new do
      attr_accessor :first_name, :last_name
      include HumanName::Methods.new(:first_name, :last_name)
    end
  end

  describe '#human_name' do
    it { should respond_to(:human_name) }
    its(:human_name) { should be_a(HumanName) }

    it "creates a new HumanName using the methods passed into initialize" do
      nameable = Class.new do
        def fname; 'FirstName' end
        def lname; 'LastName' end
        include HumanName::Methods.new(:fname, :lname)
      end

      hn = nameable.new.human_name
      expect(hn.first_name).to eq('FirstName')
      expect(hn.last_name).to eq('LastName')
    end

    it "uses #first_name and #last_name methods by default" do
      nameable = Class.new do
        include HumanName::Methods.new
        private
        def first_name; 'FirstName' end
        def last_name;  'LastName'  end
      end
      expect(nameable.new.human_name.full_name).to eq('FirstName LastName')
    end
  end

  describe '#full_name' do
    it "delegates to #human_name" do
      expect_any_instance_of(HumanName).to receive(:full_name)
      subject.full_name
    end
  end

  describe '#name_initials' do
    it "delegates to #human_name" do
      expect_any_instance_of(HumanName).to receive(:name_initials)
      subject.name_initials
    end
  end
end
