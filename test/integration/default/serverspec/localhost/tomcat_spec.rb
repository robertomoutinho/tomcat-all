require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

describe "Tomcat Daemon" do
  it "is listening on port 8080" do
    expect(port(8080)).to be_listening
  end
  it "has a running service of tomcat" do
    expect(service("tomcat")).to be_running
  end
end

describe group("tomcat") do
  it { should exist }
end

describe user("tomcat") do
  it { should exist }
  it { should belong_to_group "tomcat" }
end

describe file("/opt/tomcat") do
  it { should be_directory }
end

describe file("/opt/tomcat/bin/catalina.sh") do
  it { should be_owned_by "tomcat" }
  it { should be_executable.by_user("tomcat") }
  it { should be_writable.by_user("tomcat") }
  it { should be_readable.by_user("tomcat") }
end

describe file("/opt/tomcat/conf/server.xml") do
  it { should be_owned_by "tomcat" }
  it { should be_writable.by_user("tomcat") }
  it { should be_readable.by_user("tomcat") }
end
