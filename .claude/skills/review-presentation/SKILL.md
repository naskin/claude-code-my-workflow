---
name: review-presentation
description: Review an academic presentation (PowerPoint or Gamma) for pedagogical quality, visual design, narrative arc, cognitive load, and content accuracy. Produces a structured report.
argument-hint: "[path to .pptx file, Gamma URL, or 'outline' to review slide outline text]"
allowed-tools: ["Read", "Grep", "Glob", "Write", "Task"]
---

# Review Academic Presentation

Launch the presentation-reviewer agent on a slide deck to produce a comprehensive quality report covering narrative arc, cognitive load, visual design, academic rigor, and audience appropriateness.

**Input:** `$ARGUMENTS` — one of:
- Path to a `.pptx` file (will be read and analyzed)
- A Gamma presentation URL (will be fetched and analyzed)
- The word "outline" followed by a file path — reviews a text outline/draft of slides

---

## Steps

1. **Identify the presentation to review:**
   - If `$ARGUMENTS` is a `.pptx` file path: read the file using the pptx skill
   - If `$ARGUMENTS` is a URL: fetch the presentation content
   - If `$ARGUMENTS` starts with "outline": read the referenced text file as a slide plan

2. **Extract slide content:**
   - Get the text content of each slide (title, body, speaker notes)
   - Note the total slide count and estimate presentation duration (1-2 min/slide)
   - Identify slide types (title, content, figure, table, transition, conclusion)

3. **Launch the presentation-reviewer agent** to evaluate across 5 lenses:
   - Lens 1: Narrative Arc & Flow
   - Lens 2: Cognitive Load & Pacing
   - Lens 3: Visual Design & Consistency
   - Lens 4: Academic Rigor
   - Lens 5: Audience Appropriateness

4. **Save the review report** to `quality_reports/[PRESENTATION_NAME]_review.md`

5. **Present summary** to the user:
   - Overall assessment (EXCELLENT / GOOD / NEEDS WORK / MAJOR ISSUES)
   - Top 3 strengths
   - Top 3 improvements needed
   - Priority action items

---

## Review Criteria Highlights

### For Conference Talks (15-20 min)
- Max ~15 content slides + title/thank you
- Strong hook in first 2 slides
- One clear takeaway message
- Results should be visually dominant

### For Lecture Slides (50-75 min)
- Pacing variety (theory → example → exercise → recap)
- Progressive disclosure of complex ideas
- Recap/checkpoint slides every 15-20 minutes
- Clear learning objectives stated early

### For Job Market / Seminar Talks (45-90 min)
- Literature positioning in first 5 minutes
- Identification/methodology explained clearly
- Robustness shown but not belabored
- Strong conclusion with broader implications

---

## Principles

- **Be constructive.** Every criticism includes a concrete fix.
- **Be specific.** Reference exact slide numbers.
- **Respect the medium.** PowerPoint/Gamma conventions differ from LaTeX — don't impose LaTeX standards.
- **Prioritize impact.** Focus on changes that most improve audience comprehension.
