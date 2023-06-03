public class TimeZoneService {
    // public static string EST='America/New_York';
    private DateTime convertToOtherTimeZone(DateTime dttime, string sourceTimezone, string targetTimezone) {
        TimeZone tz = Timezone.getTimeZone(sourceTimezone);
        Integer offset=tz.getOffset(dttime);
        
        // target Timezone.
        TimeZone targetTZ = Timezone.getTimeZone(targetTimezone);
        integer offsetTotargetTZ = targetTZ.getOffset(dttime);
        integer correction = offsetTotargetTZ- offset;
        
        DateTime targetDT = dttime.addMinutes(correction / (1000 * 60));
        
        return targetDT;
    }
   	//Convert Any Time to other timezone
    public Time convertTimeToOtherTimeZone(DateTime dttime, string sourceTimezone, string targetTimezone) {
        DateTime targetDT = convertToOtherTimeZone(dttime,sourceTimezone,targetTimezone);
        return Time.newInstance(targetDT.hour(), targetDT.minute(), targetDT.second(), targetDT.millisecond());
    }
    
    //Convert Any DateTime to other timezone
    public DateTime convertDateTimeToOtherTimeZone(DateTime dttime, string sourceTimezone, string targetTimezone) {
         DateTime targetDT = convertToOtherTimeZone(dttime,sourceTimezone,targetTimezone);
        return DateTime.newInstance(targetDT.year(),targetDT.month(),targetDT.day(),targetDT.hour(), targetDT.minute(), targetDT.second());
    }
}