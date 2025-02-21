<style>
    nav#sidebar{
        width: 15rem;
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
        background-color:white;
    }
    .sidebar-list {
        margin-top:  2rem;
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
        color: rgb(42, 53, 71);
        border-radius: .2rem;
        margin-bottom: .5rem;
        font-weight: 400;
    }

    a.nav-item:hover, .nav-item.active {
        background-color: rgb(33, 193, 214);
        color: white;
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
    .profile{
        display: flex;
        justify-content: left;
        align-items: start;
        flex-direction: column;
        background-image: url("assets/img/amang1.jpg");
        background-color: rgba(0, 0, 0, 0.5);
        background-blend-mode: darken;
        background-repeat: no-repeat;
        background-size: cover;
    }
    .profile-item{
        padding: 1rem;
    }
    #profileName{
        color: #F7F9FB;
    }
    #sideBarNav{
        margin: .4rem;
    }
</style>

<button id="toggle-sidebar" class="toggle-btn">
    <i class="fas fa-bars"></i>
</button>

<nav id="sidebar">
    <div class="profile d-flex pl-2 pt-2">
        <div class="profile-item">
            <img src="assets/icons/users-2-svgrepo-com.svg" alt="Profile" width="40px" style="background-color: gray; border-radius: 50%;"></img>
        </div>
        <div class="profile-item" id="profileName">
            <h6>Alvin Lopez</h6>
        </div>
    </div>
    <div class="sidebar-list" id="sideBarNav">
        <a href="index.php?page=home" class="nav-item nav-home"><span class='icon-field'><svg xmlns="http://www.w3.org/2000/svg" width="1.3rem" height="1.3rem" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" class="tabler-icon tabler-icon-home"><path d="M5 12l-2 0l9 -9l9 9l-2 0"></path><path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7"></path><path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6"></path></svg></span> Home</a>
        <a href="index.php?page=applications" class="nav-item nav-applications"><span class='icon-field'><svg xmlns="http://www.w3.org/2000/svg" width="1.3rem" height="1.3rem" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" class="tabler-icon tabler-icon-user"><path d="M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0"></path><path d="M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2"></path></svg></span> Applications</a>
        <a href="index.php?page=vacancy" class="nav-item nav-vacancy"><span class='icon-field'><svg xmlns="http://www.w3.org/2000/svg" width="1.3rem" height="1.3rem" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" class="tabler-icon tabler-icon-table"><path d="M3 5a2 2 0 0 1 2 -2h14a2 2 0 0 1 2 2v14a2 2 0 0 1 -2 2h-14a2 2 0 0 1 -2 -2v-14z"></path><path d="M3 10h18"></path><path d="M10 3v18"></path></svg></span> Vacancy</a>
        <?php if($_SESSION['login_type'] == 1): ?>
            <a href="index.php?page=division" class="nav-item nav-manage_division">
                <span class='icon-field'><i class="fa fa-th-list"></i></span> Division
            </a>
            <a href="index.php?page=recruitment_status" class="nav-item nav-recruitment_status"><span class='icon-field'><svg xmlns="http://www.w3.org/2000/svg" width="1.3rem" height="1.3rem" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" class="tabler-icon tabler-icon-layout-grid"><path d="M4 4m0 1a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v4a1 1 0 0 1 -1 1h-4a1 1 0 0 1 -1 -1z"></path><path d="M14 4m0 1a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v4a1 1 0 0 1 -1 1h-4a1 1 0 0 1 -1 -1z"></path><path d="M4 14m0 1a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v4a1 1 0 0 1 -1 1h-4a1 1 0 0 1 -1 -1z"></path><path d="M14 14m0 1a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v4a1 1 0 0 1 -1 1h-4a1 1 0 0 1 -1 -1z"></path></svg></span> Status Category</a>
            <a href="index.php?page=users" class="nav-item nav-users"><span class='icon-field'><svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="currentColor" stroke-linecap="round" stroke-width="1.1" d="M4.5 17H4a1 1 0 0 1-1-1 3 3 0 0 1 3-3h1m0-3.05A2.5 2.5 0 1 1 9 5.5M19.5 17h.5a1 1 0 0 0 1-1 3 3 0 0 0-3-3h-1m0-3.05a2.5 2.5 0 1 0-2-4.45m.5 13.5h-7a1 1 0 0 1-1-1 3 3 0 0 1 3-3h3a3 3 0 0 1 3 3 1 1 0 0 1-1 1Zm-1-9.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0Z"/></svg></span> Users</a>
            <a href="index.php?page=site_settings" class="nav-item nav-site_settings"><span class='icon-field'><svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="currentColor" stroke-linecap="square" stroke-linejoin="round" stroke-width="1.1" d="M10 19H5a1 1 0 0 1-1-1v-1a3 3 0 0 1 3-3h2m10 1a3 3 0 0 1-3 3m3-3a3 3 0 0 0-3-3m3 3h1m-4 3a3 3 0 0 1-3-3m3 3v1m-3-4a3 3 0 0 1 3-3m-3 3h-1m4-3v-1m-2.121 1.879-.707-.707m5.656 5.656-.707-.707m-4.242 0-.707.707m5.656-5.656-.707.707M12 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"/></svg></span> Settings</a>
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
