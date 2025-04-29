public class TaskCreator {
    
    public static void createTasks() {
        // List to hold the tasks to be inserted
        List<Task> tasksToInsert = new List<Task>();

        // Query to get random Account IDs
        List<Account> randomAccounts = [SELECT Id FROM Account LIMIT 150];

        // Create tasks for each account
        for (Account acc : randomAccounts) {
            Task newTask = new Task(
                WhatId = acc.Id,
                Subject = 'Email',
                Status = 'Completed'
            );
            tasksToInsert.add(newTask);
        }
        
        // Insert tasks in Salesforce
        if (!tasksToInsert.isEmpty()) {
            insert tasksToInsert;
        }
    }
}