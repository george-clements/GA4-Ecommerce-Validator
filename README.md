With all of the changes being made on a website, it's common for a fully functional dataLayer to be inadvertently changed.

Monitoring can be setup on the incoming raw data to validate and ensure that nothing has been changed. This requires data pipelines and cronjobs, but is still the best way.

This repo showcases a different approach. Namely defining a schema for what a dataLayer event's object should look like and tests the actual object against the schema.
If anything fails our defined validation, a dataLayer push is made, so that GTM can fire a 'dataLayer invalid' event, including a string describing the event data that was wrong.

This is particularly useful for DEV environments - to pick up on dataLayer issues before they even hit production. 
