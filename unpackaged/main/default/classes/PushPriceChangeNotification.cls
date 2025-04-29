public with sharing class PushPriceChangeNotification {
    @InvocableMethod(label='Push Price Change Notification' description='Sends a push notification when a property price changes.')
    public static void sendPriceChangeNotification(List<Id> propertyIds) {
        List<Property__c> properties = [SELECT Id, Price__c FROM Property__c WHERE Id IN :propertyIds];

        for (Property__c property : properties) {
            try {
                // Implement push notification logic here
                // Example: sendPushNotification(property);
                System.debug('Sending push notification for property ID: ' + property.Id + ' with new price: ' + property.Price__c);
            } catch (Exception ex) {
                // Handle exceptions (e.g., failed API call, invalid data)
                System.debug('Error sending push notification: ' + ex.getMessage());
            }
        }
    }
    
    // Optional: Method to send push notification, integrating with a third-party service
    private static void sendPushNotification(Property__c property) {
        // Implement third-party push notification integration (e.g., HTTP callout)
    }
}