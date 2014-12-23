# -*- coding: utf-8 -*-
FactoryGirl.define do
  factory :input_string do
    parameters do
      ('a'..'z').to_a
                .sample(rand(0..9))
                .uniq
                .join
    end

    body do
      body = ''
      rand(1..9).times do
        type = [:letter, :letter, :letter, :subexpression].sample
        return body << ('a'..'z').to_a.sample if type == :letter
        body << "(#{ FactoryGirl.build(:expression).complete })"
      end
      body
    end

    arguments do
      args = ''
      rand(1..9).times do
        type = [:letter, :subexpression].sample
        return args << "(#{ ('a'..'z').to_a.sample })" if type == :letter
        args << "(#{ FactoryGirl.build(:expression).complete })"
      end
      args
    end

    complete do
      "#{ ['\\', 'λ'].sample }#{ parameters }.#{ body } #{ arguments }"
    end
  end

  factory :expression do
    parameters ('a'..'z').to_a.sample(rand(1..9))

    body do
      body = []
      rand(1..9).times do
       type = [:letter, :letter, :letter, :subexpression].sample
        return body << ('a'..'z').to_a.sample if type == :letter
        body << FactoryGirl.build :expression
      end
     body
    end

    arguments do
      args = []
      rand(1..9).times do
       type = [:letter, :subexpression].sample
        return args << ('a'..'z').to_a.sample if type == :letter
        args << FactoryGirl.build :expression
      end
      args
    end
  end
end
