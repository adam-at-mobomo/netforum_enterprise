require 'test_helper'

class ServiceTest < MiniTest::Test
  def setup
    stub_wsdl
  end

  def test_authenticate_success
    stub_login

    service = NetforumEnterprise::Service.new('user', 'abc')
    assert_equal true, service.authenticate
  end

  def test_authenticate_failure
    stub_login_failure

    service = NetforumEnterprise::Service.new('user', 'abc')
    assert_equal false, service.authenticate
  end

  def test_web_user_login_success
    stub_login
    stub_web_user_login

    service = NetforumEnterprise::Service.new('user', 'abc')
    info = service.web_user_login('user2', '123')

    assert_equal true, !info.nil?
  end

  def test_web_user_login_failure
    stub_login
    stub_web_user_login_failure

    service = NetforumEnterprise::Service.new('user', 'abc')
    info = service.web_user_login('user2', '123')

    assert_equal true, info.nil?
  end

  def test_web_validate_success
    stub_login
    stub_web_validate

    service = NetforumEnterprise::Service.new('user', 'abc')
    customer_key = service.web_validate('123')

    assert_equal true, !customer_key.nil?
  end

  def test_web_validate_failure
    stub_login
    stub_web_validate_failure

    service = NetforumEnterprise::Service.new('user', 'abc')
    customer_key = service.web_validate('123')

    assert_equal true, customer_key.nil?
  end

  def test_get_individual_information_success
    stub_login
    stub_get_individual_information

    service = NetforumEnterprise::Service.new('user', 'abc')
    info = service.get_individual_information('123')

    assert_equal true, !info.nil?
  end

  def test_get_individual_information_failure
    stub_login
    stub_get_individual_information_failure

    service = NetforumEnterprise::Service.new('user', 'abc')
    info = service.get_individual_information('123')

    assert_equal true, info.nil?
  end
end
