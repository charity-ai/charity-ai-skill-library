# Paid Diagnostic Delivery Operations

## Service-level standard

Deliver a decision-ready package within **72 business hours after the paid buyer’s 15-minute working session**. Use 4–6 hours per diagnostic for the first three engagements. Improve toward 2.5–4 hours only after quality is proven.

## Buyer deliverables

| Asset | Purpose | Length |
|---|---|---:|
| Executive Revenue Scorecard | State priority revenue path, dominant leak, evidence, business consequence, and first move. | 2 pages |
| Revenue Engine Build Blueprint | Explain AI/local relevance, proof, lead capture, CRM, booking, 90-day sequence, metrics, and implementation recommendation. | 10–14 pages/slides |
| 90-Day Action Plan | Clarify Days 1–30, 31–60, and 61–90; include client responsibilities. | 1–2 pages |
| Executive Walkthrough | Explain the recommendation and decision in a private video. | 8–12 minutes |

Keep a separate implementation proposal. The diagnostic must retain value even if the buyer declines implementation.

## Delivery timeline

| Timing | Action |
|---|---|
| 0–15 minutes after verified payment | Send payment-cleared acknowledgment, paid-buyer booking link, and owner alert. |
| Same business day | Review qualification form, visible web/local proof, territory, and notes. Create evidence folder. |
| Working session | Confirm job economics, priority market, dominant leak, decision process, capacity, and proof assets. |
| +24 hours | Research discovery, competitor, proof, lead capture, response, and CRM path. |
| +48 hours | Draft scorecard, blueprint, 90-day plan, walkthrough script, and recommendation. |
| +72 business hours | Quality-check, deliver branded package, invite roadmap decision session. |
| +5–7 days | Decision call; update proposal outcome. |

## Automation boundary

Automate payment verification, contact/opportunity synchronization, appointment confirmation, reminders, delivery-date fields, status changes, and owner alerts. Preserve human review for account-specific claims, opportunity prioritization, investment recommendation, final report approval, and commercial closing.

Do not trust a browser payment-return query parameter as proof of payment. Gate paid-buyer booking through a verified PayPal event, then send the controlled booking path. Keep Sandbox and Live webhook IDs separate as server-only secrets.

## Required CRM delivery stages

Add or use these stages after payment:

1. Paid / Booking Required
2. Booked
3. Intake Complete
4. Research
5. Quality Review
6. Delivered
7. Proposal Decision
8. Won / Nurture / Closed Lost

## Client messages

Read `templates/client-delivery-messages.md` for payment-cleared acknowledgment, optional appointment text, data request, delivery email, and decision follow-up. Do not trigger promotional SMS without verified consent.

## Packaging

Use one private branded folder named:

```text
Charity Loves AI | Revenue Engine Build | [Client] | [Month Year]
```

Place the scorecard, blueprint, 90-day plan, executive walkthrough, optional evidence appendix, and later implementation proposal inside it. Avoid scattered attachments. Keep raw evidence in an appendix, not the executive package.
