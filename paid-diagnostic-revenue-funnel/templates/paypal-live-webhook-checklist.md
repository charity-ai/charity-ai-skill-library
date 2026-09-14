# PayPal Live Webhook Registration Checklist

Use this checklist after the payment flow, return page, and server webhook listener have been tested in Sandbox. Do not create a real charge to test production unless the user explicitly approves that transaction.

## Preconditions

- [ ] The public webhook listener URL has been deployed and returns a documented health response.
- [ ] The listener rejects requests without valid PayPal transmission headers.
- [ ] The listener verifies PayPal signatures against the registered webhook ID. Never accept production payment events in permissive mode.
- [ ] The listener is idempotent on PayPal event ID or capture/order ID.
- [ ] HighLevel access has been verified with a non-mutating API call.
- [ ] The relevant contact tags, pipeline, paid stage, booking URL, and owner notification path are known.
- [ ] The return page clearly distinguishes form completion, payment completion, and booking confirmation.

## Sandbox registration

1. Open the PayPal Developer Dashboard.
2. Select **Sandbox**.
3. Open **Apps & Credentials** and the Sandbox REST application.
4. Add a webhook listener using the exact deployed listener URL.
5. Select only `PAYMENT.CAPTURE.COMPLETED` unless a documented business requirement needs additional events.
6. Save the webhook and record the Sandbox Webhook ID as a server secret.
7. Complete a controlled Sandbox buyer payment and verify CRM, opportunity, buyer booking, buyer confirmation, meeting link, and owner alert.

## Live registration

1. Select **Live** in the PayPal Developer Dashboard.
2. Open **Apps & Credentials**.
3. Open the Live REST application. If none exists, create a clearly named production application using the real merchant account.
4. Open **Webhooks** and select **Add Webhook**.
5. Enter the same production listener URL used by the application. Example format:

```text
https://diagnostic.example.com/api/webhooks/paypal
```

6. Select only:

```text
PAYMENT.CAPTURE.COMPLETED
```

7. Save. Record the distinct **Live Webhook ID**.
8. Add the Live ID to a server-only secret such as `PAYPAL_WEBHOOK_IDS`, alongside the Sandbox ID if the same listener supports both environments. Never expose IDs, credentials, client secrets, or webhook verification logic to the browser bundle.
9. Run a server-side test that confirms both environment IDs are loaded and that the CRM token can read the intended pipeline. The test must not create a contact, opportunity, payment, or message.
10. Perform the first live transaction only with explicit user approval. Verify PayPal event delivery, signature acceptance, CRM update, internal alert, buyer booking availability, and buyer confirmation.

## Required payment-completed behavior

For a verified `PAYMENT.CAPTURE.COMPLETED` event, the listener should:

1. Safely deduplicate by event and payment identifiers.
2. Extract buyer email, payer name, payment amount, currency, order/capture identifiers, and purchase reference where available.
3. Find or create the contact in GoHighLevel.
4. Add the paid-diagnostic tag and preserve source attribution.
5. Create or update the diagnostic opportunity in the paid booking-required stage.
6. Notify the owner through the approved channel.
7. Send or unlock the dedicated paid-buyer booking path.
8. Log a non-sensitive audit entry for investigation and support.

## Failure rules

- Reject events whose signature cannot be verified.
- Do not use a shared production listener with `accept all` or permissive verification.
- Do not use client-side code to create HighLevel contacts from PayPal payment confirmation.
- Do not send automated SMS unless consent and sending compliance are verified.
- Do not claim the path is live until a controlled test proves the downstream CRM and booking result.
