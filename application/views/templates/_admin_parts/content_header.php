 <div class="header">
     <div class="row clearfix" style="">
         <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
             <h2>
                 <?php echo strtoupper($header) ?>
                 <small><?php echo ucfirst($sub_header) ?></small>
             </h2>
         </div>
         <!-- search form -->
         <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
             <div class="row clearfix">
                 <form method="get" action="<?php echo site_url($current_page) ?>">
                     <div class="col-lg-8">
                         <div class="row clearfix">
                             <div class="col-lg-4 col-sm-4 col-xs-4">
                                 <select class="form-control show-tick" id="limit" name="limit" onchange="changeLimit()">
                                     <?php
                                        $arr = [10, 20, 50, 100];
                                        $limit = $this->input->get('limit');

                                        $selected = null;
                                        foreach ($arr as $value) {
                                            if ($limit != null || $limit = '') {
                                                if ($value == $limit) {
                                                    $selected = 'selected';
                                                } else {
                                                    $selected = null;
                                                }
                                            }
                                            echo '<option value="' . $value . '" ' . $selected . '>' . $value . '</option>';
                                        }
                                        ?>

                                 </select>
                             </div>
                             <div class="col-lg-8 col-sm-8 col-xs-8">
                                 <div class="form-group">
                                     <div class="form-line">
                                         <input type="text" name="key" class="form-control" placeholder="Pencarian" value="<?php echo ($key) ? $key : '' ?>">
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                     <div class="col-lg-4 text-right">
                         <div class="btn-group">
                             <button type="submit" class="btn btn-warning btn-md m-l-15 waves-effect"><i class="material-icons">search</i></button>
                             <a href="<?php echo site_url($current_page); ?>" type="button" class="btn btn-warning btn-md m-l-15 waves-effect"><i class="material-icons">refresh</i></a>
                         </div>
                         <?php if (!isset($id) || $id == null) : ?>
                             <a href="<?php echo site_url($current_page . '/create') ?>" class="btn btn-lg btn-primary">Tambah</a>
                         <?php else : ?>
                             <a href="<?php echo site_url($current_page . '/create/'.$id) ?>" class="btn btn-lg btn-primary">Tambah</a>
                         <?php endif; ?>
                     </div>
                 </form>

             </div>
         </div>
     </div>
 </div>