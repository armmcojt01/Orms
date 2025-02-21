<?php include('db_connect.php');?>

<div class="container-fluid">
	
	<div class="col-lg-12">
		<div class="row">

			<!-- Table Panel -->
			<div class="col-md-12">
				<div class="card" >
					<div class="card-header">
						<div class="row">
							<div class="col-lg-12">
								<span><large><b>Vacancy List</b></large></span>
								<button class="btn btn-sm btn-block btn-primary btn-sm col-md-2 float-right" type="button" id="new_division"><i class="fa fa-plus"></i> New Division</button>
							</div>
						</div>
						
					</div>
					<div class="card-body">
						<table class="table table-bordered table-hover">
							<colgroup>
								<col width="10%">
								<col width="30%">
								<col width="40%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">#</th>
									<th class="text-center">Division Information</th>
									<th class="text-center">Description</th>
									<th class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>
								<?php 
								$i = 1;
								$plan = $conn->query("SELECT * FROM division_tbl order by id asc");
								while($row=$plan->fetch_assoc()):
									// $trans = get_html_translation_table(HTML_ENTITIES,ENT_QUOTES);
									// unset($trans["\""], $trans["<"], $trans[">"], $trans["<h2"]);
									// $desc = strtr(html_entity_decode($row['description']),$trans);
									// $desc=str_replace(array("<li>","</li>"), array("",","), $desc);
									// echo htmlentities(strip_tags($desc))
								?>
								<tr>
									<td class="text-center"><?php echo $i++ ?></td>
									<td class="">
										<p>Division : <b><?php echo $row['division_name'] ?></b></p>
									</td>
									<td class="text-start">
										<?php echo $row['description'] ?>
									</td>
									<td class="text-center mx-10">
										<button class="btn btn-sm btn-primary view_vacancy" type="button" data-id="<?php echo $row['id'] ?>" >View</button>
										<button class="btn btn-sm btn-primary edit_vacancy" type="button" data-id="<?php echo $row['id'] ?>" >Edit</button>
										<button class="btn btn-sm btn-danger delete_vacancy" type="button" data-id="<?php echo $row['id'] ?>">Delete</button>
									</td>
								</tr>
								<?php endwhile; ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- Table Panel -->
		</div>
	</div>	

</div>
<style>
	
	td{
		vertical-align: middle !important;
	}
	td p{
		margin: unset
	}
	img{
		max-width:100px;
		max-height: :150px;
	}
</style>
<script>
	$('table').dataTable()
	$("#new_division").click(function(){
		uni_modal("New Division","manage_division.php","mid-large")
	})
	$(".edit_division").click(function(){
		uni_modal("Edit Vacancy","manage_division.php?id="+$(this).attr('data-id'),"mid-large")
	})
	$(".view_division").click(function(){
		uni_modal("","view_division.php?id="+$(this).attr('data-id'),"mid-large")
	})

	$('.delete_division').click(function(){
		_conf("Are you sure to delete this division?","delete_vacancy",[$(this).attr('data-id')])
	})
	function displayImg(input,_this) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        	$('#cimg').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}
	function delete_vacancy($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_vacancy',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp==1){
					alert_toast("Data successfully deleted",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	}
</script>