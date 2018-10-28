const init = () => {
    const navigation = [
        '<li><a href="#advantages">Наши преимущества</a></li>',
        '<li><a href="#formats">Форматы</a></li>',
        '<li><a href="#partner">Регионы</a></li>',
        '<li><a href="#support">Поддержка</a></li>',
        '<li><a href="#contacts">Контакты</a></li>'
    ];
    const titles = [
        "Простая и понятная<br><span>бизнес-модель</span>",
        "<span>Честные условия</span><br>франшизы",
        "<span>Роялти</span> в первые<br>три месяца <span>0%</span>"
    ];
    const content = [
        "Открой свой формат PitStopКафе:<br>Эспресс-кафе за <span>1 500 000 рублей</span>, в т.ч. паушальный взнос<br>Кофе поинт за <span>1 000 000 рублей</span>, в т.ч. паушальный взнос",
        "На этапе переговоров мы показываем вам абсолютно все затраты на открытие кафе, наши реальные бюджеты доходов и расходов действующих кафе, а также передаем прямые контакты наших поставщиков",
        "Мы знаем как непросто развивать бизнес в первый год, поэтому мы вас поддержим, первые три месяца - <span>роялти 0%</span>, с 4 по 12 месяц - роялти 1.5% при неизменно высоком уровне франчайзинговой поддержки. Маркетинговые платежи - 0%!",
    ];
    
    const initTabulation = (titles, content) => {
        let currentTab = 0;
        
        const tabulation = document.getElementById('tabulation');
        const tabs = tabulation.firstElementChild;
        const description = tabulation.lastElementChild.firstElementChild;
        
        for ( let i = 0; i < tabs.children.length; i++ ) {
            tabs.children[i].firstElementChild.innerHTML = titles[i];
            tabs.children[i].addEventListener('mouseover', () => {
                if (i != currentTab) {
                    tabs.children[currentTab].classList.remove(('active'));
                    tabs.children[i].classList.add('active');
                    description.innerHTML = content[i];
                    currentTab = i;
                };
            })
        };
        description.innerHTML = content[0];
    };

    const initAccordion = (titles, content) => {
        let currentBlock = 0;

        const accordion = document.getElementById('accordion');
        for (let i = 0; i < accordion.children.length; i++) {
            const block = accordion.children[i];
            const title = block.firstElementChild;
            const description = block.lastElementChild;
            
            title.firstElementChild.innerHTML = titles[i];
            description.innerHTML = content[i];
            title.addEventListener('click', () => {
                accordion.children[currentBlock].classList.remove('active');
                block.classList.add('active');
                currentBlock = i;
            });
        };
    };

    const initNavigation = (navigation) => {
        const menu = document.getElementById('menu').firstElementChild;
        const menuMobile = document.getElementById('menu-mobile').firstElementChild;

        const menuItems = navigation.join('');
        menu.innerHTML = menuItems;
        menuMobile.innerHTML = menuItems;
    };

    const initMenuButton = () => {
        let menuIsOpen = false;
        const menuMobile = document.getElementById('menu-mobile');
        const menuButton = document.getElementById('menu-button');
        
        menuButton.addEventListener('click', () => {
            if (!menuIsOpen) {
                console.log('open');
                menuMobile.classList.add('open');
            } else {
                console.log('close');
                menuMobile.classList.remove('open');
            };
            menuIsOpen = !menuIsOpen;
        });
    };

    initNavigation(navigation);
    initAccordion(titles, content);
    initTabulation(titles, content);
    initMenuButton();
};

window.onload = () => {
    init();
};