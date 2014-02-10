require 'spec_helper'

describe HumanName do
  subject { described_class.new(first_name, last_name) }
  let(:first_name)  { '' }
  let(:last_name)   { '' }

  describe '#full_name' do
    [
      'Ron',  'Burgundy',   'Ron Burgundy',
      ' Ron', 'Swanson ',   'Ron Swanson',

      '', 'MacGyver', 'MacGyver',
      'MacGruber', nil, 'MacGruber',

      '',   '',   '',
      nil,  nil,  '',
    ].each_slice(3) do |a|
      context "when first_name is '#{a[0]}' and last_name is '#{a[1]}'" do
        subject { described_class.new(a[0], a[1]) }
        its(:full_name) { should eq(a[2]) }
      end
    end
  end

  name_expectations = [
    'Harrison',    'Harrison',
    ' Harrison ',  'Harrison',
    '   ',        '',
    nil,          '',
  ]
  %w(first_name last_name).each do |attr|
    describe "##{attr}" do
      name_expectations.each_slice(2) do |a|
        context "when #{attr} is '#{a[0]}'" do
          let(attr.to_sym) { a[0] }
          its(attr.to_sym) { should eq(a[1]) }
        end
      end
    end
  end

  describe '#name_initials' do
    [
      'Ron',  'Burgundy',   'R. B.',
      ' Ron', 'Swanson ',   'R. S.',

      '', 'MacGyver',   'M.',
      'MacGruber', nil, 'M.',

      '',   '',   '',
      nil,  nil,  '',
    ].each_slice(3) do |a|
      context "when first_name is '#{a[0]}' and last_name is '#{a[1]}'" do
        subject { described_class.new(a[0], a[1]) }
        its(:name_initials) { should eq(a[2]) }
      end
    end
  end
end
