require 'test_helper'

class XmlhasherTest < Test::Unit::TestCase

  def test_string_parsing_no_tranformation
    hash = {:InstitutionDetail =>
                {:address =>
                     {:"ns2:address1" => "100 Main Street",
                      :"ns2:city" => "Anytown",
                      :"ns2:country" => "USA",
                      :"ns2:postalCode" => "94043",
                      :"ns2:state" => "CA"},
                 :currencyCode => "ANG",
                 :emailAddress => "CustomerCentralBank@intuit.com",
                 :homeUrl => "http://www.example.com",
                 :institutionId => "100000",
                 :institutionName => "CCBank",
                 :keys =>
                     {:key =>
                          [{:description => "2",
                            :displayFlag => "true",
                            :displayOrder => "1",
                            :instructions => "2",
                            :mask => "false",
                            :name => "Banking Userid",
                            :status => "Active",
                            :valueLengthMax => "100",
                            :valueLengthMin => "1"},
                           {:description => "2",
                            :displayFlag => "false",
                            :displayOrder => "2",
                            :instructions => "2",
                            :mask => "true",
                            :name => "Banking Password",
                            :status => "Active",
                            :valueLengthMax => "100",
                            :valueLengthMin => "1"}]},
                 :locale => {:language => "en"},
                 :phoneNumber => "123-456-7890"},
            :xmlns => "http://schema.intuit.com/platform/fdatafeed/account/v1",
            :"xmlns:ns2" => "http://schema.intuit.com/platform/fdatafeed/common/v1"}
    result = XmlHasher::Parser.new.parse(fixture('institution.xml').read)
    assert_equal hash, result
  end

  def test_string_parsing_with_tranformation
    options = {
        :snakecase => true,
        :ignore_namespaces => true
    }
    hash = {:institution_detail =>
                {:address =>
                     {:address1 => "100 Main Street",
                      :city => "Anytown",
                      :country => "USA",
                      :postal_code => "94043",
                      :state => "CA"},
                 :currency_code => "ANG",
                 :email_address => "CustomerCentralBank@intuit.com",
                 :home_url => "http://www.example.com",
                 :institution_id => "100000",
                 :institution_name => "CCBank",
                 :keys =>
                     {:key =>
                          [{:description => "2",
                            :display_flag => "true",
                            :display_order => "1",
                            :instructions => "2",
                            :mask => "false",
                            :name => "Banking Userid",
                            :status => "Active",
                            :value_length_max => "100",
                            :value_length_min => "1"},
                           {:description => "2",
                            :display_flag => "false",
                            :display_order => "2",
                            :instructions => "2",
                            :mask => "true",
                            :name => "Banking Password",
                            :status => "Active",
                            :value_length_max => "100",
                            :value_length_min => "1"}]},
                 :locale => {:language => "en"},
                 :phone_number => "123-456-7890"}}
    result = XmlHasher::Parser.new(options).parse(fixture('institution.xml').read)
    assert_equal hash, result
  end

  def test_stream_parsing_with_tranformation
    options = {
        :snakecase => true,
        :ignore_namespaces => true
    }
    hash = {:institution_detail =>
                {:address =>
                     {:address1 => "100 Main Street",
                      :city => "Anytown",
                      :country => "USA",
                      :postal_code => "94043",
                      :state => "CA"},
                 :currency_code => "ANG",
                 :email_address => "CustomerCentralBank@intuit.com",
                 :home_url => "http://www.example.com",
                 :institution_id => "100000",
                 :institution_name => "CCBank",
                 :keys =>
                     {:key =>
                          [{:description => "2",
                            :display_flag => "true",
                            :display_order => "1",
                            :instructions => "2",
                            :mask => "false",
                            :name => "Banking Userid",
                            :status => "Active",
                            :value_length_max => "100",
                            :value_length_min => "1"},
                           {:description => "2",
                            :display_flag => "false",
                            :display_order => "2",
                            :instructions => "2",
                            :mask => "true",
                            :name => "Banking Password",
                            :status => "Active",
                            :value_length_max => "100",
                            :value_length_min => "1"}]},
                 :locale => {:language => "en"},
                 :phone_number => "123-456-7890"}}
    result = XmlHasher::Parser.new(options).parse(fixture('institution.xml'))
    assert_equal hash, result
  end
end
