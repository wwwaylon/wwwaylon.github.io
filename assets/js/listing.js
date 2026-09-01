// Shared listing pages (Publications, Presentations): filter chips + search.
// Activates on any element with [data-listing].
(function(){
  [].forEach.call(document.querySelectorAll("[data-listing]"), function(root){
    var items = [].slice.call(root.querySelectorAll(".lst-item"));
    var sections = [].slice.call(root.querySelectorAll(".lst-section"));
    var chips = root.querySelector(".lst-chips");
    var search = root.querySelector(".lst-search");
    var empty = root.querySelector(".lst-empty");
    var filter = "all", q = "";

    items.forEach(function(el){ el.dataset.text = el.textContent.toLowerCase(); });

    function render(){
      var any = false;
      items.forEach(function(el){
        var groups = (el.dataset.groups || "").split("|");
        var ok = (filter === "all" || groups.indexOf(filter) > -1) &&
                 (!q || el.dataset.text.indexOf(q) > -1);
        el.hidden = !ok;
        if (ok) any = true;
      });
      sections.forEach(function(s){
        var shown = [].slice.call(s.querySelectorAll(".lst-item")).filter(function(el){ return !el.hidden; });
        s.hidden = shown.length === 0;
        var count = s.querySelector(".lst-group span");
        if (count) count.textContent = shown.length;
      });
      if (empty) empty.style.display = any ? "none" : "block";
    }

    if (chips) chips.addEventListener("click", function(ev){
      var b = ev.target.closest(".lst-chip");
      if (!b) return;
      filter = b.dataset.group;
      [].forEach.call(chips.children, function(c){ c.setAttribute("aria-pressed", c === b); });
      render();
    });
    if (search) search.addEventListener("input", function(){
      q = this.value.trim().toLowerCase();
      render();
    });
  });
})();
