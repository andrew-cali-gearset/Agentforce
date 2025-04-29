global class CaseEscalationEmailHandler {
    @InvocableMethod(label='Send Escalation Email' description='Sends a holding email to notify the customer that their case has been escalated.')
    public static void sendEscalationEmail(List<Id> caseIds) {
        if (caseIds == null || caseIds.isEmpty()) {
            return;
        }

        List<Case> caseList = [SELECT Id, ContactEmail FROM Case WHERE Id IN :caseIds];
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

        for (Case c : caseList) {
            if (c.ContactEmail != null) {
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setToAddresses(new List<String>{c.ContactEmail});
                email.setSubject('Your Case Has Been Escalated');
                email.setPlainTextBody('We wanted to let you know that your case has been escalated to ensure faster resolution. Our team is actively working on it, and we will keep you updated on any progress.');
                emails.add(email);
            }
        }

        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }
    }
}