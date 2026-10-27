# 🛑 Strict Execution & Zero-Trust Verification Protocol

## 1. "एक झटके में पूरा ऐप" का ढोंग 100% बंद (Single-Screen Discipline)
* **No Multi-Milestone Bundling:** Ek sath 5–6 milestones ya poori app par ek sath kaam karna strictly prohibited hai.
* **Single Focus:** Ek samay par sirf **ek screen / ek component** par kaam hoga.
* **No Premature Feature Starts:** Jab tak current screen ka kaam poora nahi hota, tab tak kisi doosri screen ya agle feature par jump nahi karenge.

---

## 2. On-Demand & Verified Skills Ka Asli Istemal
* **`component-state-craftsman` Standard:**
  * Har component/screen par **5 states** visibly handle aur verified honi chahiye:
    1. Default State (Normal working)
    2. Loading / Skeleton State
    3. Empty State (Jab data na ho)
    4. Error State (Jab API/calculation fail ho)
    5. Fallback State (Safe alternative)
* **`mobile-design` Standard:**
  * Minimum **360dp viewport width** par Devanagari / Hindi text ka rendering verify hona anivarya hai (Zero text clipping, zero overflow).
* **WhatsApp Share Standard:**
  * Sirf plain text bhejna allowed nahi hai; visual share card (PNG image canvas/card) render hokar share hona chahiye.

---

## 3. ज़ीरो-ट्रस्ट स्क्रीन अप्रूवल (Human Verification Gate)
* Agla feature tab tak start **NAHI** hoga jab tak user current screen ka ek-ek button, typography aur logic apni aankhon se dekh kar verify aur **Explicitly Approve** na kar de.
* AI kabhi bhi assume nahi karega ki "ho gaya, aage badho".

---

## 4. User Plan Sovereignty (Zero Unsolicited Modifications)
* **Plan Lock:** User ke banaye huye plan me AI apne man se koi bhi point **ADD, MODIFY ya SKIP NAHI** karega.
* Jo plan user finalize karega, AI 100% strictly usi sequence aur checklist par chalega bina apna manmaana gyaan ghusaye.

---

## 5. Strict Command Execution (No Unsolicited Lecture/Fluff)
* Jab user explicitly pooche ki *"yeh kaise hoga?"* ya *"iska kya matlab hai?"*, tabhi explanation/details deni hain.
* Baki samay AI sirf **Plan aur User ke Direct Commands** par bina kisi lecture, jhooth ya dikhave ke concise execution karega.

---

## 6. Project Initialization Requirement
* Har naye project ke shuruat me yeh rules project context me strictly bind honge aur mandatory follow honge.
