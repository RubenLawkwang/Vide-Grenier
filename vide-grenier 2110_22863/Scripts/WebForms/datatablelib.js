(function ($) {
    "use strict";
    $(document).ready(function () {
        //init dataTables
        $('#gvs').dataTable(
            {
                "lengthMenu": [2, 3, 5, 10, 20],
                lengthChange: true,
                info: true,
                pageLength: 2
            });
    });
}(jQuery));