// Schedulable class to schedule the flow invocation
global class Flow_ListExemption_Scheduler implements Schedulable {
    global void execute(SchedulableContext context) {
        // Enqueue job to trigger the flow every hour
        System.enqueueJob(new FlowInvokerListExemption('LIST_EXEMPTION'));
    }

    // Method to schedule the job every hour
    public static void scheduleJob() {
        String cronExp = '0 0 * * * ?';
        System.schedule('FlowListExemptionScheduler_Hourly', cronExp, new Flow_ListExemption_Scheduler());
    }
}