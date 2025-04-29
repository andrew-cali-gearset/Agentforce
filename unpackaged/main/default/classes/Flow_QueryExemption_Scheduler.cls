// Schedulable class to schedule the flow invocation
global class Flow_QueryExemption_Scheduler implements Schedulable {
    global void execute(SchedulableContext context) {
        // Enqueue job to trigger the flow every hour
        System.enqueueJob(new FlowInvokerQueryExemption('QUERY_EXEMPTION'));
    }

    // Method to schedule the job every hour
    public static void scheduleJob() {
        String cronExp = '0 2 * * * ?';
        System.schedule('FlowQueryExemptionScheduler_Hourly', cronExp, new Flow_QueryExemption_Scheduler());
    }
}