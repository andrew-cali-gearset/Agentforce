global class UpdateCaseFieldsHourly implements Schedulable {
    
    global void execute(SchedulableContext ctx) {
        updateCaseFields();
    }
    
    public static void updateCaseFields() {
        List<Case> casesToUpdate = new List<Case>();
        
        // Query for open cases
        List<Case> openCases = [SELECT Id, Subject, Status FROM Case WHERE IsClosed = false];
        
        for (Case cas : openCases) {
            // Generate a random subject based on a help-desk scenario
            String randomSubject = generateRandomHelpDeskSubject();
            cas.Subject = randomSubject;
            
            // Update the status of the case 50% of the time to 'Working'
            if (Math.random() < 0.5) {
                cas.Status = 'Working';
            }
            
            casesToUpdate.add(cas);
        }
        
        if (!casesToUpdate.isEmpty()) {
            update casesToUpdate;
        }
    }
    
    private static String generateRandomHelpDeskSubject() {
        List<String> subjects = new List<String>{
            'Login issues', 'Password reset request', 'Software installation problem', 'Network connectivity problem', 'Email configuration issue', 'Printer not working', 'Application error message', 'Data loss or corruption', 'File access permission issue', 'Browser compatibility problem', 'Mobile app not functioning', 'Slow computer performance', 'Hardware malfunction', 'System crash or freeze', 'Virus or malware infection', 'Website not loading', 'Server downtime', 'Database error', 'Backup and restore request', 'Software update request', 'Training request', 'Documentation request', 'Account access request', 'Billing inquiry', 'Service cancellation request', 'Product defect report', 'Feature request', 'User interface issue', 'Error in report generation', 'Integration problem', 'Customization request', 'Data migration request', 'API endpoint issue', 'Security vulnerability report', 'Spam or phishing email', 'Software license inquiry', 'Upgrade assistance', 'Remote desktop support', 'VoIP phone configuration', 'Video conference setup', 'DNS configuration issue', 'SSL certificate installation', 'Remote access setup', 'Performance tuning request', 'Data synchronization problem', 'Outage notification', 'Firewall configuration issue'
        };

        // Generate a random index within the bounds of the subjects list
        Integer randomIndex = (Integer)Math.floor(Math.random() * subjects.size());

        // Return the random subject
        return subjects[randomIndex];
    }
}