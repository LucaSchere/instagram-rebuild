Dropzone.autoDiscover = false;

$(document).ready(function(){
    $(".upload-images").dropzone({
        addRomveLinks: true,
        maxFilesize: 5,
        autoProcessQueue: false,
        uploadMultiple: true,
        parallelUploads: 100,
        maxFiles: 100,
        paramName: "images",
        previewsContainer: ".dropzone-previews",
        clickable: ".upload-photos-icon",
        thumbnailWidth: 100,
        thumbnailHeight: 100,

        init: function(){
            var myDropzone = this;

            this.element.querySelector("input[type=submit]").addEventListener("click", function(e){
                e.preventDefault();
                e.stopPropagation();
                myDropzone.processQueue();
            });

            this.on("successmultiple", function(files, response){
                window.location.reload();
            });

            this.on("errprmultiple", function(files, response){
                toastr.error(respone);
            });
        }
    })
});
