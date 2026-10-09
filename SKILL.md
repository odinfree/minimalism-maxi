---
name: minimalism-maxi
description: Cut designs, interfaces, slides, menus, pricing pages, emails, posts and talks down to the few elements people can actually process, and justify the cut with real evidence (Reutskaja/Camerer 2018 choice-overload fMRI, Iyengar & Lepper 2000 jam study, Hick's law, Cowan/Miller working-memory limits, cognitive load theory, Kastner clutter competition). Use this whenever the user wants something simpler, shorter, cleaner, less cluttered, "minimal", "too busy", "too many options/buttons/words/slides", asks how many items to show, wants to argue for fewer features, or wants to quote "the brain" or "science" on clutter. Also use it to fact-check any "too many elements hurts the brain / activates the pain center" claim before it goes out. Trigger even when the user does not say "minimalism".
license: MIT
metadata:
  version: 1.0.0
  owner: Oli (self-described minimalism maxi)
  companions: stop-slop (prose), oli-voice (first-person), tony-audit (critique pass)
  canonical: https://github.com/odinfree/minimalism-maxi
---

# Minimalism Maxi

Fewer elements, chosen on purpose, defended with evidence that survives a "source?" reply.

Two jobs:

1. **Cut.** Take a screen, deck, page, menu, message or plan and bring it down to what a person can take in at a glance.
2. **Justify.** When the user wants to persuade someone else, give them the honest version of the science. The popular line "more than 12 things activates the pain center and you walk away" is wrong in three places. The true version is still persuasive, so use that.

Read [references/evidence.md](references/evidence.md) before quoting any study. It holds the exact findings, the numbers, and the sentences that are safe to say out loud.

## The working limits

These are defaults, not laws. Each comes from a different line of research, so treat them as a ladder, not a single magic number.

| Situation | Limit | Where it comes from |
|---|---|---|
| Things to hold in mind at once (nav items, bullet points, steps, arguments) | 3 to 4, hard stop at 7 | Cowan's ~4-chunk working memory; Miller's 7±2 is the ceiling, not the target |
| Options someone must choose between (plans, menu items, product variants) | 6 to 12. Never 24 | Reutskaja et al. 2018: value signal peaks around 12 and is lower at 24 |
| Calls to action on one screen or in one message | 1 | Hick's law: decision time grows with log of the number of choices |
| Decoration, stock images, flourishes, background fills | 0 unless it carries meaning | Mayer's coherence principle; Kastner: every extra object competes for attention |
| Time before someone has judged the page | about 50 ms | Lindgaard 2006; visual complexity is the main driver (Reinecke 2013) |

Rule of thumb when a count sits in the grey zone: count what the eye lands on, not what the DOM contains. A grid of 20 identical thumbnails reads as one element. Five differently styled buttons read as five problems.

## Procedure: cutting something

Work in this order. Each step removes a different kind of excess, and skipping ahead to "make it pretty" leaves the clutter in place with nicer fonts.

1. **Inventory.** List every distinct element a first-time viewer notices: headings, buttons, links, images, labels, badges, colours, fonts, sentences. Count them. Say the number. People consistently underestimate their own clutter by half.
2. **Name the one job.** What is the single thing this screen, slide or message exists to do? If the user cannot say it in one sentence, that is the first finding. Everything that follows serves that job.
3. **Group.** Merge elements that mean the same thing. Three badges saying "new", "popular", "recommended" are one signal. Four nav items under "Company" are one item.
4. **Cut.** Delete anything that does not move the one job forward. Default to deletion, not hiding. "Put it behind a More link" is a last resort for things that are needed by some users but not most.
5. **Rank what remains.** One primary action gets the visual weight. Everything else is secondary and looks secondary.
6. **Recount.** Compare against the table. If still over, go back to step 3.
7. **Keep the cuts.** Write down what was removed and why, so the next person does not add it back in the next sprint.

For prose and talks the same loop applies with sentences in place of elements: one message per paragraph, one idea per slide, one ask per email. Hand the final text to stop-slop if it needs a voice pass.

## Procedure: justifying the cut to someone else

The audience usually pushes back with "but users want options" or "stakeholders want their thing on the homepage". Give the user ammunition that does not break under scrutiny.

Lead with behaviour, then the brain. The jam study moved sales by a factor of ten; that lands harder with a product person than any fMRI result. Use the brain study second, as the mechanism.

Safe sentences, in increasing strength:

- "People form a judgement of a page in about a twentieth of a second, and visual complexity is the main thing they are judging."
- "In the classic shop experiment, a table with 24 jams drew more people but sold a tenth as much as a table with 6."
- "Brain scans show the brain's reward and effort signals peak at around a dozen options and switch off past that. The brain decides the effort is no longer worth it."
- "Every object on the screen competes for the same attention. Clutter is not neutral background, it is an opponent."

Sentences to refuse, with the fix:

| Do not say | Why | Say instead |
|---|---|---|
| "More than 12 things activates the pain center" | No threshold at 12 was tested, the region is not a pain centre, and activity went down at 24, not up | "The reward signal peaks at around 12 options and drops off past that" |
| "The brain can only hold 7 things" | Miller's 7±2 is the upper bound for simple items; modern estimate is about 4 chunks | "People hold about four things in mind at once" |
| "Clutter causes stress / anxiety / cortisol" | The cited work is on physical home clutter and self-report, not interfaces | "Clutter competes for attention and tires people out over time" |
| "Users leave if there are too many elements" | Measured outcome in the brain study was choosing, not leaving | "With too many options people stop choosing. In the shop study that meant not buying" |

If the user insists on the pain line, say once that it will get a "source?" reply, give the honest version, and let them decide.

## Fact-checking a minimalism claim

When the user brings a claim ("I read that…") rather than a design:

1. Find the study in [references/evidence.md](references/evidence.md). If it is not there, search for the primary paper and add it.
2. Check three things: what was manipulated (count? complexity? emotion?), what was measured (brain region, behaviour, self-report), and which direction the effect went.
3. Return a verdict in one line, the corrected sentence, and the citation. No lecture.

## Output format

For a cut, return:

```
Inventory: N elements (list)
One job: <sentence>
Cut: <what goes, one line each, with reason>
Keep: <what stays, ranked, primary first>
Result: N → M elements
```

Then the rewritten text, layout description, or code. Put the evidence line last and only if the user is going to have to defend the change.

For a justification, return the two or three safe sentences in the user's register (casual, first person if they asked for their voice), then the citations as a short list, one line each. Match the length the user asked for: if they asked for three sentences, give three, and keep the sources to a line apiece. A long evidence dump under a short pitch is its own kind of clutter.

## Judgement calls

- Minimalism is not the same as hiding. A screen with one button and six hidden menus has moved the clutter, not removed it.
- Some audiences want density: traders, developers, power users on a tool they open 50 times a day. For them the limit is per visual group, not per screen. Group hard, then density is fine.
- Twelve options is a ceiling for a choice, not a licence to add up to twelve. The jam study's winning table had six.
- When a stakeholder's element cannot be cut, demote it: smaller, lower, greyer. Visual hierarchy is the compromise that keeps the one job intact.
- Avoid the word "matters" in anything written for Oli.
