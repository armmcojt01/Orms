<?php include 'admin/db_connect.php' ?>

<?php
	$qry = $conn->query("SELECT * FROM vacancy where id=".$_GET['id'])->fetch_array();
	foreach($qry as $k =>$v){
		$$k = $v;
	}
?>
<style>
	.toast.error {
		background-color: #d4edda;
	}

	.toast {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 15px;
    color: white;
    border-radius: 5px;
    z-index: 9999;
    max-width: 80%; /* Optional: limits the width */
    text-align: center; /* Centers the text inside the toast */
	}	

	@media (max-width: 768px) {
	.modal-content {
		width: 50vh;
	}
}
	
</style>
<div class="container-fluid">
    <form id="manage-application">
        <input type="hidden" name="id" value="">
        <input type="hidden" name="position_id" value="<?php echo $_GET['id'] ?>">

        <div class="col-md-12">
            <div class="row">
                <h3>Application Form for <?php echo $position ?></h3>
            </div>
            <hr>

            <!-- Name Fields -->
            <div class="row form-group">
                <div class="col-sm-12 col-md-4">
                    <label for="" class="control-label">Last Name</label>
                    <input type="text" class="form-control" name="lastname" required="">
                </div>
                <div class="col-sm-12 col-md-4">
                    <label for="" class="control-label">First Name</label>
                    <input type="text" class="form-control" name="firstname" required="">
                </div>
                <div class="col-sm-12 col-md-4">
                    <label for="" class="control-label">Middle Name</label>
                    <input type="text" class="form-control" name="middlename">
                </div>
            </div>

            <!-- Gender, Email, Contact -->
            <div class="row form-group">
                <div class="col-sm-12 col-md-4">
                    <label for="" class="control-label">Gender</label>
                    <select name="gender" id="" class="custom-select browser-default">
                        <option>Male</option>
                        <option>Female</option>
                    </select>
                </div>
                <div class="col-sm-12 col-md-4">
                    <label for="" class="control-label">Email</label>
                    <input type="email" class="form-control" name="email" required="">
                </div>
                <div class="col-sm-12 col-md-4">
                    <label for="" class="control-label">Contact</label>
                    <input type="text" class="form-control" name="contact" required="">
                </div>
            </div>

            <!-- Complete Address -->
            <div class="row form-group">
                <div class="col-sm-12 col-md-7">
                    <label for="" class="control-label">Complete Address</label>
                    <textarea name="address" id="" cols="30" rows="3" required class="form-control"></textarea>
                </div>
            </div>

            <!-- Application Letter -->
            <div class="row form-group">
                <div class="col-sm-12 col-md-7">
                    <label for="" class="control-label">Plantilla Item No., Salary Grade, Place of Assignment</label>
                    <textarea name="cover_letter" id="" cols="30" rows="3" placeholder="(Please input Plantilla Item No. - Salary Grade - Place of Assignment)" class="form-control"></textarea>
                </div>
            </div>

            <!-- File Upload -->
            <div class="row form-group">
                <div class="input-group col-sm-12 col-md-4 mb-3">
                    <div class="input-group-prepend"></div>
                    <div class="custom-file">
						<small> PDF and Other Document </small>
                        <input type="file" class="custom-file-input" id="resume" onchange="displayfname(this,$(this))" name="resume" accept="application/msword,text/plain, application/pdf">
                        <label class="custom-file-label" for="resume" style="margin-top: 50px; margin-bottom: 20px;">Choose file</label>
                    </div>
                </div>
            </div>
			<div class="form-group">
				<small class="form-text text-muted" style="margin-top: 40px;">Make sure it is saved in PDF format.</small>
			</div>
        </div>
    </form>
</div>


<script>
	function displayfname(input,_this) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        	console.log(input.files[0].name)
        	_this.siblings('label').html(input.files[0].name);
        }

        reader.readAsDataURL(input.files[0]);
    }
}
$(document).ready(function(){
    $('#manage-application').submit(function(e){
        e.preventDefault();
        var isValid = true;
        $('#manage-application input[required], #manage-application select[required], #manage-application textarea[required]').each(function() {
            if ($(this).val().trim() === '') {
                isValid = false;
                $(this).css('border', '1px solid red');
            } else {
                $(this).css('border', '');
            }
        });

        if (!isValid) {
            alert_toast('Please fill in all required fields.', 'error');
            return false;
        }

        start_load();

        $.ajax({
            url: 'admin/ajax.php?action=save_application',
            data: new FormData($(this)[0]),
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST',
            error: err => {
                console.log(err);
            },
            success: function(resp) {
                var response = JSON.parse(resp);

                if (response.status === "success") {
                    alert_toast('Application successfully submitted.', 'success');
                    setTimeout(function() {
                        window.location.href = 'sendEmail.php?email=' + encodeURIComponent(response.email) + '&position_id=' + encodeURIComponent(response.position_id);
                    }, 1000);
                } else {
                    alert_toast('Failed to submit the application, Email was used already for this position.', 'error');
					setTimeout(function() {
                        location.reload();
                    }, 5000);
                }
            }
        });
    });
});

function alert_toast(message, type, style = '') {
    var toast = document.createElement('div');
    toast.classList.add('toast', type); 

    toast.textContent = message;
    if (style) {
        toast.style.cssText = style;
    } else if (type === 'error') {
        toast.style.backgroundColor = 'red';
        toast.style.color = 'white';
        toast.style.padding = '15px';
    } else if (type === 'success') {
        toast.style.backgroundColor = 'green';
        toast.style.color = 'white';
        toast.style.padding = '15px';
	}
    document.body.appendChild(toast);

    setTimeout(function() {
        toast.classList.add('show');
    }, 100);

    setTimeout(function () {
		toast.classList.remove('show');
		toast.classList.add('hide');	
	}, 5000);
}
</script>