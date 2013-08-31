module Voteable
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.extend ClassMethods
    base.class_eval do
      has_many_votes
    end
  end

  module InstanceMethods
    def total_votes
      self.votes.where(vote: true).size - self.votes.where(vote: false).size
    end
  end

  module ClassMethods
    def has_many_votes
        has_many :votes, as: :voteable
    end
  end
end