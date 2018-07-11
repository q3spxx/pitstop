(function() {
  let toogle = false;
  const profileMenuElem = document.getElementById('profile_menu');
  const profileElem = document.getElementById('profile');
  profileElem.addEventListener('click', (e) => {
    if(!toogle) {
      setTimeout(() => {
        profileMenuElem.classList.add('profile_menu_shown');
        toogle = true;
      }, 0);
    }
    document.body.addEventListener('click', (e) => {
      if(toogle) {
        profileMenuElem.classList.remove('profile_menu_shown');
        toogle = false;
      };
    });
  });
})();
(function () {
  let hiding = false;
  let hidden = false;
  let message = "";
  let sliders = [];
  const changeArc = (id, root) => {
    const list = root.children[1].children[0];
    let elem = list.children[id].children[0];
    for (let child of list.children) {
      const arc = child.firstElementChild;
      arc.classList.remove("slider_enum_arc_selected");
    };
    elem.classList.add("slider_enum_arc_selected");
  };
  const changeItem = (id, root) => {
    const list = root.children[0].children[1];
    let elem = list.children[id].children[0];
    for (let child of list.children) {
      child.children[0].classList.remove("slider_menu_item_selected");
    };
    elem.classList.add("slider_menu_item_selected");
    const mess = elem.innerText;
    changeMess(mess, root);
  };
  const changeImage = (id, root) => {
    const list = root.children[0].children[0];
    let elem = list.children[id];
    for (let child of list.children) {
      child.classList.remove("slider_image_selected");
    };
    elem.classList.add("slider_image_selected");
  };
  const changeMess = (mess, root) => {
    message = mess;
    if (hiding) return;
    const elem = root.children[0].children[2].children[0];
    if (!hidden) {
      hideMess(elem).then(() => {
        showMess(elem);
      });
    };
  };
  const showMess = (elem) => {
    elem.children[2].classList.add("slider_mess_border_show");
    new Promise((resolve, rejsect) => {
      setTimeout(() => {
        elem.children[1].classList.add("slider_mess_bg_show");
        resolve();
      }, 200);
    }).then(() => {
      return new Promise((resolve, rejsect) => {
        setTimeout(() => {
          elem.children[0].innerText = message;
          elem.children[0].classList.add("slider_mess_text_show");
          hidden = false;
          resolve();
        }, 100);
      });
    });
  };
  const hideMess = (elem) => {
    hiding = true;
    elem.children[0].classList.remove("slider_mess_text_show");
    elem.children[1].classList.remove("slider_mess_bg_show");
    return new Promise((resolve) => {
      setTimeout(() => {
        elem.children[0].innerText = "";
        elem.children[2].classList.remove("slider_mess_border_show");
        resolve();
      }, 100);
    }).then(() => {
      return new Promise((resolve) => {
        setTimeout(() => {
          hiding = false;
          hidden = true;
          resolve();
        }, 200);
      });
    });
  };
  const changeSlide = (id, root) => {
    changeArc(id, root);
    changeItem(id, root);
    changeImage(id, root);
  };

  class Slider {
    constructor(root) {
      this.root = root;
      this.imagesLoaded = 0;
      this.interval = null;
      this.curPosition = 0;
      const images = root.children[0].children[0].children;
      this.imageCount = images.length;
      for (let image of images) {
        if (!image.children[0].children[0].complete) {
          image.children[0].children[0].onload = () => {
            this.imagesLoaded += 1;
            if (this.imageCount === this.imagesLoaded) this.onLoad();
          }
        } else {
          this.imagesLoaded += 1;
        };
      }
      images[0].classList.add("slider_image_selected");

      const items = root.children[0].children[1].children;
      const arcs = root.children[1].children[0].children;
      for (let i = 0; i < items.length; ++i) {
        items[i].children[0].addEventListener("mouseover", (e) => {
          this.stop();
          if (this.curPosition === i) return;
          this.curPosition = i;
          changeSlide(i, root);
        });
        items[i].children[0].addEventListener("mouseout", (e) => {
          this.start();
        });
        arcs[i].children[0].addEventListener("mouseover", (e) => {
          this.stop();
          if (this.curPosition === i) return;
          this.curPosition = i;
          changeSlide(i, root);
        });
        arcs[i].children[0].addEventListener("mouseout", (e) => {
          this.start();
        });
      }
      items[0].children[0].classList.add("slider_menu_item_selected");
      arcs[0].children[0].classList.add("slider_arc_selected");

      if (this.imageCount === this.imagesLoaded) this.onLoad();
    }
    onLoad() {
      this.start();
      console.log("loaded");
    }
    start() {
      this.interval = setInterval(() => {
        this.curPosition += 1;
        if (this.curPosition === this.imageCount) this.curPosition = 0;
        changeSlide(this.curPosition, this.root);
      }, 5000);
    }
    stop() {
      if (this.interval !== null) clearInterval(this.interval);
      this.interval = null;
    }
  }

  const sliderElems = document.getElementsByClassName("slider_root");
  for (let sliderElem of sliderElems) {
    sliders.push(new Slider(sliderElem));
  };
})();
