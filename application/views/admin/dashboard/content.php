<section class="content">
    <div class="container-fluid">
        <div class="block-header">
            <h2><?php echo $page_title ?></h2>
        </div>
        <div class="row clearfix">


        </div>

        <div class="row clearfix animated fadeIn">
            <div class="col-md-12">
                <div class="card">
                    <div class="body">
                        <div class="row" style="padding-top:50px;">
                            <div class="col-md-4" style="padding-top:20px">
                                <div class="row clearfix">
                                    <div class="col-md-12">
                                        <h1 style="color:#03A9F4!important">Selamat Datang Di Sisurat</h1>
                                        <p>Sistem Informasi Surat Masuk Surat Keluar</p>
                                        <a href="<?php echo site_url('setting/menu') ?>"><button class="btn btn-primary waves-effect">Daftar Menu</button></a>
                                        <a href="<?php echo site_url('setting/user') ?>"><button class="btn btn-warning waves-effect">Daftar User</button></a>
                                    </div>
                                </div>
                                <div class="row clearfix" style="margin-top:30px">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="info-box bg-blue hover-expand-effect">
                                            <div class="icon">
                                                <i class="material-icons">list</i>
                                            </div>
                                            <div class="content">
                                                <div class="text">Menu</div>
                                                <div class="number count-to" data-from="0" data-to="<?php echo $count_words ?>" data-speed="15" data-fresh-interval="20"><?php echo $count_words ?></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="info-box bg-orange hover-expand-effect">
                                            <div class="icon">
                                                <i class="material-icons">people</i>
                                            </div>
                                            <div class="content">
                                                <div class="text">User</div>
                                                <div class="number count-to" data-from="0" data-to="<?php echo $count_languages ?>" data-speed="1000" data-fresh-interval="20"><?php echo $count_languages ?></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-8 text-right">
                                <img src="<?php echo base_url('assets/flat-img.png') ?>" alt="">
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>