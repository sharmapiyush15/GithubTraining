global class POCInactiveUserScheduleClass Implements Schedulable {
    global void execute(SchedulableContext sc) {
        pocTestAccount();
    }
    public void pocTestAccount() {
        List<Account> accounts = [SELECT Id, Name FROM Account WHERE Name like '%University%'];
        
        for(Account acc : accounts) {
            acc.Name = 'POC Test University - ' + acc.Name;
            acc.Name = 'POC Test University Test - ' + acc.Name;
        }
        update accounts;
    }
}