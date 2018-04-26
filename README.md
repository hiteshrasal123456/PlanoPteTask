
1.Timer is will active in background because -
i set background mode on.then i use  notification to run the timer.When app goes into background  applicationDidEnterBackground will get called then using notification i am execute the notification method.
in that method i use background task identifier and use UIApplication.beginBackgroundTask to indicate that code will execute when application enter into background mode.
Because above approach timer is running and getting timer lable get update data when back from background mode.

