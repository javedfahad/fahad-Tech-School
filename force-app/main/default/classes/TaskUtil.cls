public with sharing class TaskUtil {
    
    public static String getTsakPriority(String Leadstate){
        // validate input

        if (String.isBlank(Leadstate) || Leadstate.length()>2) 
        {
        return null;    
        }

        String taskPriority;
        if (Leadstate == 'CA')
         {
          taskPriority = 'High';  
        }
        else {
            taskPriority = 'Normal'; 
        }
        return taskPriority;
    }
    
}