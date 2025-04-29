global class ScheduleTaskCreator implements Schedulable {
    
    global void execute(SchedulableContext SC) {
        TaskCreator.createTasks();
    }
}