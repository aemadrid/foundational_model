require 'spec_helper'

describe Foundational::Model do

  before do
    module Examples
      class Person
        include Foundational::Model

        attribute :name, String
        attribute :age, Integer
        attribute :doctor, Boolean
        attribute :salary, Decimal
      end

      class Manager < Person
      end
    end
  end

  # Stolen from https://github.com/solnic/virtus/blob/master/spec/integration/defining_attributes_spec.rb

  describe 'virtus attribute definitions' do
    subject { Examples::Person.new }

    specify 'accessor methods' do
      subject.name = 'Peter'
      subject.name.should == 'Peter'
    end

    specify 'mass-assignment' do
      john = Examples::Person.new :name => 'John', :age => 13
      john.name.should == 'John'
      john.age.should == 13
    end

    specify 'booleans ? methods' do
      subject.doctor?.should be_false
      subject.doctor = true
      subject.doctor?.should be_true
    end

    context 'with attributes' do
      let(:attributes) { { :name => 'Jane', :age => 45, :doctor => true, :salary => 4500 } }
      subject { Examples::Person.new(attributes) }

      specify '#attributes returns the object\'s attributes as a hash' do
        subject.attributes.should == attributes
      end

      specify '#to_hash returns the object\'s attributes as a hash' do
        subject.to_hash.should == attributes
      end
    end

    context 'inheritance' do
      specify 'inherits all the attributes from the base class' do
        fred = Examples::Manager.new :name => 'Fred', :age => 29
        fred.name.should == 'Fred'
        fred.age.should == 29
      end
    end
  end

end