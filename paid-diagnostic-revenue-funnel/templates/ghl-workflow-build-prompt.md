# Native GoHighLevel Workflow Build Prompt

Use one prompt at a time in the HighLevel workflow builder or AI workflow helper. Review every action before publishing.

## Form-request workflow

> Create a workflow named `[Brand] | Paid Diagnostic | Intake Routing`. Trigger it when form `[Native Qualification Form]` is submitted. Add tag `src | website | paid diagnostic`, update the diagnostic-readiness field from the submitted response, create or update one opportunity in pipeline `[Pipeline]` at stage `New Request`, assign the contact and opportunity to `[Owner]`, and send an internal notification to `[Owner]` with the name, company, website, primary revenue leak, and form URL. Do not send SMS. Send a confirmation email only after its wording, sender domain, consent basis, and delivery settings have been reviewed.

## Payment-confirmation workflow

> Create a workflow named `[Brand] | Paid Diagnostic | Payment Confirmed`. Trigger it only from a verified payment event or payment-success tag. Move the existing opportunity in pipeline `[Pipeline]` to `Paid`, add tag `stage | paid`, and notify `[Owner]` that payment has been received. Do not use payment-page visits or form submissions as a payment trigger. Do not send SMS.

## Appointment-booked workflow

> Create a workflow named `[Brand] | Paid Diagnostic | Booking Confirmed`. Trigger when calendar `[15-Minute Diagnostic Calendar]` is booked. Move the opportunity in pipeline `[Pipeline]` to `Booked`, add tag `stage | booked`, assign the contact to `[Owner]`, and send an internal notification with appointment time, contact name, business name, website, and diagnostic readiness response. Do not send SMS. Configure email confirmations and reminders only after the sender configuration and consent language are reviewed.
