# -*- coding: utf-8 -*-
require 'spec_helper'

describe Expression do
  describe '::root' do
    it 'has only one root Expression'
  end

  describe '::reduce!' do
    it 'reduces the root Expression'
    it 'fails when there is no root'
  end

  describe 'instance' do
    describe 'structure' do
      describe '#parameters' do
        it 'is an array'
        it 'contains no duplicate elements'
        it 'is composed only of letters a through z'
      end

      describe '#body' do
        it 'is an array'
        it 'may contain subexpressions'
      end

      describe '#arguments' do
        it 'is an array'
        it 'may contain subexpressions'
      end
    end

    describe '#root?' do
      it 'is true if this Expression is the root expression'
      it 'is false otherwise'
    end

    describe '#root!' do
      it 'promotes this instance to root'
    end

    describe '#<<' do
      it 'converts a string to an expression'
      it 'adds the expression as another argument'
      it 'is aliased to #add_argument!'
    end

    describe '#apply!' do
      it 'subsitutes the first argument for the first parameter in the body'
      it 'removes the first argument'
      it 'removes the first parameter'
    end

    describe '#reduce!' do
      it 'calls #apply until there are either no more arguments or parameters'
      it 'dropps the first argument and parameter'

      context '|params| <= |arguments|' do
        it 'reevaluates the new state'
        it 'rebinds self to the new expression'
      end
    end

    describe '#to_s' do
      describe 'parameter portion' do
        it 'prints a `λ` on the left'
        it 'prints `. ` on the right'
        it 'has no spaces'
      end

      describe 'body portion' do
        it 'calls #to_s on every element'
        it 'joins all elements into one string'
      end

      describe 'argument portion' do
        it 'prints a space on the left'
        it 'wraps each argument in parentheses'
      end
    end
  end
end
