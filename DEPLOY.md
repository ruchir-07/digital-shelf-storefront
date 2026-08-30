# Deploying the storefront

The page is built, verified and ready. It is **not deployed yet** — the Vercel token connected to this session can list your projects but not create one:

```
403 forbidden — "You don't have permission to create a project."
```

That happened with and without your team scope (`team_yx8rbhXsjgXTpe8QazWbc1Xe`), so it's the token's permissions, not the request. I did not deploy into one of your 50 existing projects to route around it — that would have overwritten something of yours.

## What was verified locally

Served from `python -m http.server` and checked in a real browser:

- Renders correctly, dark theme, no console errors
- No horizontal scroll at 375px or at desktop width
- All 4 products and prices present ($39 / $12 / Free / $19)
- All 8 CTA buttons resolve; unset ones fall back to a mailto so nothing is a dead link
- Setup banner correctly reports "7 of 7 checkout links are still empty"

## Deploy it — option 1, CLI (fastest)

```bash
npx vercel deploy --prod "C:\Users\DELL\Desktop\DIGITAL\_SHIP\03-storefront"
```

It will prompt you to log in the first time. That uses your own credentials rather than the restricted token.

## Deploy it — option 2, fix the token

Vercel → Settings → Tokens → issue a token with **full access** (not read-only), reconnect the integration, and I can deploy it for you in one call.

## Deploy it — option 3, drag and drop

`vercel.com/new` → drag the `03-storefront` folder in.

## Before you deploy: fill in the links

Open `index.html`, scroll to the bottom, and fill the `LINKS` object. Seven URLs:

```js
const LINKS = {
  kit:         "",   // Payhip — Shopify Automation Kit  $39
  dashboard:   "",   // Payhip — Shopify Profit Dashboard $12
  littleTalks: "",   // Payhip — Little Talks             $19
  liteDash:    "",   // MailerLite opt-in — Profit Dashboard Lite
  ltSampler:   "",   // MailerLite opt-in — 5 Free Conversations
  kitGumroad:  "",   // Gumroad mirror — kit
  ltGumroad:   ""    // Gumroad mirror — Little Talks
};
```

Any you leave empty become a mailto instead of a broken link, and the amber setup banner keeps reminding you. Once all seven are filled the banner disappears on its own.

**Point the three main buttons at Payhip, not Gumroad.** Gumroad Discover charges 30% on every sale of a listed product — including buyers you sent yourself. Gumroad is there for cold discovery traffic only; that 30% is an acquisition cost you're choosing to pay, and it's cheaper than any ad.
