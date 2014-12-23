# -*- coding: utf-8 -*-
# require_relative '../spec_helper'

FactoryGirl.define do
  factory :input_string do
    skip_create

    parameters do
      ('a'..'z').to_a
                .sample(rand(0..9))
                .uniq
                .join
    end

    body do
      body = ''
      rand(1..9).times do
        type = rand(0..20)
        body << ('a'..'z').to_a.sample and next unless type == 0
        body << "(#{ FactoryGirl.build(:input_string).complete })"
      end
      body
    end

    arguments do
      args = ''
      rand(1..9).times do
        type = rand(0..20)
        args << "(#{ ('a'..'z').to_a.sample })" and next unless type == 0
        args << "(#{ FactoryGirl.build(:input_string).complete })"
      end
      args
    end

    complete do
      "#{ ['\\', 'λ'].sample }#{ parameters }.#{ body } #{ arguments }"
    end
  end

  factory(:expression) do
    parameters do
      ('a'..'z').to_a
                .sample(rand(0..9))
                .uniq
    end

    body do
      body = []
      rand(1..9).times do
        type = rand(0..20)
        body << ('a'..'z').to_a.sample and next unless type == 0
        body << FactoryGirl.build(:expression)
      end
      body
    end

    arguments do
      args = []
      rand(1..9).times do
        type = rand(0..20)
        args << ('a'..'z').to_a.sample and next unless type == 0
        args << FactoryGirl.build(:expression)
      end
      args
    end

    initialize_with { new(raw_string: '') }
  end
end
