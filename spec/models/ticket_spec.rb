require 'spec_helper'

describe Ticket do
  
  context "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should ensure_length_of(:description).is_at_least(10) }
  end
end
