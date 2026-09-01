// Presentations page — filter chips + search over the rendered list.
(function(){
  var root = document.querySelector(".pres"); if(!root) return;
  var items = [].slice.call(root.querySelectorAll(".pres-item"));
  var sections = [].slice.call(root.querySelectorAll(".pres-section"));
  var chips = root.querySelector(".pres-chips");
  var empty = root.querySelector(".pres-empty");
  var cat = "all", q = "";

  items.forEach(function(el){ el.dataset.text = el.textContent.toLowerCase(); });

  function render(){
    var any = false;
    items.forEach(function(el){
      var ok = (cat === "all" || el.dataset.kind === cat) && (!q || el.dataset.text.indexOf(q) > -1);
      el.hidden = !ok; if(ok) any = true;
    });
    sections.forEach(function(s){
      var shown = [].slice.call(s.querySelectorAll(".pres-item")).filter(function(el){ return !el.hidden; });
      s.hidden = shown.length === 0;
      s.querySelector(".pres-group span").textContent = shown.length;
    });
    empty.style.display = any ? "none" : "block";
  }

  chips.addEventListener("click", function(ev){
    var b = ev.target.closest(".pres-chip"); if(!b) return;
    cat = b.dataset.kind;
    [].forEach.call(chips.children, function(c){ c.setAttribute("aria-pressed", c === b); });
    render();
  });
  root.querySelector(".pres-search").addEventListener("input", function(){
    q = this.value.trim().toLowerCase(); render();
  });
})();
