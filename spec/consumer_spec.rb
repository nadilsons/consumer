require 'spec_helper'

describe Consumer do

  let(:url) { "http://mock.url/feed_test"                            }
  before    { register_uri(:get, url, body: fixture("example.json")) }
  subject   { described_class.get(url)                               }

  its(:id)         { should == "0ffe01" }
  its(:first_item) { should == "item 1" }
  its(:second)     { should == "item 2" }
  its(:third)      { should == 3        }
  its(:fourthly)   { should be_nil      }

  it { expect(subject.respond_to?(:id)).to be_truthy         }
  it { expect(subject.respond_to?(:first_item)).to be_truthy }
  it { expect(subject.respond_to?(:second)).to be_truthy     }
  it { expect(subject.respond_to?(:third)).to be_truthy      }
  it { expect(subject.respond_to?(:fourthly)).to be_truthy   }

  it { expect(subject.array).to be_a Array            }
  it { expect(subject.array.size).to eq(2)            }
  it { expect(subject.array[0].item1).to eq("test 1") }
  it { expect(subject.array[0].item2).to eq("test 2") }
  it { expect(subject.array[1].item3).to eq("test 3") }
  it { expect(subject.array[1].item4).to eq("test 4") }

  it { expect(subject.array[0].respond_to?(:item1)).to be_truthy }
  it { expect(subject.array[0].respond_to?(:item2)).to be_truthy }
  it { expect(subject.array[1].respond_to?(:item3)).to be_truthy }
  it { expect(subject.array[1].respond_to?(:item4)).to be_truthy }

  it { expect(subject.child_hash.hash1).to eq("value 1")                        }
  it { expect(subject.child_hash.hash2).to eq("value 2")                        }
  it { expect(subject.child_hash.keys).to eq(["hash1", "hash2", "array1"])      }
  it { expect(subject.child_hash.values).to eq(["value 1", "value 2", [1,2,3]]) }
  it { expect(subject.child_hash.array1).to eq([1,2,3])                         }

  it { expect(subject.respond_to?(:child_hash)).to be_truthy        }
  it { expect(subject.child_hash.respond_to?(:hash1)).to be_truthy  }
  it { expect(subject.child_hash.respond_to?(:hash2)).to be_truthy  }
  it { expect(subject.child_hash.respond_to?(:array1)).to be_truthy }

  it { expect{ subject.fifth      }.to raise_error(NoMethodError) }
  it { expect{ subject.first = 11 }.to raise_error(NoMethodError) }

  it { expect(subject.respond_to?(:fifth)).to be_falsey }
  it { expect(subject.respond_to?(:class)).to be_truthy }

  it { expect(subject).to eq(hash) }
end
