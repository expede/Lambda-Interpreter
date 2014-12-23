require_relative '../spec_helper'

describe Model::VariableSpace do
  describe '::global' do
    describe 'returns all used letters of the root expression' do
      context 'no root Model::Expression exists' do
        it 'returns an expty set' do
          allow(Model::Expression).to receive(:root).and_return(nil)
          expect(Model::VariableSpace.global).to eq Set.new
        end
      end

      context 'existent root Model::Expression' do
        it 'lists all used variables' do
          exp = FactoryGirl.build(Model::Expression, :no_subexpressions)
          allow(Model::Expression).to receive(:root).and_return(exp)
          allow(exp).to receive(:to_s).and_return('λ.' << exp.parameters.join)

          expect(Model::VariableSpace.global).to eq Set.new(exp.parameters)
        end
      end
    end
  end

  describe '::safe_random' do
    context 'space remaining' do
      before do
        allow(Model::VariableSpace).to receive(:global).and_return(Set.new(('a'..'p')))
      end

      it 'returns a set of safe to non-colliding variables' do
        expected = Set.new(('q'..'z'))
        expect(Model::VariableSpace.safe_random(results: 10)).to eq expected
      end

      it 'does not throw errors' do
        expect { Model::VariableSpace.safe_random(results: rand(1..10)) }.to_not raise_error
      end
    end

    context 'space full' do
      before do
        allow(Model::VariableSpace).to receive(:global).and_return(Set.new(('a'..'z')))
      end

      it 'throws an error' do
        expect { Model::VariableSpace.safe_random(results: 42) }.to raise_error
      end
    end
  end
end
