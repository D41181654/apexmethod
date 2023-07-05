public class RestAPITask {
    public static void createSObject(Map<Map<String,String>,List<SObject>> fieldValuesMap){
               for (Map<String, String> fieldMap : fieldValuesMap.keySet()) {
            List<SObject> sObjects = fieldValuesMap.get(fieldMap);

            if (sObjects != null && !sObjects.isEmpty()) {
                // Get the SObject type from the first record in the list
                Schema.SObjectType sObjectType = sObjects[0].getSObjectType();
                List<SObject> recordsToUpdate = new List<SObject>();

                for (SObject sObjectrec : sObjects) {
                    // Create a new instance of the SObject type to update the fields
                    SObject updatedRecord = sObjectType.newSObject();

                    // Set the field values on the new SObject instance
                    for (String fieldName : fieldMap.keySet()) {
                        String fieldValue = fieldMap.get(fieldName);
                        updatedRecord.put(fieldName, fieldValue);
                    }

                    // Set the record Id if available
                    if (sObjectrec.Id != null) {
                        updatedRecord.Id = sObjectrec.Id;
                    }

                    recordsToUpdate.add(updatedRecord);
                }

                // Perform the update operation
                if (!recordsToUpdate.isEmpty()) {
                    update recordsToUpdate;
                }
            }
        }
    }
}