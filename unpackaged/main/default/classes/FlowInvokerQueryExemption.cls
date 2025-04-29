// Queueable class to invoke the flow
global class FlowInvokerQueryExemption implements Queueable {
    private String flowName;

    public FlowInvokerQueryExemption(String flowName) {
        this.flowName = flowName;
    }

    public void execute(QueueableContext context) {
        try {
            // Execute the specified flow
            Flow.Interview flow = Flow.Interview.createInterview(flowName, new Map<String, Object>());
            flow.start();
        } catch (Exception e) {
            System.debug('Error executing flow: ' + flowName + ' - ' + e.getMessage());
        }
    }
}