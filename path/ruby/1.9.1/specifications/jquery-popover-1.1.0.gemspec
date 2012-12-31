# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jquery-popover"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrei Misarca"]
  s.date = "2012-05-19"
  s.description = "Add popovers to your applications with only a few lines of code"
  s.email = ["andrei.misarca@gmail.com"]
  s.homepage = ""
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.11"
  s.summary = "jQuery popover"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jquery-rails>, [">= 2.0.0"])
    else
      s.add_dependency(%q<jquery-rails>, [">= 2.0.0"])
    end
  else
    s.add_dependency(%q<jquery-rails>, [">= 2.0.0"])
  end
end
