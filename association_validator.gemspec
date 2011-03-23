# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{association_validator}
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mohammad El-Abid"]
  s.date = %q{2011-03-23}
  s.description = %q{Rails 3 assocation validation for id fields}
  s.email = %q{mohammad {dot} elabid {at} gmail}
  s.extra_rdoc_files = ["lib/association_validator.rb"]
  s.files = ["Manifest", "Rakefile", "association_validator.gemspec", "lib/association_validator.rb"]
  s.homepage = %q{http://github.com/TheEmpty}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Association_validator"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{association_validator}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Rails 3 assocation validation for id fields}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<ActiveModel>, [">= 3.0.0"])
    else
      s.add_dependency(%q<ActiveModel>, [">= 3.0.0"])
    end
  else
    s.add_dependency(%q<ActiveModel>, [">= 3.0.0"])
  end
end
