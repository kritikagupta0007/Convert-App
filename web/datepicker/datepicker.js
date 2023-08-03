const dateInput = document.getElementById('date-input');
const selectedDate = document.getElementById('selected-date');
const datepicker = new window.Datepicker(dateInput, {
    format: 'yyyy-mm-dd',
    startDate: 'today',
    endDate: '+1y',
    language: 'en',
    position: 'auto',
    onSelect: (instance, date) => {
        selectedDate.textContent = date.toLocaleDateString('en-US');
    }
});

dateInput.addEventListener('change', () => {
    console.log('Selected date:', dateInput.value);
});
