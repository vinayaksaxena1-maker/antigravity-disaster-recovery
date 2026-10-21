---
trigger: always_on
description: Use only the skills needed for the current task; consult skill files on demand; avoid over-engineering.
---

## On-Demand Skills
- Har task par sabhi skills ko eagerly load ya consult mat karo.
- Jab task ke liye relevant ho, tabhi sabse relevant ek primary skill use karo.
- Supporting skill tabhi use karo jab task ka alag hissa uski zaroorat rakhta ho, jaise testing ya security review.
- Sirf selected skill ki SKILL.md padho; baaki skill files mat kholo.

## Pragmatic Engineering (Ponytail Ladder)
- **YAGNI**: Feature ya abstraction sach mein zaroori na ho toh bilkul mat banao.
- **Reuse**: Code likhne se pehle dekho kya project mein pehle se koi utility/pattern exist karta hai.
- **Stdlib & Native**: Hamesha language ki standard library ya platform native features ko preference do.
- **Zero Dependency Bloat**: Naya `npm` ya `pip` package tab tak install mat karo jab tak strictly impossible na ho.
- **Minimal Code**: Concise aur direct solution prefer karo; unnecessary design patterns ya boilerplate avoid karo.

## Graphify
- Graphify sirf codebase architecture, flow, visual map, cross-file connections ke sawaal par, ya user ke /graphify kehne par use karo.
- Normal feature edits, chhote scripts aur bug fixes mein Graphify mat chalao.

## Paperclip & Multi-Agent Boundaries
- **Context Isolation**: Paperclip (`D:\paperclip`) ke aantarik rules (`rules/*.mdc`) sirf Paperclip ke apne codebase ke liye hain.
- **User Project Sovereignty**: User ke projects (`D:\Sanatan_Watch`, etc.) par kaam karte waqt sirf user ke Pragmatic Engineering rules lagu honge (`src/`, `android/` safe rahenge).
- **Namespacing**: Paperclip ki management skills (`paperclip-*`) aur domain craftsmanship skills (`ui-ux-pro-max`, `flutter-expert`) alag-alag layers me rahengi, koi name collision nahi hoga.
- **Tool Reuse**: Paperclip alag se naye heavy tools install nahi karega; pehle se maujood system tools (Puppeteer, Git, Terminal) reuse karega.

## Token & Context Engineering Protocol
- **Sliced File Reads**: 500+ लाइन की पूरी फ़ाइल कभी मत खोलो; हमे़loud `StartLine`/`EndLine` देकर सिर्फ़ टारगेटेड 40–80 लाइनें पढ़ो।
- **Terminal Output Filtering**: टर्मिनल का भारी आउटपुट सीधे चैट में मत लाओ; हमेशा `-Tail 20` या `Select-String -Pattern "error|failed"` से फ़िल्टर करो।
- **Ghost Token Elimination**: जो फ़ाइल इस सेशन में पहले पढ़ चुके हो और वो बदली नहीं है, ऊसे दोबारा कभी मत पढ़ो।
- **Surgical Diffs**: कोड बदलते वक्त सिर्फ़ वही 5-10 लाइनें बदलो जहाँ बदलाव चाहिए; पूरी 300 लाइन की फ़ाइल को कभी दोबारा मत लिखो।
- **Observation Masking**: वेब पेज या बड़े JSON में से सिर्फ़ ज़रूरी सेलेक्टर या डेटा निकालो; कच्चा HTML/डेटा डंप मत करो।
- **Atomic Attention**: एक बार में सिर्फ़ एक सब-टास्क पर काम करो; पिछले टास्क के कच्चे लॉग्स को आगे मत खींचो।
- **Context Rot & Compaction**: जब बातचीत 15–20 स्टेप्स से लंबी हो जाए, तो यूज़र को तुरंत `/compact` सुझाओ ताकि AI की याददाश्त ताज़ा रहे।
- **Zero Fluff**: भूमिका और भाषणबाज़ी 100% बंद; सीधे बुलेट पॉइंट्स में काम की बात करो।
