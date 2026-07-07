---
name: text-make-business-effective
description: Transform text into effective business communication for upper management updates. User-invoked skill (/text-make-business-effective) that rewrites content to use absolute references (specific dates, teams, numbers), avoid jargon/acronyms/weasel words/peacock words, be data-driven with concrete metrics, and cite sources. Ensures clear, verifiable, and professional business writing.
---

# Business-Effective Communication

Rewrite user-provided text to be more effective for business communication and upper management updates.

## Core Task

Transform text by applying rigorous business communication standards that prioritize clarity, specificity, and verifiable information.

## Transformation Rules

### 1. Use Absolute References

Replace vague temporal and organizational references with specific details.

**Time references:**
- Don't: "next week", "last month", "recently"
- Do: "2025-04-30", "on 2025-03-18", "between February and March 2025"

**Team/group references:**
- Don't: "we", "the team", "they"
- Do: "The PTP Leads group", "The Engineering team", "Customer Success"

### 2. Avoid Jargon & Acronyms

Spell out acronyms on first use, then include the acronym in parentheses.

- Don't: "Freelancers have to sign an NDA"
- Do: "Freelancers have to sign a Non Disclosure Agreement (NDA)"

### 3. Eliminate Weasel Words

Replace vague qualifiers with specific, quantifiable information.

**Weasel words:** "some", "often", "might", "many", "several", "urgent", "frequently", "various"

- Don't: "We often had this bug, it impacted many clients. It's urgent to fix it."
- Do: "We had this bug 3 times in July 2020, it impacted 301 users across 12 companies."

### 4. Eliminate Peacock Words

Remove promotional language that lacks verifiable information. Replace with specific, technical details.

**Peacock words:** "outstanding", "most innovative", "world-class", "cutting-edge", "best-in-class", "well-crafted"

- Don't: "Spendesk detects fraud using the most innovative machine learning techniques."
- Do: "Spendesk detects fraud using a combination of random forest regression and recurrent neural networks."

### 5. Be Data-Driven

Provide concrete data and metrics instead of subjective interpretations. Let readers draw their own conclusions.

- Don't: "All customers were impacted by a major issue during this event. We lost a lot of money. Hopefully, we fixed the main problem really quickly."
- Do: "10,400 customers couldn't complete a purchase for 2h13 due to a server failure introduced by a code change, resulting in an estimated loss of $50,000 (+/- 4%)."

### 6. Cite Sources

Include specific sources for claims, data, and statistics with references.

- Don't: "Slack messages increased by +25% during the lockdown"
- Do: "Slack messages increased by +25% between February and March 2020 as published in Slack blog post (1)"

Add numbered references at the end of the rewritten text if sources are mentioned.

## Output Format

Present only the rewritten text with clear separation from any explanatory comments.

Do NOT use block quotes for the generated text.

## Workflow

1. Read and understand the original text
2. Identify which rules apply (absolute refs, weasel/peacock words, missing data, etc.)
3. Rewrite by applying all applicable transformation rules
4. Verify all claims are specific, quantifiable, and sourced
5. Present the rewritten version
