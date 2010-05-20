require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
describe "Support module" do
  it "must align strings to tab stops" do
    support = Object.new.extend(AwesomePrint::Support)
    to_format = <<-EOS
\t\tk\t=\tv\tending1
\t\tkey\t=\tvalue\tending2
\t\treally_long_key\t=\treally_long_value
EOS
    expected_result = <<-EOS.rstrip
              k = v                 ending1
            key = value             ending2
really_long_key = really_long_value
EOS
    support.align(to_format).should == expected_result
  end
end
