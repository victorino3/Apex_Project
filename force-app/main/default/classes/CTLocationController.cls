public with sharing class CTLocationController {
    public List<Location__c> getRecentStatusChanges(){
        List<Location__c> location = [SELECT Id, IsDeleted, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c 
                                      FROM Location__c
                                      WITH SECURITY_ENFORCED
                                      ORDER BY Status_Update_Date__c DESC LIMIT 100];
        if (location != null && location.size() > 0) {
            return location;
        }
        return null;
    }
    public static List<Location__c> searchLocations(String searchItem){
        searchItem = searchItem+'%';
        List<Location__c> location = [SELECT Id, IsDeleted, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c
                                    WHERE (Name  LIKE :searchItem OR  Pincode__c  LIKE :searchItem OR Address__c LIKE :searchItem)
                                    WITH SECURITY_ENFORCED
                                    ORDER BY Status_Update_Date__c DESC  NULLS LAST];
        if (location != null && location.size() > 0) {
            return location;
        }
        return null;
    }
    public Location__c getLocationById(String locationId){
        List<Location__c> locations = [SELECT Id, IsDeleted, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c
                                       FROM Location__c
                                       WHERE Id =:locationId WITH SECURITY_ENFORCED];
        if (locations != null && locations.size() > 0) {
            return locations[0];
        }
        return null;
    }
}