// Schedulable class to schedule the flow invocation
global class Flow_NullPointer_Scheduler implements Schedulable {
    global void execute(SchedulableContext context) {
        // Enqueue job to trigger the flow every hour
        System.enqueueJob(new FlowInvokerNullPointer('NULL_POINTER'));
    }

    // Method to schedule the job every hour
    public static void scheduleJob() {
        String cronExp = '0 5 * * * ?';
        System.schedule('FlowNullPointerScheduler_Hourly', cronExp, new Flow_NullPointer_Scheduler());
    }
}