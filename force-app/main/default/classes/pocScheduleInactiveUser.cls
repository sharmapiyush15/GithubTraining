global class pocScheduleInactiveUser Implements Schedulable {
    
    global void execute(SchedulableContext sc) {
        pocTestAccount();
    }
    public void pocTestAccount() {
        List<Account> accounts = [SELECT Id, Name FROM Account WHERE Name like '%United%'];
        
        
        for(Account acc : accounts) {
            acc.Name = 'POC Test ' + acc.Name;
        }
        update accounts;
    }
}