const init = () => {
    let currentTab = 0;
    const content = [
        "Открой свой формат PitStopКафе:<br>Эспресс-кафе за <span>1 500 000 рублей</span>, в т.ч. паушальный взнос<br>Кофе поинт за <span>1 000 000 рублей</span>, в т.ч. паушальный взнос",
        "На этапе переговоров мы показываем вам абсолютно все затраты на открытие кафе, наши реальные бюджеты доходов и расходов действующих кафе, а также передаем прямые контакты наших поставщиков",
        "Мы знаем как непросто развивать бизнес в первый год, поэтому мы вас поддержим, первые три месяца - <span>роялти 0%</span>, с 4 по 12 месяц - роялти 1.5% при неизменно высоком уровне франчайзинговой поддержки. Маркетинговые платежи - 0%!",
    ];
    const tabs = document.getElementById('tabs');
    const contentElem = document.getElementById('content');

    const clear = () => {
        tabs.children[currentTab].classList.remove(('active'));
    };

    for ( let i = 0; i < tabs.children.length; i++ ) {
        tabs.children[i].addEventListener('mouseover', () => {
            if (i != currentTab) {
                clear();
                tabs.children[i].classList.add('active');
                contentElem.innerHTML = content[i];
                currentTab = i;
            };
        })
    };
};

window.onload = () => {
    init();
};