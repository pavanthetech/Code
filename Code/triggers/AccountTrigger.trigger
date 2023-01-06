trigger AccountTrigger on Account (after delete, after insert, after undelete, after update, before delete, before insert, before update) {

    /* Before Insert */
    if(Trigger.isInsert && Trigger.isBefore){
        AccountTriggerHandler.OnBeforeInsert(Trigger.new);
    }
    /* After Insert */
    else if(Trigger.isInsert && Trigger.isAfter){
        AccountTriggerHandler.OnAfterInsert(Trigger.new);
    }
    /* Before Update */
    else if(Trigger.isUpdate && Trigger.isBefore){
        AccountTriggerHandler.OnBeforeUpdate(Trigger.old, Trigger.new, Trigger.newMap, Trigger.oldMap);
    }
    /* After Update */
    else if(Trigger.isUpdate && Trigger.isAfter){
        AccountTriggerHandler.OnAfterUpdate(Trigger.old, Trigger.new, Trigger.newMap, Trigger.oldMap);
    }
    /* Before Delete */
    else if(Trigger.isDelete && Trigger.isBefore){
        AccountTriggerHandler.OnBeforeDelete(Trigger.old, Trigger.oldMap);
    }
    /* After Delete */
    else if(Trigger.isDelete && Trigger.isAfter){
        AccountTriggerHandler.OnAfterDelete(Trigger.old, Trigger.oldMap);
    }

    /* After Undelete */
    else if(Trigger.isUnDelete){
        AccountTriggerHandler.OnUndelete(Trigger.new);
    }

}