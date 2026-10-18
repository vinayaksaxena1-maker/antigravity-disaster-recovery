---
name: vedic-astronomy-math
description: High-precision Vedic astronomy and Jyotish mathematical engine algorithms. Covers spherical astronomy, Lahiri ayanamsha, house cusps (Sripati/Placidus), Shodashvarga (D1-D60), Shadbala virupas, Ashtakavarga 337-sum invariants, Vimshottari/Yogini dasha hierarchies, 36 Guna Milan, and classical BPHS yogas under clean-room MIT/JPL principles.
---

# Vedic Astronomy & Jyotish Mathematical Engine Specification

## 1. Executive Directive & Architectural Principles

### Clean-Room Engineering (GPL & Legal Immunity)
* **Zero GPL Dependencies:** Do NOT use or link to `libswe`, `pyswisseph`, or Swiss Ephemeris C binaries in production code. 
* **Permissive Stack:** Use MIT-licensed JPL DE405 orbital models (such as `astronomy-engine` by Don Cross) for planetary longitudes, or pure analytical orbital expansions (VSOP87/ELP2000).
* **Vedic Public Domain Invariants:** Classical Jyotish formulas (from *Brihat Parashara Hora Shastra*, *Surya Siddhanta*, and *Jaimini Sutras*) are ancient mathematical rules in the public domain. Implement them in pure, modular TypeScript/JavaScript without borrowing third-party proprietary code.
* **Factual Benchmarking:** Test outputs against precomputed astronomical tables (e.g., `swiss_golden_baseline.json`) as factual ground truth without incorporating copyrightable code.

---

## 2. Spherical Astronomy & Coordinate Conversions

### 2.1 Time Foundations
* **Julian Day ($JD$):**
  For Gregorian date $(Y, M, D, \text{UT})$:
  $$JD = \lfloor 365.25(Y + 4716) \rfloor + \lfloor 30.6001(M + 1) \rfloor + D + B - 1524.5 + \frac{\text{UT}}{24}$$
  where $B = 2 - \lfloor Y/100 \rfloor + \lfloor \lfloor Y/100 \rfloor / 4 \rfloor$ if $JD > 2299160.5$.
* **Julian Centuries from J2000.0 ($T$):**
  $$T = \frac{JD - 2451545.0}{36525}$$
* **Greenwich Mean Sidereal Time ($GMST$ in degrees):**
  $$GMST = 280.46061837 + 360.98564736629 \times (JD - 2451545.0) + 0.000387933 T^2 - \frac{T^3}{38710000} \pmod{360^\circ}$$
* **Right Ascension of Midheaven (RAMC):**
  $$RAMC = (GMST + \text{Longitude}_{\text{East}}) \pmod{360^\circ}$$

### 2.2 True Obliquity of the Ecliptic ($\epsilon$)
* Mean obliquity ($\epsilon_0$):
  $$\epsilon_0 = 23^\circ 26' 21.448'' - 46.8150'' T - 0.00059'' T^2 + 0.001813'' T^3$$
* True obliquity $\epsilon = \epsilon_0 + \Delta\epsilon$ (where $\Delta\epsilon$ is the nutation in obliquity).

### 2.3 Ascendant (Lagna) Calculation
* Formula for Tropical Ascendant ($\lambda_{\text{asc, trop}}$):
  $$\tan(\lambda_{\text{asc, trop}}) = \frac{\cos(RAMC)}{-\sin(RAMC)\cos(\epsilon) - \tan(\phi)\sin(\epsilon)}$$
  where $\phi$ is the geographic latitude.
* **Quadrant Normalization:** Compute using `atan2(y, x)`:
  $$y = \cos(RAMC)$$
  $$x = -\sin(RAMC)\cos(\epsilon) - \tan(\phi)\sin(\epsilon)$$
  $$\lambda = \text{atan2}(y, x) \pmod{360^\circ}$$
* **Midheaven (MC):**
  $$\tan(\lambda_{\text{MC}}) = \frac{\tan(RAMC)}{\cos(\epsilon)}$$

---

## 3. Ayanamsha Systems (Tropical to Sidereal)

* **General Transformation:**
  $$\lambda_{\text{sidereal}} = (\lambda_{\text{tropical}} - \text{Ayanamsha}) \pmod{360^\circ}$$
* **Lahiri (Chitra Paksha / Official Indian Ephemeris):**
  * Epoch J2000.0 Value: $23^\circ 51' 11.23''$ ($23.853119^\circ$).
  * Precession Rate: $50.290966''$ per Julian year.
  * Formula:
    $$\text{Ayanamsha}_{\text{Lahiri}} = 23.853119 + 0.0139697 \times T + 0.0003086 \times T^2$$
  * Verification Anchor: The star Spica (Chitra Nakshatra) must lie at exactly $180^\circ 00' 00''$ ($\pm 1''$).
* **KP (Krishnamurti Padhdhati):**
  $$\text{Ayanamsha}_{\text{KP}} = \text{Ayanamsha}_{\text{Lahiri}} - 0^\circ 05' 54''$$
* **Raman Ayanamsha:**
  $$\text{Ayanamsha}_{\text{Raman}} = 21.01524 + 1.39811 \times T$$

---

## 4. House Cusps (Bhava Sandhi & Madhya)

### 4.1 Sripati System (Porphyry Quadrant Trisection)
* **Ascendant:** Cusp of 1st House (Lagna Bhava Madhya).
* **Midheaven:** Cusp of 10th House (MC Bhava Madhya).
* **Quadrant Trisection:**
  * Quadrant 1 (Houses 10, 11, 12, 1):
    $$\text{Span}_1 = (\lambda_{\text{Lagna}} - \lambda_{\text{MC}} + 360^\circ) \pmod{360^\circ}$$
    $$\text{House 11 Madhya} = (\lambda_{\text{MC}} + \text{Span}_1 / 3) \pmod{360^\circ}$$
    $$\text{House 12 Madhya} = (\lambda_{\text{MC}} + 2 \times \text{Span}_1 / 3) \pmod{360^\circ}$$
  * Quadrant 2 (Houses 1, 2, 3, 4):
    $$\text{Span}_2 = (\lambda_{\text{IC}} - \lambda_{\text{Lagna}} + 360^\circ) \pmod{360^\circ}$$
    $$\text{House 2 Madhya} = (\lambda_{\text{Lagna}} + \text{Span}_2 / 3) \pmod{360^\circ}$$
    $$\text{House 3 Madhya} = (\lambda_{\text{Lagna}} + 2 \times \text{Span}_2 / 3) \pmod{360^\circ}$$
  * Oppositions: Houses 4, 5, 6, 7, 8, 9 are exactly $180^\circ$ opposite to 10, 11, 12, 1, 2, 3.
* **Bhava Sandhi (House Junctions):**
  $$\text{Sandhi}_i = \frac{\text{Madhya}_i + \text{Madhya}_{i+1}}{2} \pmod{360^\circ}$$

### 4.2 Equal House & Whole Sign
* **Equal House:** $\text{Cusp}_i = (\lambda_{\text{Lagna}} + (i - 1) \times 30^\circ) \pmod{360^\circ}$.
* **Whole Sign (Parashari Rashi Bhava):** House $i$ corresponds entirely to $\text{Sign}(\text{Lagna}) + (i - 1)$.

---

## 5. Shodashvarga: 16 Divisional Charts Engine

For a sidereal planetary longitude $\lambda$ ($0^\circ \le \lambda < 360^\circ$):
* Sign index: $S = \lfloor \lambda / 30^\circ \rfloor$ ($0 = \text{Aries}, \dots, 11 = \text{Pisces}$).
* Position in sign: $\theta = \lambda \pmod{30^\circ}$.

| Varga | Division | Span ($\theta$) | Mapping Algorithm |
| :--- | :--- | :--- | :--- |
| **D1** (Rashi) | $1$ | $30^\circ$ | $S_{\text{D1}} = S$ |
| **D2** (Hora) | $2$ | $15^\circ$ | Odd sign: $\theta < 15^\circ \to \text{Leo (Sun, 4)}$, else $\text{Cancer (Moon, 3)}$.<br>Even sign: $\theta < 15^\circ \to \text{Cancer}$, else $\text{Leo}$. |
| **D3** (Drekkana) | $3$ | $10^\circ$ | Part $k = \lfloor \theta / 10^\circ \rfloor \in \{0, 1, 2\}$.<br>$S_{\text{D3}} = (S + 4k) \pmod{12}$ (1st, 5th, 9th triplicity). |
| **D4** (Chaturthamsha) | $4$ | $7^\circ 30'$ | Part $k = \lfloor \theta / 7.5^\circ \rfloor \in \{0..3\}$.<br>$S_{\text{D4}} = (S + 3k) \pmod{12}$ (Kendra triplicity). |
| **D7** (Saptamsha) | $7$ | $4^\circ 17' 8.57''$ | Part $k = \lfloor \theta / (30/7)^\circ \rfloor \in \{0..6\}$.<br>Odd sign: $S_{\text{D7}} = (S + k) \pmod{12}$.<br>Even sign: $S_{\text{D7}} = (S + 6 + k) \pmod{12}$ (starts from 7th). |
| **D9** (Navamsha) | $9$ | $3^\circ 20'$ ($200'$) | Pada $k = \lfloor \theta / 3.333333^\circ \rfloor \in \{0..8\}$.<br>Fire signs (0,4,8): start Aries (0).<br>Earth signs (1,5,9): start Capricorn (9).<br>Air signs (2,6,10): start Libra (6).<br>Water signs (3,7,11): start Cancer (3).<br>$S_{\text{D9}} = (S_{\text{start}} + k) \pmod{12}$. |
| **D10** (Dashamsha) | $10$ | $3^\circ 00'$ | Part $k = \lfloor \theta / 3^\circ \rfloor \in \{0..9\}$.<br>Odd sign: $S_{\text{D10}} = (S + k) \pmod{12}$.<br>Even sign: $S_{\text{D10}} = (S + 8 + k) \pmod{12}$ (starts from 9th). |
| **D12** (Dwadashamsha) | $12$ | $2^\circ 30'$ | Part $k = \lfloor \theta / 2.5^\circ \rfloor \in \{0..11\}$.<br>$S_{\text{D12}} = (S + k) \pmod{12}$ (starts from own sign). |
| **D16** (Shodashamsha) | $16$ | $1^\circ 52' 30''$ | Movable: starts Aries (0); Fixed: starts Leo (4); Dual: starts Sagittarius (8). |
| **D20** (Vimshamsha) | $20$ | $1^\circ 30'$ | Movable: Aries; Fixed: Sagittarius; Dual: Leo. |
| **D24** (Chaturvimshamsha) | $24$ | $1^\circ 15'$ | Odd sign: starts Leo (4); Even sign: starts Cancer (3). |
| **D27** (Saptavimshamsha) | $27$ | $1^\circ 06' 40''$ | Fire: Aries; Earth: Cancer; Air: Libra; Water: Capricorn. |
| **D30** (Trimshamsha) | $30$ | Variable | Odd signs: $0-5^\circ$ Mars (0), $5-10^\circ$ Saturn (10), $10-18^\circ$ Jupiter (8), $18-25^\circ$ Mercury (2), $25-30^\circ$ Venus (1).<br>Even signs: reversed order and signs (Venus, Mercury, Jupiter, Saturn, Mars). |
| **D40** (Khavedamsha) | $40$ | $0^\circ 45'$ | Odd signs: start Aries (0); Even signs: start Libra (6). |
| **D45** (Akshavedamsha) | $45$ | $0^\circ 40'$ | Movable: Aries (0); Fixed: Leo (4); Dual: Sagittarius (8). |
| **D60** (Shashtiamsha) | $60$ | $0^\circ 30'$ ($30'$) | Part $k = \lfloor \theta / 0.5^\circ \rfloor \in \{0..59\}$.<br>Odd signs: $S_{\text{D60}} = (S + k) \pmod{12}$.<br>Even signs: $S_{\text{D60}} = (S + k + 6) \pmod{12}$.<br>Also assign 60 specific deities (Ghora, Rakshasa, Deva, Kubera, etc.). |

* **Vargottama Rule:** If $S_{\text{D1}} == S_{\text{D9}}$, the planet/ascendant is **Vargottama** (exceedingly auspicious, acts as if in own sign).

---

## 6. Shadbala (Six-Fold Planetary Potency)

Total strength in **Virupas** ($60 \text{ Virupas} = 1 \text{ Rupa}$).

### Standard Minimum Strength Thresholds
* Sun: $390$ virupas ($6.5$ rupas)
* Moon: $360$ virupas ($6.0$ rupas)
* Mars: $300$ virupas ($5.0$ rupas)
* Mercury: $420$ virupas ($7.0$ rupas)
* Jupiter: $390$ virupas ($6.5$ rupas)
* Venus: $330$ virupas ($5.5$ rupas)
* Saturn: $300$ virupas ($5.0$ rupas)

### 6.1 Sthana Bala (Positional Strength)
1. **Uccha Bala:** $60 \times (1 - \frac{|\lambda - \text{Neecha}|}{180^\circ})$, range $[0, 60]$ virupas.
2. **Saptavargiya Bala:** Sum of dignities in D1, D2, D3, D7, D9, D12, D30:
   * Moolatrikona: 45 virupas
   * Own Sign (Swakshetra): 30 virupas
   * Great Friend (Adhi Mitra): 22.5 virupas
   * Friend (Mitra): 15 virupas
   * Neutral (Sama): 7.5 virupas
   * Enemy (Shatru): 3.75 virupas
   * Bitter Enemy (Adhi Shatru): 1.875 virupas
3. **Ojhayugma Bala:** Sign & Navamsha odd/even gender strength (15 virupas if Moon/Venus in even, others in odd).
4. **Kendradi Bala:** Kendra (1,4,7,10) = 60 virupas; Panaphara (2,5,8,11) = 30 virupas; Apoklima (3,6,9,12) = 15 virupas.
5. **Drekkana Bala:** 15 virupas based on decanate ruler masculinity/femininity.

### 6.2 Dig Bala (Directional Strength)
* Jupiter & Mercury strongest in East (1st House):
  $$\text{DigBala} = 60 - \frac{|\text{Bhava} - 1| \times 60}{6}$$
* Sun & Mars strongest in South (10th House).
* Saturn strongest in West (7th House).
* Moon & Venus strongest in North (4th House).

### 6.3 Kaala Bala (Temporal Strength)
* **Nathonnatha Bala:** Diurnal planets (Sun, Jupiter, Venus) gain strength during daytime; nocturnal (Moon, Mars, Saturn) gain at night. Mercury always gains 60 virupas.
* **Paksha Bala:** Benefics gain in Shukla Paksha, malefics in Krishna Paksha:
  $$\text{PakshaBala} = \frac{|\lambda_{\text{Moon}} - \lambda_{\text{Sun}}|}{180^\circ} \times 60$$
* **Tribhaga Bala:** 60 virupas assigned to lords of day/night thirds.
* **Abda, Masa, Vara, Hora Bala:** Planetary rulers of current Year (15), Month (30), Day (45), and Planetary Hour (60).
* **Ayana Bala:** Declination ($\delta$) dependent value up to 60 virupas.

### 6.4 Chesta Bala (Motional Strength)
* Dependent on planetary velocity and retrograde state:
  * Vakra (Retrograde): 60 virupas
  * Anuvakra (Direct after stationary): 30 virupas
  * Vikala (Stationary): 15 virupas
  * Mandatara/Manda (Slow): 30 virupas
  * Sheegratara (Fast): 45 virupas

### 6.5 Naisargika Bala (Natural Inherent Strength)
Fixed classical constants:
* Sun: $60.00$ virupas
* Moon: $51.43$ virupas
* Venus: $42.86$ virupas
* Jupiter: $34.29$ virupas
* Mercury: $25.71$ virupas
* Mars: $17.14$ virupas
* Saturn: $8.57$ virupas

### 6.6 Drik Bala (Aspectual Strength)
* Aspect value based on elongation $\Delta\theta = (\lambda_{\text{aspecting}} - \lambda_{\text{aspected}} + 360^\circ) \pmod{360^\circ}$.
* Full drishti at $180^\circ$ (60 virupas). Special aspects for Mars ($90^\circ, 210^\circ$), Jupiter ($120^\circ, 240^\circ$), Saturn ($60^\circ, 270^\circ$).

---

## 7. Ashtakavarga Engine

### 7.1 Invariant Rules
* 8 Bhinnashtakavarga (BAV) tables: Sun, Moon, Mars, Mercury, Jupiter, Venus, Saturn, and Lagna.
* **Sarvashtakavarga (SAV) Invariant:**
  $$\sum_{h=1}^{12} \text{SAV}_h \equiv 337$$
  Any implementation returning $\ne 337$ has a fatal bug.
* Average points per house $= 337 / 12 \approx 28.08$. Houses with $\ge 28$ points are auspicious; $< 25$ indicate struggle.

### 7.2 Shodhana (Reductions)
1. **Trikona Shodhana (Trinal Reduction):**
   * Groups: Fire (1, 5, 9), Earth (2, 6, 10), Air (3, 7, 11), Water (4, 8, 12).
   * Find minimum value $m = \min(R_1, R_2, R_3)$ in the trine.
   * Subtract $m$ from each: $R_i \leftarrow R_i - m$.
   * Exception: If any sign in the trine is 0, special BPHS reduction rules apply.
2. **Ekadhipatya Shodhana (Dual Rulership Reduction):**
   * Apply to pairs ruled by same planet: Mars (1 & 8), Mercury (3 & 6), Jupiter (9 & 12), Venus (2 & 7), Saturn (10 & 11).
   * Sun (5) and Moon (4) are single-sign rulers and exempt.
   * If both signs have planets, or both are occupied, no reduction.
   * If one sign is occupied and one unoccupied, unoccupied reduced according to occupant's count.
3. **Shodhya Pinda:**
   $$\text{Shodhya Pinda} = \text{Rashi Pinda} + \text{Graha Pinda}$$
   Calculated by multiplying reduced points by planetary and sign multipliers.

---

## 8. Dasha Systems Engine

### 8.1 Vimshottari Dasha (120 Years)
* **Sequence & Period:**
  Ketu (7), Venus (20), Sun (6), Moon (10), Mars (7), Rahu (18), Jupiter (16), Saturn (19), Mercury (17). Total = 120 years.
* **Birth Dasha Balance:**
  Let Moon's sidereal longitude be $\lambda_{\text{Moon}}$.
  * Nakshatra index $N = \lfloor \lambda_{\text{Moon}} / (13^\circ 20') \rfloor \in [0, 26]$.
  * Position within Nakshatra: $\Delta = \lambda_{\text{Moon}} \pmod{13^\circ 20'}$.
  * Dasha Lord: $\text{Lords}[N \pmod 9]$.
  * Fraction remaining:
    $$\text{Balance Fraction} = 1 - \frac{\Delta}{13^\circ 20'} = \frac{13.333333^\circ - \Delta}{13.333333^\circ}$$
  * Initial Balance Years:
    $$\text{Years}_{\text{balance}} = \text{Balance Fraction} \times \text{TotalYears}(\text{Lord})$$
* **Sub-Period Multiplier Hierarchy:**
  * Antardasha (AD): $\text{Years}_{\text{AD}} = \frac{\text{Years}_{\text{MD}} \times \text{Years}_{\text{Lord}}}{120}$.
  * Pratyantardasha (PD): $\text{Years}_{\text{PD}} = \frac{\text{Years}_{\text{AD}} \times \text{Years}_{\text{Lord}}}{120}$.
  * Sookshmadasha (SD): $\text{Years}_{\text{SD}} = \frac{\text{Years}_{\text{PD}} \times \text{Years}_{\text{Lord}}}{120}$.

### 8.2 Yogini Dasha (36 Years)
* Cycle: Mangala (Moon, 1), Pingala (Sun, 2), Dhanya (Jupiter, 3), Bhramari (Mars, 4), Bhadrika (Mercury, 5), Ulka (Saturn, 6), Siddha (Venus, 7), Sankata (Rahu, 8). Total = 36 years.
* Starting Yogini: $(N + 3) \pmod 8$ from Ashwini.

---

## 9. Kundli Milan (36 Gunas Ashtakoot Matching)

Comparing Groom's Moon Nakshatra ($N_1$) & Rashi ($R_1$) with Bride's ($N_2, R_2$):

| Koota | Max Points | Evaluation Logic |
| :--- | :--- | :--- |
| **Varna** | 1 | Brahmin (Water: 4,8,12) > Kshatriya (Fire: 1,5,9) > Vaishya (Earth: 2,6,10) > Shudra (Air: 3,7,11). Groom $\ge$ Bride = 1, else 0. |
| **Vashya** | 2 | Quadruped, Human, Water, Wild, Insect compatibility matrix. |
| **Tara** | 3 | Compute counts $C_1 = ((N_2 - N_1 + 27) \bmod 9)$ and $C_2 = ((N_1 - N_2 + 27) \bmod 9)$. If both are odd (Naidhana, Pratyak, Vipat) = 0, one odd = 1.5, both auspicious = 3. |
| **Yoni** | 4 | 14 Animal archetypes. Same animal = 4, Friendly = 3, Neutral = 2, Inimical = 1, Sworn enemies (Cow-Tiger, Elephant-Lion, Horse-Buffalo, Snake-Mongoose, Cat-Rat, Dog-Hare, Monkey-Sheep) = 0. |
| **Graha Maitri** | 5 | Natural & Panchadha friendship between Moon sign rulers: Friend-Friend = 5, Friend-Neutral = 4, Neutral-Neutral = 3, Friend-Enemy = 1, Enemy-Enemy = 0. |
| **Gana** | 6 | Deva, Manushya, Rakshasa. Deva-Deva = 6, Deva-Manushya = 5, Manushya-Manushya = 6, Rakshasa with Deva/Manushya = 0 (unless Gana Dosha cancelled). |
| **Bhakoot** | 7 | Moon sign distance: 2-12, 6-8 (Shadashtaka), 9-5 = 0 points (Bhakoot Dosha); 1-1, 3-11, 4-10, 7-7 = 7 points. Cancelled if sign lords are friends. |
| **Nadi** | 8 | Adi, Madhya, Antya. Different Nadi = 8 points. Same Nadi = 0 points (Nadi Dosha). Cancelled if same Nakshatra but different Pada, or different Nakshatra in same sign. |
| **Total** | **36** | $\ge 18$: Auspicious; $24-32$: Highly Recommended; $< 18$: Incompatible. |

---

## 10. Classical Yogas & Dosha Rules

* **Pancha Mahapurusha Yogas:** Non-luminary planet in Kendra in exaltation or own sign:
  * Mars $\to$ Ruchaka; Mercury $\to$ Bhadra; Jupiter $\to$ Hamsa; Venus $\to$ Malavya; Saturn $\to$ Sasa.
* **Gaja Kesari Yoga:** Jupiter in Kendra (1, 4, 7, 10) from Moon, free from malefic combustion.
* **Budhaditya Yoga:** Sun and Mercury conjunct in same sign (separation $> 3^\circ$ to prevent total combustion).
* **Viparita Raja Yogas:** Dusthana lords (6, 8, 12) placed in other dusthanas without benefic conjunction:
  * 6th lord in 8th/12th $\to$ Harsha Yoga
  * 8th lord in 6th/12th $\to$ Sarala Yoga
  * 12th lord in 6th/8th $\to$ Vimala Yoga
* **Mangal Dosha (Kuja Dosha):** Mars in 1st, 2nd, 4th, 7th, 8th, or 12th house from Lagna, Moon, or Venus.
  * **Classical Cancellations (Parihara):**
    1. Mars in Aries in 1st, Scorpio in 4th, Capricorn in 7th, Sagittarius in 8th, Pisces in 12th.
    2. Conjunction with Jupiter or Moon.
    3. Both partners have equivalent Mangal Dosha.
    4. Saturn in 1st, 4th, 7th, 8th, or 12th balances the native.
* **Shani Sade Sati:** Saturn transiting within $45^\circ$ behind or ahead of natal Moon (12th, 1st, 2nd sign from Moon). 3 phases of $\approx 2.5$ years each ($7.5$ years total). Kantaka Shani: 4th house transit; Ashtama Shani: 8th house transit.
