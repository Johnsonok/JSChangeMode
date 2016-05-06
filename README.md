# JSChangeMode
be able to change color of all UI components
For example:You can set day or night mode,we provide notification(When Model-data changed we post a notification to tell ViewController to refresh their UI) and objc_runtime method(objc_runtime help us get ViewController's all members, so we can get the member's getter method to refresh the UI when Model-data changed),so which ViewController need to change should inherit BaseViewController.
