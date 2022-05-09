Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BFA10EAD0
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 20:27:55 +0000 (UTC)
Message-ID: <20128339-8606-40ab-2716-671ae6fb0d89@amd.com>
Date: Mon, 9 May 2022 16:27:50 -0400
Content-Language: en-US
To: David Zhang <dingchen.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20220505213226.2614662-1-dingchen.zhang@amd.com>
 <20220505213226.2614662-5-dingchen.zhang@amd.com>
From: Leo <sunpeng.li@amd.com>
In-Reply-To: <20220505213226.2614662-5-dingchen.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 4/4] tests/amdgpu/amd_psr: add PSR-SU scaling
 test cases
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



On 2022-05-05 17:32, David Zhang wrote:
> [why]
> We need test cases to validate PSR-SU disabled when a specific
> plane scaling occurs by visual confirm. From driver's perspective,
> any plane's height/width change detected, it would cause PSR-SU
> be disabled.
> 
> [how]
> - based on the existed MPO test case, we'd add two more input
>   arguments to the test function, i.e. one as flag indicating if
>   to test scaling, another as scaling ratio for the primary plane
> - start from 1/3 iteration in test run, scaling the primary plane
>   w/ the given ratio and update the overlay as well, and observe
>   if PSR-SU is disabled as expected by allowing some delay to
>   check
> - add two sub-test cases, one w/ scaling ratio 1.5, another 0.75
> 
> Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Jay Pillai <aurabindo.pillai@amd.com>
> Cc: Wayne Lin <wayne.lin@amd.com>
> 
> Signed-off-by: David Zhang <dingchen.zhang@amd.com>

Reviewed-by: Leo Li <sunpeng.li@amd.com>

Thanks!
> ---
>  tests/amdgpu/amd_psr.c | 41 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
> index 81ebebd3..5ad8c7fe 100644
> --- a/tests/amdgpu/amd_psr.c
> +++ b/tests/amdgpu/amd_psr.c
> @@ -335,7 +335,7 @@ static void run_check_psr(data_t *data, bool test_null_crtc) {
>  	test_fini(data);
>  }
>  
> -static void run_check_psr_su_mpo(data_t *data)
> +static void run_check_psr_su_mpo(data_t *data, bool scaling, float scaling_ratio)
>  {
>  	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
>  	igt_fb_t ref_fb;	/* reference fb */
> @@ -344,6 +344,7 @@ static void run_check_psr_su_mpo(data_t *data)
>  	const int run_sec = 5;
>  	int frame_rate = 0;
>  	pos_t old[2], new;
> +	int pm_w_scale, pm_h_scale;	/* primary plane width/heigh after scaling */
>  
>  	/* skip the test run if no eDP sink detected */
>  	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
> @@ -355,6 +356,10 @@ static void run_check_psr_su_mpo(data_t *data)
>  	memset(&new, 0, sizeof(pos_t));
>  	old[0].w = old[1].w = new.w = 30;
>  	old[0].h = old[1].h = new.h = data->pfb_h;
> +	if (scaling) {
> +		pm_w_scale = (int) (data->pfb_w * scaling_ratio);
> +		pm_h_scale = (int) (data->pfb_h * scaling_ratio);
> +	}
>  
>  	/* run the test i.i.f. eDP panel supports and kernel driver both support PSR-SU  */
>  	igt_skip_on(!psr_su_supported(data));
> @@ -375,6 +380,8 @@ static void run_check_psr_su_mpo(data_t *data)
>  	 */
>  	igt_create_color_fb(data->fd, data->w, data->h, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
>  			    1.0, 1.0, 1.0, &data->ov_fb[0]);
> +	igt_create_color_fb(data->fd, data->w, data->h, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    1.0, 1.0, 1.0, &data->ov_fb[1]);
>  	igt_create_color_fb(data->fd, data->pfb_w, data->pfb_h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>  			    .0, .0, .0, &data->pm_fb[0]);
>  	igt_create_color_fb(data->fd, data->pfb_w, data->pfb_h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> @@ -398,6 +405,7 @@ static void run_check_psr_su_mpo(data_t *data)
>  	 * to be zero.
>  	 */
>  	draw_color_alpha(&data->ov_fb[0], 0, 0, data->pfb_w, data->pfb_h, .5, .5, .5, .0);
> +	draw_color_alpha(&data->ov_fb[1], 0, 0, pm_w_scale, pm_h_scale, .5, .5, .5, .0);
>  
>  	igt_output_set_pipe(data->output, data->pipe_id);
>  	igt_display_commit_atomic(&data->display, 0, NULL);
> @@ -411,12 +419,32 @@ static void run_check_psr_su_mpo(data_t *data)
>  		update_color_strip(flip_fb, &old[i & 1], &new, 1.0, .0, 1.0);
>  
>  		igt_plane_set_fb(data->primary, flip_fb);
> +		igt_plane_set_position(data->primary, 0, 0);
> +		/* do scaling at 1/3 iteration, update both primary/overlay */
> +		if (scaling && (i >= run_sec * frame_rate / 3)) {
> +			igt_plane_set_fb(data->overlay, &data->ov_fb[1]);
> +			igt_plane_set_size(data->primary, pm_w_scale, pm_h_scale);
> +		}
>  		igt_output_set_pipe(data->output, data->pipe_id);
>  
>  		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
>  		igt_require(ret == 0);
>  		kmstest_wait_for_pageflip(data->fd);
>  
> +		/**
> +		 * allow some time to observe visual confirm of PSR-SU disabled
> +		 * once the plane scaling occurs, i.e. green bar on the right side
> +		 * screen disappears. From driver's view, the PSR-SU would be
> +		 * disabled when the specific plane height/width detected changed.
> +		 * and w/ the test run continues, each MPO FB is scaled to the same
> +		 * size as the first scaled frame, then the PSR-SU is expected to
> +		 * be re-enabled and green bar should be appear again if visual
> +		 * confirm debug option is ON.
> +		 */
> +		if (scaling && (i == run_sec * frame_rate / 3)) {
> +			sleep(2);
> +		}
> +
>  		/* update strip position */
>  		old[i & 1].x = new.x;
>  		new.x += 3;
> @@ -426,6 +454,7 @@ static void run_check_psr_su_mpo(data_t *data)
>  	/* fini */
>  	igt_remove_fb(data->fd, &ref_fb);
>  	igt_remove_fb(data->fd, &data->ov_fb[0]);
> +	igt_remove_fb(data->fd, &data->ov_fb[1]);
>  	igt_remove_fb(data->fd, &data->pm_fb[0]);
>  	igt_remove_fb(data->fd, &data->pm_fb[1]);
>  	test_fini(data);
> @@ -703,7 +732,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  
>  	igt_describe("Test to validate PSR SU enablement with Visual Confirm "
>  		     "and to imitate Multiplane Overlay video playback scenario");
> -	igt_subtest("psr_su_mpo") run_check_psr_su_mpo(&data);
> +	igt_subtest("psr_su_mpo") run_check_psr_su_mpo(&data, false, .0);
>  
>  	igt_describe("Test to validate PSR SU enablement with Visual Confirm "
>  		     "and to validate Full Frame Update scenario");
> @@ -717,6 +746,14 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  		     "and to validate cursor movement + MPO scenario");
>  	igt_subtest("psr_su_cursor_mpo") run_check_psr_su_cursor(&data, true);
>  
> +	igt_describe("Test to validate PSR SU enablement with Visual Confirm "
> +		     "and to validate PSR SU disable/re-enable w/ primary scaling ratio 1.5");
> +	igt_subtest("psr_su_mpo_scaling_1_5") run_check_psr_su_mpo(&data, true, 1.5);
> +
> +	igt_describe("Test to validate PSR SU enablement with Visual Confirm "
> +		     "and to validate PSR SU disable/re-enable w/ primary scaling ratio 0.75");
> +	igt_subtest("psr_su_mpo_scaling_0_75") run_check_psr_su_mpo(&data, true, .75);
> +
>  	igt_fixture
>  	{
>  		if (opt.visual_confirm) {
