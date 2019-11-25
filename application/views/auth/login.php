<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form action="<?php echo site_url('auth/cek_user') ?>" method="post" class="login100-form validate-form">
					<span class="login100-form-title p-b-43">
						<strong style="color:#E5294F">Coreigniter V.1</strong>
						<p>Login Untuk Melanjutkan</p>
					</span>


					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="email" name="email">
						<span class="focus-input100"></span>
						<span class="label-input100">Email</span>
					</div>


					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="password">
						<span class="focus-input100"></span>
						<span class="label-input100">Password</span>
					</div>

					<div class="">
            <?php
              if($this->session->flashdata('alert')){
                echo $this->session->flashdata('alert');
              }?>
					</div>


					<div class="container-login100-form-btn">
						<button class="login100-form-btn" style="background-color:#E5294F!important">
							Login
						</button>
					</div>

				</form>

				<div class="login100-more" style="background-image: url('<?php echo base_url('assets/auth/');?>images/bg-01.jpg');">
				</div>
			</div>
		</div>
	</div>
