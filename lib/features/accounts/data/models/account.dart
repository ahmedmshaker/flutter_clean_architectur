class Account {
  Account({
    required this.address2Addresstypecode,
    required this.address1Country,
    required this.merged,
    required this.accountnumber,
    required this.statecode,
    required this.emailaddress1,
    required this.exchangerate,
    required this.name,
    required this.websiteurl,
    required this.modifiedon,
    required this.owninguserValue,
    required this.primarycontactidValue,
    required this.importsequencenumber,
    required this.address1Composite,
    required this.donotpostalmail,
    required this.accountratingcode,
    required this.marketingonly,
    required this.revenueBase,
    required this.preferredcontactmethodcode,
    required this.owneridValue,
    required this.customersizecode,
    required this.businesstypecode,
    required this.donotemail,
    required this.address2Shippingmethodcode,
    required this.address1Addressid,
    required this.address2Freighttermscode,
    required this.statuscode,
    required this.createdon,
    required this.address1Stateorprovince,
    required this.donotsendmm,
    required this.donotfax,
    required this.donotbulkpostalmail,
    required this.versionnumber,
    required this.address1Line1,
    required this.creditonhold,
    required this.telephone1,
    required this.donotphone,
    required this.transactioncurrencyidValue,
    required this.accountid,
    required this.donotbulkemail,
    required this.modifiedbyValue,
    required this.followemail,
    required this.shippingmethodcode,
    required this.createdbyValue,
    required this.address1City,
    required this.territorycode,
    required this.revenue,
    required this.participatesinworkflow,
    required this.numberofemployees,
    required this.accountclassificationcode,
    required this.owningbusinessunitValue,
    required this.address2Addressid,
    required this.address1Postalcode,
  });
  late final int address2Addresstypecode;
  late final String address1Country;
  late final bool merged;
  late final String accountnumber;
  late final int statecode;
  late final String emailaddress1;
  late final double exchangerate;
  late final String name;
  late final String websiteurl;
  late final String modifiedon;
  late final String owninguserValue;
  late final String primarycontactidValue;
  late final int importsequencenumber;
  late final String address1Composite;
  late final bool donotpostalmail;
  late final int accountratingcode;
  late final bool marketingonly;
  late final double revenueBase;
  late final int preferredcontactmethodcode;
  late final String owneridValue;
  late final int customersizecode;
  late final int businesstypecode;
  late final bool donotemail;
  late final int address2Shippingmethodcode;
  late final String address1Addressid;
  late final int address2Freighttermscode;
  late final int statuscode;
  late final String createdon;
  late final String address1Stateorprovince;
  late final bool donotsendmm;
  late final bool donotfax;
  late final bool donotbulkpostalmail;
  late final int versionnumber;
  late final String address1Line1;
  late final bool creditonhold;
  late final String telephone1;
  late final bool donotphone;
  late final String transactioncurrencyidValue;
  late final String accountid;
  late final bool donotbulkemail;
  late final String modifiedbyValue;
  late final bool followemail;
  late final int shippingmethodcode;
  late final String createdbyValue;
  late final String address1City;
  late final int territorycode;
  late final double revenue;
  late final bool participatesinworkflow;
  late final int numberofemployees;
  late final int accountclassificationcode;
  late final String owningbusinessunitValue;
  late final String address2Addressid;
  late final String address1Postalcode;

  Account.fromJson(Map<String, dynamic> json){
    address2Addresstypecode = json['address2_addresstypecode'];
    address1Country = json['address1_country'].toString();
    merged = json['merged'];
    accountnumber = json['accountnumber']??"N/A";
    statecode = json['statecode'];
    emailaddress1 = json['emailaddress1'].toString();
    exchangerate = json['exchangerate'];
    name = json['name'].toString();
    websiteurl = json['websiteurl'].toString();
    modifiedon = json['modifiedon'].toString();
    owninguserValue = json['_owninguser_value'].toString();
    primarycontactidValue = json['_primarycontactid_value'].toString();
    importsequencenumber = json['importsequencenumber'];
    address1Composite = json['address1_composite'].toString();
    donotpostalmail = json['donotpostalmail'];
    accountratingcode = json['accountratingcode'];
    marketingonly = json['marketingonly'];
    revenueBase = json['revenue_base'];
    preferredcontactmethodcode = json['preferredcontactmethodcode'];
    owneridValue = json['_ownerid_value'].toString();
    customersizecode = json['customersizecode'];
    businesstypecode = json['businesstypecode'];
    donotemail = json['donotemail'];
    address2Shippingmethodcode = json['address2_shippingmethodcode'];
    address1Addressid = json['address1_addressid'].toString();
    address2Freighttermscode = json['address2_freighttermscode'];
    statuscode = json['statuscode'];
    createdon = json['createdon'].toString();
    address1Stateorprovince = json['address1_stateorprovince'].toString();
    donotsendmm = json['donotsendmm'];
    donotfax = json['donotfax'];
    donotbulkpostalmail = json['donotbulkpostalmail'];
    versionnumber = json['versionnumber'];
    address1Line1 = json['address1_line1'].toString();
    creditonhold = json['creditonhold'];
    telephone1 = json['telephone1'].toString();
    donotphone = json['donotphone'];
    transactioncurrencyidValue = json['_transactioncurrencyid_value'].toString();
    accountid = json['accountid'].toString();
    donotbulkemail = json['donotbulkemail'];
    modifiedbyValue = json['_modifiedby_value'].toString();
    followemail = json['followemail'];
    shippingmethodcode = json['shippingmethodcode'];
    createdbyValue = json['_createdby_value'].toString();
    address1City = json['address1_city'].toString();
    territorycode = json['territorycode'];
    revenue = json['revenue'];
    participatesinworkflow = json['participatesinworkflow'];
    numberofemployees = json['numberofemployees'];
    accountclassificationcode = json['accountclassificationcode'];
    owningbusinessunitValue = json['_owningbusinessunit_value'].toString();
    address2Addressid = json['address2_addressid'].toString();
    address1Postalcode = json['address1_postalcode'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address2_addresstypecode'] = address2Addresstypecode;
    _data['address1_country'] = address1Country;
    _data['merged'] = merged;
    _data['accountnumber'] = accountnumber;
    _data['statecode'] = statecode;
    _data['emailaddress1'] = emailaddress1;
    _data['exchangerate'] = exchangerate;
    _data['name'] = name;
    _data['websiteurl'] = websiteurl;
    _data['modifiedon'] = modifiedon;
    _data['_owninguser_value'] = owninguserValue;
    _data['_primarycontactid_value'] = primarycontactidValue;
    _data['importsequencenumber'] = importsequencenumber;
    _data['address1_composite'] = address1Composite;
    _data['donotpostalmail'] = donotpostalmail;
    _data['accountratingcode'] = accountratingcode;
    _data['marketingonly'] = marketingonly;
    _data['revenue_base'] = revenueBase;
    _data['preferredcontactmethodcode'] = preferredcontactmethodcode;
    _data['_ownerid_value'] = owneridValue;
    _data['customersizecode'] = customersizecode;
    _data['businesstypecode'] = businesstypecode;
    _data['donotemail'] = donotemail;
    _data['address2_shippingmethodcode'] = address2Shippingmethodcode;
    _data['address1_addressid'] = address1Addressid;
    _data['address2_freighttermscode'] = address2Freighttermscode;
    _data['statuscode'] = statuscode;
    _data['createdon'] = createdon;
    _data['address1_stateorprovince'] = address1Stateorprovince;
    _data['donotsendmm'] = donotsendmm;
    _data['donotfax'] = donotfax;
    _data['donotbulkpostalmail'] = donotbulkpostalmail;
    _data['versionnumber'] = versionnumber;
    _data['address1_line1'] = address1Line1;
    _data['creditonhold'] = creditonhold;
    _data['telephone1'] = telephone1;
    _data['donotphone'] = donotphone;
    _data['_transactioncurrencyid_value'] = transactioncurrencyidValue;
    _data['accountid'] = accountid;
    _data['donotbulkemail'] = donotbulkemail;
    _data['_modifiedby_value'] = modifiedbyValue;
    _data['followemail'] = followemail;
    _data['shippingmethodcode'] = shippingmethodcode;
    _data['_createdby_value'] = createdbyValue;
    _data['address1_city'] = address1City;
    _data['territorycode'] = territorycode;
    _data['revenue'] = revenue;
    _data['participatesinworkflow'] = participatesinworkflow;
    _data['numberofemployees'] = numberofemployees;
    _data['accountclassificationcode'] = accountclassificationcode;
    _data['_owningbusinessunit_value'] = owningbusinessunitValue;
    _data['address2_addressid'] = address2Addressid;
    _data['address1_postalcode'] = address1Postalcode;
    return _data;
  }
}