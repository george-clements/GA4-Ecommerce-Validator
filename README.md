With all of the changes being made on a website, it's common for a fully functional dataLayer to be inadvertently changed. The speed with which we react to such incidents, decides how much our data is impacted.

Monitoring can be setup on the incoming raw data to validate and ensure that nothing has been changed. This requires data pipelines and cronjobs, but can be highly effective.

This template utilizes a different approach. Namely defining a schema for what the GA4 ecommerce object should look like and tests the actual object against the schema.
If anything fails our defined validation, a dataLayer push is made, with a 'dataLayer invalid' event, and a stringified JSON stating what exactly failed the validation.
This could be pushed to GA4, subsequently analysed in Biquery, or even sent directly to an error reporting tool such as DataDog or Instana.

This is particularly useful for DEV environments - to pick up on dataLayer issues before they even hit production.
