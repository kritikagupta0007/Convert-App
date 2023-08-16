// function setupDatepicker() {
//     const dateInput = document.getElementById('date-input');
//     const selectedDate = document.getElementById('selected-date');
//     const datepicker = new window.Datepicker(dateInput, {
//         format: 'yyyy-mm-dd',
//         startDate: 'today',
//         endDate: '+1y',
//         language: 'en',
//         position: 'auto',

//         onchange: () => {
//             console.log('Datepicker value changed');
//             window.parent.postMessage({ type: 'date', data: datepicker }, '*');

//         }
//     });
//     // const picker = window.datepicker(dateInput, {
//     //         format: 'yyyy-mm-dd',
//     //         startDate: 'today',
//     //         endDate: '+1y',
//     //         language: 'en',
//     //         position: 'auto'
//     // },);

//     // picker.onSelect = (instance, date) => {
//     //     selectedDate.textContent = date.toLocaleDateString('en-US');
//     //     console.log('date' + instance);
//     //     window.parent.postMessage({ type: 'date', data: date.toLocaleDateString('en-US') }, '*');
//     // };

//     datepicker.onchange = (instance) => {
//         console.log('Datepicker value changed');
//         instance.hide();
//     }

//     // window.parent.postMessage({ type: 'date', data: datepicker }, '*');
//     dateInput.addEventListener('change', () => {
//         console.log('Selected date:', dateInput.value);
//     });
// }
// setupDatepicker();

function handleInputChange() {
    const dateInput = document.getElementById('date-input');
    console.log('Input value changed:', dateInput.value);
    window.parent.postMessage({ type: 'dateInput', data: dateInput.value }, '*');
}
// handleInputChange();
