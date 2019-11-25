<section class="content">
  <div class="container-fluid">
    <div class="block-header">
      <div class="row">
        <div class="col-md-6">
          <h2><?php echo ucwords($block_header) ?></h2>
        </div>
        <div class="col-md-6 text-right">
          <?php echo $breadcrumb; ?>
        </div>
      </div>

    </div>
    <div class="row clearfix">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="card">
          <?php
          $this->load->view('templates/_admin_parts/content_header');

          ?>

          <div class="body table-responsive">
            <?php echo $alert ?>
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th>No</th>
                  <?php foreach ($table_header as $kh => $vh) : ?>
                    <th><?php echo $vh ?></th>
                  <?php endforeach; ?>

                  <th>Pilihan</th>
                </tr>
              </thead>
              <tbody>

                <?php
                if (!empty($for_table)) : //if array data in not empty, show table
                  $no = $number;
                  foreach ($for_table as $key => $value) :
                    $no++;
                    ?>
                    <tr>
                      <th scope="row"><?php echo $no ?></th>
                      <?php foreach ($table_header as $kh => $vh) : ?>
                        <td>
                          <?php
                                if ($kh == 'status') {
                                  switch ($value->{$kh}) {
                                    case '0':
                                      $b = '<span class="badge bg-red"> Non Active </span>';
                                      break;
                                    case '1':
                                      $b = '<span class="badge bg-green"> Active </span>';
                                      break;
                                  }
                                  echo $b;
                                } else {
                                  echo $value->{$kh};
                                }
                                ?></td>
                      <?php endforeach; ?>

                      <td style="text-align:center">
                        <div class="dropdown">
                          <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <i class="material-icons">settings</i>
                          </a>
                          <ul class="dropdown-menu pull-right">
                            <li><a href="<?php echo site_url($current_page . '/detail/' . $value->id .'?group_id='.$value->group_id) ?>" class=" waves-effect waves-block">Detail</a></li>
                            <li><a href="<?php echo site_url($current_page . '/edit/' . $value->id . '?group_id=' . $value->group_id) ?>" class=" waves-effect waves-block">Edit</a></li>
                            <li><a onclick="deleteId('<?php echo site_url($current_page . '/delete/') . $value->id . '?group_id=' . $value->group_id ?>')" class="waves-effect waves-block" data-toggle="modal" data-target="#deleteModal">Delete</a></li>

                          </ul>
                        </div>
                      </td>
                    </tr>
                  <?php
                    endforeach;
                  else :
                    ?>
                  <h3>Data Tidak Ditemukan</h3>
                <?php endif; ?>
              </tbody>
              <tfoot>
                <td colspan="<?php echo sizeof($table_header) + 1 ?>"><b>Total Data</b></td>
                <td class="text-center"><b><?php echo $total_data ?></b></td>
              </tfoot>
            </table>
            <div class="text-center">
              <?php if (isset($links)) echo $links ?>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<?php
$this->load->view('templates/_admin_parts/modal_delete');

?>