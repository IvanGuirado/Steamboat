
const m = document.getElementById("menu-toggle");
m.addEventListener("change", function () {

    if (m.checked) {
        document.body.classList.add("menu-active")
    } else {
        document.body.classList.remove("menu-active")
    }
})
const backdrop = document.getElementById("backdrop");
backdrop.addEventListener("click", function () {
    m.checked = false;
    document.body.classList.remove("menu-active")
});

const close = document.getElementById("close");
close.addEventListener("click", function () {
    m.checked = false;
    document.body.classList.remove("menu-active")
});
/*
// Cierra el menú si se hace clic fuera de él
const tapItems = document.querySelectorAll(".nav-tap");
tapItems.forEach(function (item) {
    item.addEventListener("mouseenter", function () {

        //document.body.classList.add("menu-active")
        item.classList.add("desplegado")
    });
});

tapItems.forEach(function (item) {
    item.addEventListener("mouseleave", function () {

        setTimeout(function () {
            item.classList.remove("desplegado")
        }, 1000);
        //document.body.classList.remove("menu-active")
    });
});
*/
/*document.addEventListener("click", function (event) {
    const elem = document.querySelector(".desplegado")
    if (elem) elem.classList.remove("desplegado")
    if (event.target.matches(".dropdown-selector")) {
        if (event.target.parentNode != elem)
            event.target.parentNode.classList.toggle("desplegado")
    }
});*/
/*Desactivación entrada de teclado para un campo de entrada numérica */
var numberInputs = document.querySelectorAll('.cantidad');

numberInputs.forEach(function (numberInput) {
    numberInput.addEventListener('keydown', function (event) {
        // Previene el comportamiento predeterminado (en este caso, no permite la entrada del teclado)
        event.preventDefault();
    });
});
function changeLanguage(lang) {
    console.log(lang)
    fetch("/setIdioma/" + lang)
        .then(function () {
            location.reload()

        })


}


function createLanguagePicker({
    containerElementCSSSelector = "body",
    languages = ["English"],
    expandEvent = "click",
} = {}) {
    // run checks
    const VALID_EXPAND_EVENTS = ["hover", "click", "mousedown"];
    if (!expandEvent || !VALID_EXPAND_EVENTS.includes(expandEvent))
        return console.error(
            "Please use a valid event type for expanding the dropdown. Valid events are 'hover', 'click', 'mousedown'."
        );

    // container element is the parent of the language picker
    const containerElement = document.querySelector(containerElementCSSSelector);

    // event handlers
    const expandEventType = expandEvent === "hover" ? "mouseover" : "mousedown";
    const toggleOptionsDisplay = () => dropdownOptions.classList.toggle("opened");
    const hideOptions = () => dropdownOptions.classList.remove("opened");
    const updateBtnTextWithChosenLanguage = (language) =>
        (currentLanguageDisplayed.textContent = language);

    // generate the language-picker
    const languagePickerElement = document.createElement("div");
    languagePickerElement.classList.add("language-picker");

    const toggleBtnElement = document.createElement("button");
    toggleBtnElement.type = "button";
    toggleBtnElement.classList.add("language-picker-btn");
    toggleBtnElement.addEventListener(expandEventType, toggleOptionsDisplay);

    const toggleBtnLeftContainer = document.createElement("div");
    toggleBtnLeftContainer.classList.add("left");

    const globeIcon = document.createElement("figure");
    globeIcon.classList.add("globe-icon");

    const currentLanguageDisplayed = document.createElement("p");
    currentLanguageDisplayed.classList.add("current-language");
    //revisar
    currentLanguageDisplayed.textContent = languages[lang];

    const chevronIcon = document.createElement("figure");
    chevronIcon.classList.add("chevron-icon");

    toggleBtnLeftContainer.appendChild(globeIcon);
    toggleBtnLeftContainer.appendChild(currentLanguageDisplayed);
    toggleBtnElement.appendChild(toggleBtnLeftContainer);
    toggleBtnElement.appendChild(chevronIcon);

    languagePickerElement.appendChild(toggleBtnElement);

    const dropdownOptions = document.createElement("ul");
    dropdownOptions.classList.add("dropdown-options");
    for (var code in languages) {
        const language = languages[code]
        const languageListItem = document.createElement("li");
        languageListItem.classList.add("option");
        languageListItem.setAttribute("lang", code);
        const left = document.createElement("figure");
        const languageText = document.createElement("p");
        languageText.textContent = language;

        languageListItem.addEventListener("mousedown", (ev) => {
            updateBtnTextWithChosenLanguage(language);
         
            var li=ev.target
            if(li.tagName=="P")
                li=li.parentNode
            changeLanguage(li.getAttribute("lang"))
            hideOptions();
        });

        console.log(languageListItem);

        languageListItem.appendChild(left);
        languageListItem.appendChild(languageText);
        dropdownOptions.appendChild(languageListItem);
    }

    languagePickerElement.appendChild(dropdownOptions);
    languagePickerElement.addEventListener("mouseleave", hideOptions);

    containerElement.appendChild(languagePickerElement);
}

//todo: in docs, explain what each parameter means, expected values, and show examples!

// todo: function for generating button, and function for generating dropdown options




const LANGUAGES = { es: "Español", en: "English" };

const clickOptions = {
    expandEvent: "click",
    containerElementCSSSelector: "#click-dropdown",
    languages: LANGUAGES,
};
const hoverOptions = {
    expandEvent: "hover",
    containerElementCSSSelector: "#hover-dropdown",
    languages: LANGUAGES,
};

createLanguagePicker(clickOptions);
createLanguagePicker(hoverOptions);