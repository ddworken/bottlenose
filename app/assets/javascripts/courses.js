(function () {
    var tmpl = "";

    function init_courses_form() {
        tmpl = $('#section-template')[0].innerHTML;
        $('#section-template').remove();

        $('.del-section-link').click(del_section);
        $('#add-section-link').click(add_section);
    }

    function del_section(evt) {
        var row = $(evt.target).closest('tr');
        row.find('.destroy-field').val("true");
        row.hide();
        evt.preventDefault();
    }
    
    function add_section(evt) {
        var ssid = new Date().getTime();
        var html = tmpl.replace(/ZXXZ/g, ssid);
        $('#sections').append(html);
        $('.del-section-' + ssid).click(del_section);
        evt.preventDefault();
    }

    run_on_page("courses/new", init_courses_form);
    run_on_page("courses/edit", init_courses_form);
    run_on_page("courses/create", init_courses_form);
    run_on_page("courses/update", init_courses_form);
})();

