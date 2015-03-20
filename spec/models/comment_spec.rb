require 'rails_helper'

describe Lesson do
  it { should validate_presence_of :description }
  it { should belong_to :post }
end
