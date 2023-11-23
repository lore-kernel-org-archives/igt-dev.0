Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6F910E724
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Nov 2023 12:01:42 +0000 (UTC)
Date: Thu, 23 Nov 2023 13:01:21 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231123120121.usufobwpktsxph3r@kamilkon-desk.igk.intel.com>
References: <20231121055900.1967991-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231121055900.1967991-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t] tests/intel/kms_big_joiner: Fix dangling
 pointer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanuprakash,
On 2023-11-21 at 11:29:00 +0530, Bhanuprakash Modem wrote:
> Fix the usage of dangling pointer:
> Stack trace:
>  #0 [fatal_sig_handler+0x175]
>  #1 [__sigaction+0x50]
>  #2 [__igt_unique____real_main220+0x32d]
>  #3 [main+0x2d]
>  #4 [__libc_init_first+0x90]
>  #5 [__libc_start_main+0x80]
>  #6 [_start+0x25]
> 
> Fixes: a6ca34472 tests/i915/kms_big_joiner: Fix Bigjoiner checks
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/intel/kms_big_joiner.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> index 2f81204f5..3b6dc530b 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -221,7 +221,7 @@ igt_main
>  {
>  	data_t data;
>  	igt_output_t *output;
> -	drmModeModeInfo *mode;
> +	drmModeModeInfo mode;

What about allocate memory wit calloc?
With or without this,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  	int valid_output = 0, i, count = 0, j = 0;
>  	uint16_t width = 0, height = 0;
>  	enum pipe pipe_seq[IGT_MAX_PIPES];
> @@ -243,17 +243,17 @@ igt_main
>  			 * Bigjoiner will come in to the picture when the
>  			 * resolution > 5K or clock > max-dot-clock.
>  			 */
> -			found = (bigjoiner_mode_found(connector, sort_drm_modes_by_res_dsc, mode) ||
> -				 bigjoiner_mode_found(connector, sort_drm_modes_by_clk_dsc, mode)) ?
> +			found = (bigjoiner_mode_found(connector, sort_drm_modes_by_res_dsc, &mode) ||
> +				 bigjoiner_mode_found(connector, sort_drm_modes_by_clk_dsc, &mode)) ?
>  					true : false;
>  
>  			if (found) {
>  				data.output[count].output_id = output->id;
> -				memcpy(&data.output[count].mode, mode, sizeof(drmModeModeInfo));
> +				memcpy(&data.output[count].mode, &mode, sizeof(drmModeModeInfo));
>  				count++;
>  
> -				width = max(width, mode->hdisplay);
> -				height = max(height, mode->vdisplay);
> +				width = max(width, mode.hdisplay);
> +				height = max(height, mode.vdisplay);
>  			}
>  			valid_output++;
>  		}
> @@ -290,9 +290,9 @@ igt_main
>  			if (data.output[0].output_id != output->id)
>  				continue;
>  
> -			mode = &data.output[0].mode;
> +			mode = data.output[0].mode;
>  			igt_output_set_pipe(output, data.pipe1);
> -			igt_output_override_mode(output, mode);
> +			igt_output_override_mode(output, &mode);
>  
>  			igt_dynamic_f("pipe-%s-%s",
>  				      kmstest_pipe_name(data.pipe1),
> @@ -311,10 +311,10 @@ igt_main
>  				for_each_connected_output(&data.display, output) {
>  					if (data.output[0].output_id == output->id) {
>  						first_output = output;
> -						mode = &data.output[0].mode;
> +						mode = data.output[0].mode;
>  
>  						igt_output_set_pipe(output, data.pipe1);
> -						igt_output_override_mode(output, mode);
> +						igt_output_override_mode(output, &mode);
>  					} else if (second_output == NULL) {
>  						second_output = output;
>  						igt_output_set_pipe(output, data.pipe2);
> -- 
> 2.40.0
> 
