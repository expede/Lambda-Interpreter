# -*- coding: utf-8 -*-

FactoryGirl.define do
  factory(:input_string) do
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

  factory(Model::Expression) do
    skip_create
    initialize_with { new(raw_string: '') }

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

    trait(:no_subexpressions) do
      body do
        body = []
        rand(1..9).times { body << ('a'..'z').to_a.sample }
        body
      end

      arguments do
        args = []
        rand(1..9).times { args << ('a'..'z').to_a.sample }
        args
      end
    end
  end
end
