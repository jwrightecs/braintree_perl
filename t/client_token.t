use lib qw(lib t/lib);
use Test::More;
use WebService::Braintree::ClientToken;
use WebService::Braintree::TestHelper;

subtest "it fails if given a non whitelisted parameter" => sub {
  should_throw("ArgumentError", sub {
    WebService::Braintree::ClientToken->generate({nonexistent_parameter => 47});
  });
};

subtest "it requires a customer_id when credit card options are provided" => sub {
  should_throw("ArgumentError", sub {
    WebService::Braintree::ClientToken->generate({
      verify_card => 1
    });
  });

  should_throw("ArgumentError", sub {
    WebService::Braintree::ClientToken->generate({
      fail_on_duplicate_payment_method => 1
    });
  });

  should_throw("ArgumentError", sub {
    WebService::Braintree::ClientToken->generate({
      make_default => 1
    });
  });
};

done_testing();
