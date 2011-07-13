# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{parslet}
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kaspar Schiess"]
  s.date = %q{2011-06-05}
  s.email = %q{kaspar.schiess@absurd.li}
  s.extra_rdoc_files = ["README"]
  s.files = ["Gemfile", "HISTORY.txt", "LICENSE", "Rakefile", "README", "lib/parslet/atoms/alternative.rb", "lib/parslet/atoms/base.rb", "lib/parslet/atoms/context.rb", "lib/parslet/atoms/dsl.rb", "lib/parslet/atoms/entity.rb", "lib/parslet/atoms/lookahead.rb", "lib/parslet/atoms/named.rb", "lib/parslet/atoms/re.rb", "lib/parslet/atoms/repetition.rb", "lib/parslet/atoms/sequence.rb", "lib/parslet/atoms/str.rb", "lib/parslet/atoms/transform.rb", "lib/parslet/atoms/visitor.rb", "lib/parslet/atoms.rb", "lib/parslet/convenience.rb", "lib/parslet/error_tree.rb", "lib/parslet/export.rb", "lib/parslet/expression/treetop.rb", "lib/parslet/expression.rb", "lib/parslet/parser.rb", "lib/parslet/pattern/binding.rb", "lib/parslet/pattern/context.rb", "lib/parslet/pattern.rb", "lib/parslet/rig/rspec.rb", "lib/parslet/slice.rb", "lib/parslet/source/line_cache.rb", "lib/parslet/source.rb", "lib/parslet/transform.rb", "lib/parslet.rb", "example/boolean_algebra.rb", "example/comments.rb", "example/documentation.rb", "example/email_parser.rb", "example/empty.rb", "example/erb.rb", "example/ip_address.rb", "example/json.rb", "example/local.rb", "example/minilisp.rb", "example/output/boolean_algebra.out", "example/output/comments.out", "example/output/documentation.err", "example/output/documentation.out", "example/output/email_parser.out", "example/output/empty.err", "example/output/erb.out", "example/output/ip_address.out", "example/output/json.out", "example/output/local.out", "example/output/minilisp.out", "example/output/parens.out", "example/output/readme.out", "example/output/seasons.out", "example/output/sentence.out", "example/output/simple_xml.out", "example/output/string_parser.out", "example/parens.rb", "example/readme.rb", "example/seasons.rb", "example/sentence.rb", "example/simple.lit", "example/simple_xml.rb", "example/string_parser.rb", "example/test.lit"]
  s.homepage = %q{http://kschiess.github.com/parslet}
  s.rdoc_options = ["--main", "README"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Parser construction library with great error reporting in Ruby.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<blankslate>, ["~> 2.0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<flexmock>, [">= 0"])
      s.add_development_dependency(%q<sdoc>, [">= 0"])
    else
      s.add_dependency(%q<blankslate>, ["~> 2.0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<flexmock>, [">= 0"])
      s.add_dependency(%q<sdoc>, [">= 0"])
    end
  else
    s.add_dependency(%q<blankslate>, ["~> 2.0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<flexmock>, [">= 0"])
    s.add_dependency(%q<sdoc>, [">= 0"])
  end
end
