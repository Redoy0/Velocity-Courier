# SCPMS — Thesis Progress Report

**Design and Implementation of a Smart Courier and Parcel Management System**
Sharmin Khatun (2223081010) · Tasnim Jahan Mim (2221081138)
Supervised by Pranta Banik, Lecturer, Dept. of CSE, Uttara University
Report date: 21 July 2026

> Purpose: a short, defense-ready status summary — what is built, what makes it different from existing courier platforms, and the timeline behind the progress. Full technical detail lives in `PROJECT_REPORT.md` and `FINAL_THESIS_REPORT.md`.

---

## 1. Status at a Glance

| Module | Status | Evidence |
| --- | --- | --- |
| Auth & role-based access (Customer / Agent / Admin) | Completed | JWT + bcrypt, `middleware/auth.js`, `auth.controller.js` |
| Parcel booking & lifecycle state machine | Completed | 6-state flow enforced in `parcel.controller.js` |
| Agent assignment & dispatch | Completed | Admin-only `PATCH /parcels/:id/assign` |
| Real-time tracking (Socket.IO) | Completed | Room-scoped `parcel:<id>` / `user:<id>` events, throttled live agent location |
| Map visualization | Completed | Leaflet + OpenStreetMap + Routing Machine, Bangladesh-context geocoding |
| Public tracking portal | Completed | `PublicTrack.jsx`, lookup by tracking code, no login required |
| QR-assisted pickup/delivery verification | Completed | `qrcode` (generate) + `@zxing` (scan), scan-matched confirmation |
| Email notifications | Pending | Nodemailer, best-effort, non-blocking on status change |
| Analytics dashboard + CSV/PDF export | Pending | `analytics.controller.js`, PDFKit, csv-writer |
| Bilingual UI (English/Bengali) | Pending | `LanguageContext`, `translations/en.js`, `translations/bn.js` |
| Deployment | Pending | Backend on Render, frontend build configured via `render.yaml` / `.env.production` |
| Written thesis (full chapters, diagrams, defense deck) | Drafted | `FINAL_THESIS_REPORT.md`, `PRESENTATION_CONTENT.md` |
| Measured (non-estimated) performance benchmarks | Pending | Current figures are marked "estimated for demonstration" |
| Delay prediction / route optimization / SMS / mobile app | Pending | Out of current scope, documented in Ch. 6 |

**Bottom line:** the seven core engineering modules — authentication, booking, assignment, real-time tracking, map visualization, public tracking, and QR verification — are complete. Notifications, analytics/reporting, bilingual UI, and deployment hardening remain pending, and the written thesis is in drafted form pending final review.

---

## 2. What Makes SCPMS Different

Courier tracking in practice — including the platforms most reviewers will already know — tends to fall into one of a few buckets: national carriers with scan-event status pages, regional apps with a consignment-ID timeline, academic GPS/IoT rigs that need dedicated hardware, or baseline student FYPs with a manual refresh button. None of them combine **continuous live tracking**, **multi-role dashboards**, **scan-verified handoff**, and **exportable analytics** in one openly evaluable, browser-only system.

| Dimension | Sundarban / Pathao / Steadfast (regional) | Typical baseline FYP | **SCPMS** |
| --- | --- | --- | --- |
| Tracking | Status-timeline by consignment ID | Manual refresh, no live state | **Live map via Socket.IO**, room-scoped |
| Role separation | Customer lookup only | Admin + customer, at most | **Customer / Agent / Admin**, each server-enforced |
| Delivery proof | Signature/OTP at door | None | **QR scan-matched** pickup + delivery |
| Analytics | Internal, not exposed | Rarely present | **Dashboard + CSV/PDF export** |
| Deployment cost | N/A (established infra) | Low | **Low** — browser-only, no dedicated hardware |
| Architecture openly evaluable | No (proprietary) | Yes | **Yes** |

The differentiator is not any single feature — QR verification and live maps both exist elsewhere — it's that SCPMS is the only system in this comparison set that ships **all four** together, with server-side role enforcement rather than a cosmetic UI split. Full methodology and caveats: `FINAL_THESIS_REPORT.md §2.1.5–2.3`.

---

## 3. Timeline — How the Progress Was Achieved

| Phase | Key Milestones | Period |
| --- | --- | --- |
| **1. Planning & Gap Analysis** | Courier workflow study, role decomposition, literature/regional-platform review | Weeks 1–2 |
| **2. Design** | User/Parcel schema design, ER/use-case/sequence/activity diagrams, UI wireframes | Weeks 3–4 |
| **3. Core Development** | Repo bootstrapped (`Initial commit`, 13 Dec 2025); auth, booking, and dashboard scaffolding | 13 Dec 2025 |
| | QR pickup flow, favicon/branding, agent-tracking filters, Socket.IO fixes, throttled live-location + distance checks, Bangladesh-aware geocoding | 13–18 Dec 2025 |
| **4. Hardening & Deployment Fixes** | Registration validation fixes, README/URL corrections, Socket.IO CORS fix for production origin | 17 Dec 2025 – 7 Jan 2026 |
| **5. Documentation & Defense Preparation** | Full thesis write-up (`FINAL_THESIS_REPORT.md`), gap analysis vs. named regional platforms, presentation deck (`PRESENTATION_CONTENT.md`), report/README rebrand to SCPMS | Ongoing, current |
| **6. Remaining: Final Evaluation** | Replace estimated metrics with measured benchmarks, finalize slide deck figures, rehearse defense Q&A | Before defense date |

Development moved fast because scope was fixed early (Section 1.6 of the thesis draws an explicit in-scope/out-of-scope line) and features were built and manually verified incrementally — auth → booking → tracking → QR → notifications → analytics — rather than as one large integration at the end.

---

## 4. Immediate Next Steps

1. Run the deployed system against real test batches and replace "estimated for demonstration" figures (booking success rate, test pass ratio, API latency) with measured numbers.
2. Capture the screenshot/figure placeholders listed in `FINAL_THESIS_REPORT.md` (dashboards, QR flow, PDF report sample).
3. Fill remaining administrative placeholders (student ID formatting, defense date) and do a final read-through pass on `FINAL_THESIS_REPORT.md`.
4. Rehearse the 16-slide deck (`PRESENTATION_CONTENT.md`) against the anticipated panel questions already drafted in Slide 16 notes.
