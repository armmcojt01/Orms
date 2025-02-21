<style>
	nav#sidebar{
		width: 200px;
        box-shadow: rgba(0, 0, 0, 0.08) 1px 0px 20px;
        background-color: rgb(255, 255, 255);
	}
	nav#sidebar::before {
		content: '';
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-size: cover;
		z-index: -1; 
	}

	a.nav-item{
		background-color:rgba(32, 36, 100, 0.36);
	}
    .sidebar-list {
		background-color:rgba(255, 255, 255, 0.08);  
		margin-top:  40px;
    }
	a.nav-item:hover, .nav-item.active {
    background-color:rgba(255, 255, 255, 0.47);
    color: #fffafa;
	}
    .sidebar-list a {
        color: black;
    }

    a.nav-item:hover, .nav-item.active {
        color: black;
    }

    /* Active/hover styles */
    a.nav-item {
        color: white;
    }

    a.nav-item:hover, .nav-item.active {
        color: #488BA7;
    }

    #sidebar.hidden {
        transform: translateX(-100%);
        width: 50px; /* Sidebar shrinks */
    }

    #sidebar .sidebar-list {
        display: block;
    }


    #sidebar.hidden .sidebar-list {
        display: none;
    }

    .toggle-btn {
        font-size: 12px;
        padding: 10px;
        background-color: #488BA7;
        color: white;
        border: none;
        cursor: pointer;
        position: fixed;
        top: 55px;
        left: 0px;
        z-index: 1000;
        border-radius: 10%;
    }

    .toggle-btn:hover {
        background-color: #3A5291;
    }

    #sidebar.hidden + .toggle-btn {
        display: block;
    }
</style>

<button id="toggle-sidebar" class="toggle-btn">
    <i class="fas fa-bars"></i>
</button>

<nav id="sidebar" class="mx-lt-5">
    <div class="sidebar-list">
        <a href="index.php?page=home" class="nav-item nav-home"><span class='icon-field'><svg xmlns="http://www.w3.org/2000/svg" width="1.3rem" height="1.3rem" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" class="tabler-icon tabler-icon-home"><path d="M5 12l-2 0l9 -9l9 9l-2 0"></path><path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7"></path><path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6"></path></svg></span> Home</a>
        <a href="index.php?page=applications" class="nav-item nav-applications"><span class='icon-field'><svg xmlns="http://www.w3.org/2000/svg" width="1.3rem" height="1.3rem" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" class="tabler-icon tabler-icon-user"><path d="M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0"></path><path d="M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2"></path></svg></span> Applications</a>
        <a href="index.php?page=vacancy" class="nav-item nav-vacancy"><span class='icon-field'><i class="fa fa-list-alt"></i></span> Vacancy</a>
        <a href="index.php?page=recruitment_status" class="nav-item nav-recruitment_status"><span class='icon-field'><i class="fa fa-th-list"></i></span> Status Category</a>
        <?php if($_SESSION['login_type'] == 1): ?>
            <a href="index.php?page=users" class="nav-item nav-users"><span class='icon-field'><i class="fa fa-users"></i></span> Users</a>
            <a href="index.php?page=site_settings" class="nav-item nav-site_settings"><span class='icon-field'><i class="fa fa-cogs"></i></span> Settings</a>
        <?php endif; ?>
    </div>
</nav>

<script>
    // Set the active class for the current page
    $('.nav-<?php echo isset($_GET['page']) ? $_GET['page'] : '' ?>').addClass('active');

    // Toggle Sidebar on Button Click
    $(document).ready(function() {
        $('#toggle-sidebar').click(function() {
            $('#sidebar').toggleClass('hidden');
        });
    });
</script>
