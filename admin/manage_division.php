<?php
include 'db_connect.php';

if(isset($_POST['action']) && $_POST['action'] == 'save_division'){
    // Get the values from the form
    $id = isset($_POST['id']) ? $_POST['id'] : '';
    $division_name = $_POST['division_name'];
    $description = $_POST['description'];

    $query = "UPDATE division_table SET 
                division_name = ?,
                description = ?,
            WHERE id = ?";

    $stmt = $conn->prepare($query);

    $stmt->bind_param("ss", $division_name, $description, $id);

    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        echo "Division updated successfully.";
    } else {
        echo "Error updating division.";
    }

}
?>

<?php
if(isset($_GET['id'])){
    $qry = $conn->query("SELECT * FROM division_tbl WHERE id=" . $_GET['id']);
    $division = $qry->fetch_array(); 
    foreach($division as $k => $v){
        $$k = $v;
    }

}
?>
    

<div class="container-fluid">
    <form action="" id="manage-division">
        <input type="hidden" name="id" value="<?php echo isset($_GET['id']) ? $_GET['id'] : ''; ?>" class="form-control">

        <div class="row form-group">
            <div class="col-md-8">
                <label class="control-label">Division Name</label>
                <input type="text" name="division_name" class="form-control" value="<?php echo isset($division_name) ? $division_name : ''; ?>">
            </div>
        </div>

        <div class="row form-group">
            <div class="col-md-12">
                <label class="control-label">Description</label>
                <textarea name="description" class="text-jqte"><?php echo isset($description) ? $description : ''; ?></textarea>
            </div>
        </div>
    </form>
</div>

<script>
    $('.text-jqte').jqte();
    $('#manage-division').submit(function(e){
        e.preventDefault();
        start_load();
        $.ajax({
            url: 'ajax.php?action=save_division',
            method: 'POST',
            data: $(this).serialize(),
            success: function(resp){
                if(resp == 1){
                    alert_toast("Data successfully saved.",'success');
                    setTimeout(function(){
                        location.reload();
                    }, 1000);
                } else {
                    alert_toast("Error saving data.", 'error');
                }
            }
        });
    });
</script>
