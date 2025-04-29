global inherited sharing class AccountQuoteID {
    public static void transformAccounts(List<Account> accounts) {
        for (Account acc : accounts) {

            if (acc.Active__c != 'Yes') {
                continue; 
            }

            String accountName = acc.Name;
            String accountNamePrefix = accountName.substring(0, 3);

            String newSubscriptionNumber = null;
            String newSLAExpirationDate = null;

            String subscriptionNumber = acc.Subscription_number__c;
            String prefixToRemove = 'GEA-';

            if (subscriptionNumber != null && subscriptionNumber.startsWith(prefixToRemove)) {
                subscriptionNumber = subscriptionNumber.substring(prefixToRemove.length());

                newSubscriptionNumber = accountNamePrefix + subscriptionNumber;

                if (newSubscriptionNumber.length() > 10) {
                    newSubscriptionNumber = newSubscriptionNumber.substring(0, 10) + '!';
                }

                Boolean containsUSA = false;

                if (acc.BillingAddress != null) {
                    String billingAddressLower = acc.BillingStreet.toLowerCase();
                    String billingCityLower = acc.BillingCity.toLowerCase();
                    String billingStateLower = acc.BillingState.toLowerCase();
                    String billingPostalCodeLower = acc.BillingPostalCode.toLowerCase();
                    String billingCountryLower = acc.BillingCountry.toLowerCase();

                    if (billingAddressLower.contains('usa') ||
                        billingCityLower.contains('usa') ||
                        billingStateLower.contains('usa') ||
                        billingPostalCodeLower.contains('usa') ||
                        billingCountryLower.contains('usa')) {
                        containsUSA = true;
                    }
                }

                Date slaDate = acc.SLAExpirationDate__c;
                Date formattedSLADate = null;

                if (slaDate != null) {
                    if (containsUSA) {
                        String formattedDate = slaDate.month() + ' ' + slaDate.day().format() + ' ' + slaDate.year();
                        formattedSLADate = Date.valueOf(formattedDate);
                    } else {
                        formattedSLADate = slaDate;
                    }
                }

                acc.Subscription_number_for_Invoice__c = newSubscriptionNumber;
                acc.SLAExpirationDate__c = formattedSLADate;
            }
        }
    }
}