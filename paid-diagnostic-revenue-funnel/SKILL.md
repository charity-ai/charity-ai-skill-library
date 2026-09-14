---
name: paid-diagnostic-revenue-funnel
description: Build, launch, test, and scale a premium paid AI-search, revenue, or operations diagnostic funnel for an agency, consultant, or high-ticket service business. Use for a $1,500-style paid diagnostic, GoHighLevel contact-to-opportunity automation, PayPal checkout and verified webhook handoff, paid-buyer calendar booking, branded conversion website, Search Atlas authority plan, or a founder-led demand-generation launch.
---

# Paid Diagnostic Revenue Funnel

Build one coherent buyer path:

> **Targeted attention → qualification request → paid diagnostic → paid-buyer booking → strategic artifact → implementation retainer**

Do not build a generic lead magnet or free-consultation funnel when the objective is immediate revenue. The diagnostic is a **commercial filter and decision product**. It must be useful even if the buyer does not continue.

## Required companion skills

Read these before starting the corresponding work:

- Read `automation-and-scheduling` before webhooks, API integrations, triggered workflows, or background logic.
- Read `revenue-capture-intake-diagnostics` before claiming form, payment, CRM, booking, notification, or attribution behavior is working.
- Read `charity-loves-ai-launch` before building the public premium funnel.
- Read `ebook-sales-funnel` before PayPal checkout, payment links, or delivery automation.
- Read `premium-local-service-cloudflare-launch` before a Cloudflare deployment or domain cutover.
- Read `imagegen` before generating or editing customer-facing visual assets.

## Inputs to confirm or infer

Collect only variables that change the live build. Use defaults when the user does not supply alternatives.

| Parameter | Default |
|---|---|
| Buyer | Owner-led high-ticket service operator in one vertical |
| Niche | Southern California restoration or premium home services |
| Offer | AI Search Revenue Diagnostic |
| Fee | $1,500 one-time USD payment, credited toward implementation if the buyer enrolls within the stated period |
| Booking | Dedicated 15-minute paid-buyer calendar |
| CRM | Native GoHighLevel form, contact, opportunity, and pipeline |
| Payment | PayPal one-time payment link or Hosted Button |
| Follow-up | Owner alert and buyer email; no automated SMS until consent and sending compliance are verified |
| Implementation | $4,500+ monthly visibility, authority, CRM conversion, and reporting system |

Read `templates/ai-search-diagnostic-launch-brief.md` to capture the operating choices before build work.

Do not invent social proof, revenue results, review text, ratings, client identity, local service claims, availability, or meeting links. Reuse only assets that are confirmed to belong to the offer.

## Build sequence

### 1. Establish commercial truth

Define the high-value service lines, service areas, decision-maker, job economics, buyer urgency, capacity constraints, proof assets, and the exact conversion event that matters. Decide what makes a buyer qualified for the paid diagnostic. A $1,500 diagnostic should yield a defined output: a Revenue Map, AI/local visibility baseline, competitor and citation gap, conversion/CRM handoff audit, and 90-day implementation sequence.

Use `references/ai-search-revenue-diagnostic-launch.md` for the system layers, demand-generation priorities, Search Atlas order of operations, and 30-day launch targets.

### 2. Inspect before creating

Verify GoHighLevel private API access and inspect existing tags, custom fields, users, calendars, forms, pipelines, workflows, and sender configuration. Verify PayPal connection state before asking the user to create payment assets. Reuse compatible assets, but never overwrite a similarly named one without inspecting it.

State access limitations accurately. Browser login, Private API access, a separate OAuth MCP token, and account-level roles are different access paths. Do not claim unrestricted access to billing, marketplace purchases, phone/email provisioning, or user management without testing the relevant function.

### 3. Build the CRM foundation

Create a dedicated naming prefix, tags, a readiness field, and a pipeline. Default stages are:

1. New Request
2. Qualified
3. Payment Pending
4. Diagnostic Booked / Paid
5. Diagnostic Complete
6. Strategy Delivered
7. Proposal
8. Won
9. Nurture

Use `scripts/build_ghl_diagnostic_foundation.sh` as a starting point only after inspecting the account identifiers and API schema. Validate the created objects with read-only API requests.

### 4. Create qualification and booking paths

Create a native qualification form requiring name, business email, mobile phone, website, business type, and a response describing why the paid diagnostic matters now. Confirm that the hosted form URL loads successfully.

Create a **dedicated 15-minute calendar** using the owner’s real availability. Do not alter a general discovery calendar. Confirm that the booking widget URL loads successfully and that the calendar creates the intended meeting link, buyer confirmation, and owner notification.

Use `templates/15-minute-diagnostic-call-script.md` to prepare the buyer-facing session.

### 5. Create payment safely

Create a one-time PayPal payment link or Hosted Button in USD. Describe the precise diagnostic scope, payment amount, fee-credit policy, and next step. Set the payment return URL to the branded `/thank-you` route.

Do not duplicate payment-link creation calls when a user-facing PayPal creation form is already open. Do not enable recurring payment, shipping, sales tax, or adjustable quantity unless the specific offer requires it.

The buyer flow must make this distinction explicit:

- A form request is not payment.
- Payment is not a booked meeting.
- Booking is not a completed diagnostic.

### 6. Build the branded public funnel

Build a premium landing page with one primary qualification CTA, clear buyer outcomes, diagnostic deliverables, fee clarity, credible proof, and customer-transformation language. The public page must not expose internal IDs, CRM names, API paths, debug details, builder instructions, or confidential implementation notes.

**White-label rule:** Never display “Made with Manus,” “Powered by Manus,” or other builder/platform branding on a customer-facing site unless the user explicitly requests it. Remove source-level branding. If a managed host injects platform branding, deploy the buyer-facing frontend through user-controlled hosting such as Cloudflare Pages or Workers after the deployment and webhook architecture are verified. Do not hide a platform badge only with fragile CSS.

Build `/thank-you` to show payment first and paid-buyer booking second. Do not put the booking widget beside an unpaid request form. Use buyer-friendly language and legal links when capture/payment are live.

### 7. Add verified PayPal-to-CRM automation

Use a server-side webhook listener. Never trust client-side payment return parameters as evidence of payment.

1. Build the listener to verify PayPal transmission signatures.
2. Deduplicate on event and payment identifiers.
3. Find or create the buyer contact by verified payer email.
4. Add the paid-diagnostic tag and preserve source attribution.
5. Create or move the opportunity to the paid booking-required stage.
6. Alert the owner and send/unlock the paid-buyer booking path.
7. Log non-sensitive audit details for troubleshooting.

Run Sandbox before Live. Read `templates/paypal-live-webhook-checklist.md` before registering either webhook. Support distinct Sandbox and Live webhook IDs as server-only secrets. Reject events without valid signature verification. Do not accept live payments in permissive mode.

Do not create a real charge for testing unless the user explicitly approves the exact transaction. Use PayPal Sandbox buyer and merchant accounts for controlled checkout testing.

### 8. Test the actual purchaser journey

Use a controlled test contact and verify the full path:

| Step | Required proof |
|---|---|
| Landing page | Buyer-facing content, legal links, and CTA load on desktop and mobile |
| Qualification | Form creates or updates the intended contact and source details |
| Payment | Sandbox or approved live checkout completes with the intended item/amount |
| Webhook | Signature validates and the event is deduplicated |
| CRM | Contact is tagged and opportunity appears in the paid stage |
| Booking | Paid buyer books the dedicated calendar |
| Meeting | Buyer and owner receive confirmation and a real meeting link |
| Notifications | Owner receives the approved internal alert |
| Attribution | Source, campaign, payment, booking, and opportunity fields are reportable |

Use `revenue-capture-intake-diagnostics` for production evidence. Report **Live**, **Configured but untested**, and **Blocked or pending user action** separately. Never call a conversion layer complete merely because its screen exists.

### 9. Deliver the paid decision product

Deliver a decision-ready package within **72 business hours after the paid buyer’s 15-minute working session**. Use 4–6 hours per diagnostic for the first three engagements. Improve toward 2.5–4 hours only after quality is proven.

The buyer receives an Executive Revenue Scorecard, Revenue Engine Build Blueprint, 90-Day Action Plan, and a private 8–12 minute executive walkthrough. Keep the implementation proposal separate. The diagnostic must retain value even if the buyer declines implementation.

Automate payment verification, contact/opportunity synchronization, appointment confirmation, reminders, delivery-date fields, status changes, and owner alerts. Preserve human review for account-specific claims, opportunity prioritization, investment recommendation, final report approval, and commercial closing.

Read `references/delivery-operations.md` for the delivery timeline, service-level standard, CRM stages, package structure, and automation boundary. Read `templates/client-delivery-messages.md` before configuring the payment-cleared acknowledgment, optional appointment text, missing-input request, delivery email, or decision follow-up.

If the booking calendar is visible before payment verification, report it as a hardening gap. Gate booking through a verified PayPal event and a controlled booking link. Do not trust a payment-return query parameter as proof of payment.

### 10. Launch demand generation

Do not wait for generic SEO. Start with a named-account authority campaign:

1. Build a 100-account target list in one vertical and geography.
2. Send 10–15 individualized 60–90 second observations per business day.
3. Offer the paid diagnostic, not an open-ended free consultation.
4. Build 25 credible ecosystem relationships using a useful benchmark, briefing, or member resource.
5. Publish three LinkedIn authority posts weekly and one useful YouTube video weekly.
6. Test Google Search Ads only against explicit buyer intent with a controlled spend cap and conversion tracking.
7. Use retargeting only after qualified audience volume exists.

Use Search Atlas as authority infrastructure. First establish a baseline, map commercial prompts, publish real commercial/evidence-led pages, create one original benchmark or research asset, then use cloud stacks as a conservative support layer. Do not use automated link volume, thin AI content, fabricated local entities, fake reviews, repetitive exact-match anchors, or undisclosed community seeding as the core strategy.

### 11. Package and deliver

Run type-check, production build, tests, public-route checks, and relevant CRM read validations. Save a production checkpoint after a material implementation change. Package source and handoff documentation when requested.

When live payment is involved, say exactly what has been proven and what remains untested. The first unproven dependency is the only acceptable next-step recommendation.

## Reusable resources

- `templates/ai-search-diagnostic-launch-brief.md`: commercial and technical launch inputs.
- `templates/15-minute-diagnostic-call-script.md`: paid-buyer interview guide.
- `templates/ghl-workflow-build-prompt.md`: concise native workflow prompt.
- `templates/paypal-live-webhook-checklist.md`: Sandbox-to-Live webhook registration and safety checklist.
- `templates/client-delivery-messages.md`: payment-cleared, appointment, delivery, and decision messages.
- `references/ai-search-revenue-diagnostic-launch.md`: methodology, Search Atlas operations, channel roles, and 30-day demand plan.
- `references/delivery-operations.md`: 72-hour delivery SOP, package standard, and automation boundary.
- `scripts/build_ghl_diagnostic_foundation.sh`: reusable CRM foundation script.

## Final reporting standard

Use a table separating **Live**, **Configured but untested**, and **Blocked or pending user action**. Identify the single next conversion dependency. For a new offer, the priority is always the path most likely to produce the first paid diagnostic, not the largest unfinished technical task.
