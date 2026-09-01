# Committing the new Presentations page

From the root of your `wwwaylon.github.io` clone:

```bash
# 1. copy the new files in (paths already match the repo layout)
cp -r to-commit/presentations.html          .
cp -r to-commit/_data/presentations.yml     _data/
cp -r to-commit/assets/css/presentations.css assets/css/
cp -r to-commit/assets/js/presentations.js   assets/js/
cp -r to-commit/presentations-preview.Rmd   .

# 2. remove the two files that fight for /presentations/
git rm presentations.md
# the old 640 KB knitted export at presentations.html is overwritten by step 1,
# so nothing else to delete — just confirm the diff before committing.

# 3. keep future knits out of the site
echo "presentations-preview.html" >> .gitignore
echo "presentations-preview_files/" >> .gitignore

# 4. check locally, then push
bundle exec jekyll serve   # visit http://localhost:4000/presentations/
git add -A && git commit -m "Rebuild Presentations page from _data/presentations.yml" && git push
```

## What changed

| File | Status | Notes |
| --- | --- | --- |
| `presentations.md` | delete | content now lives in `_data/presentations.yml` |
| `presentations.html` | replace | was a 640 KB knitted RMarkdown export; now a ~4 KB Liquid page |
| `_data/presentations.yml` | new | 61 entries — the only file you edit from now on |
| `assets/css/presentations.css` | new | scoped to `.pres`, nothing leaks into the theme |
| `assets/js/presentations.js` | new | filter chips + search |
| `presentations-preview.Rmd` | new | Knit in RStudio to preview locally |

## Adding a presentation later

Open `_data/presentations.yml`, add:

```yaml
- year: 2026
  month: 9
  kind: "Invited talk"
  title: "Your title here"
  authors: "Coauthor, A., **Howard, W. J.**, Coauthor, B."
  venue: "Where it happened, City, ST"
  links:
    - label: "Slides"
      url: "https://..."
```

`kind` must be one of: Invited talk, Contributed talk, Workshop, Panel, Poster.
`month: 0` if the month is unknown. Order in the file does not matter.
