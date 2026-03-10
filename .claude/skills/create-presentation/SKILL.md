---
name: create-presentation
description: Create an academic presentation using Gamma or PowerPoint. Builds structured slide outlines from research content, then generates the deck with appropriate visuals and formatting.
argument-hint: "[topic or paper path] [format: gamma|pptx] [type: conference|lecture|seminar]"
allowed-tools: ["Read", "Grep", "Glob", "Write", "Task", "Bash"]
---

# Create Academic Presentation

Build a professional academic presentation from research content, paper drafts, or topic descriptions. Supports both Gamma (web-based) and PowerPoint (.pptx) output.

**Input:** `$ARGUMENTS` — should include:
- **Content source:** A topic description, path to a paper/notes, or research question
- **Format:** `gamma` or `pptx` (default: gamma)
- **Type:** `conference` (15-20 min), `lecture` (50-75 min), or `seminar` (45-90 min) (default: conference)

---

## Steps

### Phase 1: Content Extraction
1. **If a paper/file is provided:** Read and extract key content:
   - Research question and motivation
   - Methodology/approach
   - Key results (tables, figures, statistics)
   - Main takeaways and implications
2. **If a topic is provided:** Structure the content logically

### Phase 2: Outline Creation
3. **Build a slide-by-slide outline** following presentation type conventions:

   **Conference Talk (15-20 min, ~12-15 slides):**
   - Title → Motivation (1-2) → Research Question → Literature (1) → Data/Method (2-3) → Results (3-4) → Robustness (1) → Conclusion → Thank You

   **Lecture (50-75 min, ~30-40 slides):**
   - Title → Learning Objectives → Motivation → Theory/Framework (5-8) → Examples (3-5) → Application (5-8) → Exercises/Discussion (2-3) → Summary → Next Time

   **Seminar (45-90 min, ~25-35 slides):**
   - Title → Motivation (2-3) → Literature (2-3) → Model/Theory (3-5) → Data (2-3) → Results (5-8) → Robustness (2-3) → Discussion → Conclusion

4. **Save outline** to `quality_reports/[PRESENTATION_NAME]_outline.md` for user review

### Phase 3: User Approval
5. **Present the outline** and ask for feedback before generating
6. **Iterate on outline** based on user input

### Phase 4: Generation
7. **For Gamma:** Use the Gamma MCP tool to generate the presentation
   - Pass the full outline as input text
   - Set appropriate format, card dimensions, and text options
   - Use `textMode: "generate"` to expand outline into full slides

8. **For PowerPoint:** Use the pptx skill to create the .pptx file
   - Create slides following the approved outline
   - Apply consistent formatting (fonts, colors, spacing)
   - Add speaker notes with key talking points

### Phase 5: Review
9. **Run /review-presentation** on the generated deck
10. **Present the review summary** with the deck link/file

---

## Slide Design Principles

### Text
- **Title slides:** 32pt+ font, bold
- **Body text:** 24pt+ font, max 6 bullet points per slide
- **Each bullet:** Aim for 6 words or fewer ("6x6 rule")
- **One main idea per slide**

### Visuals
- **Figures > Tables > Text** for presenting results
- All figures need titles, axis labels, and source notes
- Use consistent color scheme throughout
- High contrast for readability

### Structure
- **Signpost transitions:** "Now I'll turn to..." slide or header changes
- **Progressive disclosure:** Build complex ideas across 2-3 slides
- **Recap slides** every 15-20 minutes for lectures
- **Takeaway slide** before conclusions

### Academic Standards
- Cite sources on the slide where they're referenced
- Report effect sizes, not just significance
- Acknowledge limitations
- Include "Thank You / Questions" final slide with contact info

---

## Output

The skill produces:
1. A slide outline saved to `quality_reports/`
2. The generated presentation (Gamma URL or .pptx file)
3. A quality review of the generated deck
