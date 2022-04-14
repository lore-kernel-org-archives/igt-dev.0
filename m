Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32BDB10E46B
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Apr 2022 15:26:05 +0000 (UTC)
Message-ID: <8238b71f-08da-d627-a45d-6423db926feb@amd.com>
Date: Thu, 14 Apr 2022 11:25:58 -0400
Content-Language: en-US
To: David Zhang <dingchen.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20220412192139.1530645-1-dingchen.zhang@amd.com>
 <20220412192139.1530645-3-dingchen.zhang@amd.com>
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20220412192139.1530645-3-dingchen.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v3 2/3] tests/amdgpu/amd_psr: add PSR-SU full
 frame update sub test case
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




On 2022-04-12 15:21, David Zhang wrote:
> [why]
> We need a full-frame update (FFU) test case to validate PSR-SU
> feature enablement by visual confirm.
> 
> [how]
> 1. create two overlay FBs with full screen size and one primary FB
>     w/ 1/4 screen size
> 2. panning the primary plane to top-left and flip for couple of
>     frames
> 3. wait for couple of seconds to allow visual confirm
> 4. panning the primary plane from top-left to middle of screen
> 5. repeat step 3
> 6. panning the primary plane from middle to bottom-right of screen
> 7. repeat step 3
> 
> If the PSR-SU is enabled as expected, for FFU we'd observe the
> visual confirm by seeing the blue border at the bottom of screen
> and the bottom of primary plane (megenta rectangle) as well.
> 
> Changes in v2:
> ----------------
> - drop the unnecessary helper panning_pfb_and_psrsu_check() and
>    collapse the operations into run_check_psr_su_ffu()
> - initial the two overlay FBs w/ global alpha and different color
>    not to update the specific alpha region for each panning of the
>    primary plane.
> 
> Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Jay Pillai <aurabindo.pillai@amd.com>
> Cc: Wayne Lin <wayne.lin@amd.com>
> 
> Signed-off-by: David Zhang <dingchen.zhang@amd.com>
> ---
>   tests/amdgpu/amd_psr.c | 111 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 111 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
> index 0ec50c9f..92628fee 100644
> --- a/tests/amdgpu/amd_psr.c
> +++ b/tests/amdgpu/amd_psr.c
> @@ -54,6 +54,7 @@ typedef struct data {
>   	igt_output_t *output;
>   	igt_pipe_t *pipe;
>   	igt_pipe_crc_t *pipe_crc;
> +	igt_fb_t ov_fb[2];
>   	drmModeModeInfo *mode;
>   	enum pipe pipe_id;
>   	int fd;
> @@ -75,6 +76,7 @@ static void draw_color_alpha(igt_fb_t *fb, int x, int y, int w, int h,
>   
>   	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
>   	igt_paint_color_alpha(cr, x, y, w, h, r, g, b, a);
> +	cairo_set_operator(cr, CAIRO_OPERATOR_OVER);
>   
>   	igt_put_cairo_ctx(cr);
>   }
> @@ -308,6 +310,111 @@ static void run_check_psr_su_mpo(data_t *data)
>   	test_fini(data);
>   }
>   
> +static void panning_rect_fb(data_t *data, igt_fb_t *rect_fb, int rect_w, int rect_h, int curr_x, int curr_y)
> +{
> +	int ret;
> +
> +	/* set new position for primary plane */
> +	igt_plane_set_position(data->primary, curr_x, curr_y);
> +
> +	/* flip overlay for couple of frames */
> +	igt_info("\n start flipping ...\n");
> +	for (int i = 0; i < N_FLIPS; ++i) {
> +		igt_info(" About to commit overlay w/ alpha updated in region (x=%d, y=%d, w=%d, h=%d), loop %d \n",
> +			 curr_x, curr_y, rect_w, rect_h, i);
> +
> +		/* do flip overlay */
> +		igt_plane_set_fb(data->overlay, &data->ov_fb[i % 2]);
> +		igt_plane_set_fb(data->primary, rect_fb);
> +		igt_plane_set_size(data->primary, rect_w, rect_h);
> +		igt_output_set_pipe(data->output, data->pipe_id);
> +
> +		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +		igt_require(ret == 0);
> +		kmstest_wait_for_pageflip(data->fd);
> +	}
> +}
> +
> +static void run_check_psr_su_ffu(data_t *data)
> +{
> +	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
> +	bool sink_support_psrsu = false;
> +	bool drv_suport_psrsu = false;
> +	igt_fb_t rect_fb; 	// rectangle fbs for primary
> +	igt_fb_t ref_fb;	// reference fb
> +	int pb_w, pb_h, ob_w, ob_h;
> +
> +	/* skip the test run if no eDP sink detected */
> +	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
> +
> +	/* init */
> +	test_init(data);
> +	ob_w = data->w;
> +	ob_h = data->h;
> +	pb_w = data->w / 2;
> +	pb_h = data->h / 2;
> +
> +	/* run the test i.i.f. eDP panel supports and kernel driver both support PSR-SU  */
> +	igt_skip_on(!igt_amd_output_has_psr_cap(data->fd, data->output->name));
> +	igt_skip_on(!igt_amd_output_has_psr_state(data->fd, data->output->name));
> +	sink_support_psrsu = igt_amd_psr_support_sink(data->fd, data->output->name, PSR_MODE_2);
> +	igt_skip_on_f(!sink_support_psrsu, "output %s not support PSR-SU\n", data->output->name);
> +	drv_suport_psrsu = igt_amd_psr_support_drv(data->fd, data->output->name, PSR_MODE_2);
> +	igt_skip_on_f(!drv_suport_psrsu, "kernel driver not support PSR-SU\n");
> +
> +	/* reference background pattern in grey */
> +	igt_create_color_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    .5, .5, .5, &ref_fb);
> +	igt_plane_set_fb(data->primary, &ref_fb);
> +	igt_output_set_pipe(data->output, data->pipe_id);
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +	/*
> +	 * overlay and primary fbs creation
> +	 * for full frame update (FFU) test case, we don't change primary FB content but to change
> +	 * the position of primary FB (panning) and update the overlay plane alpha region.
> +	 * Any overlay change is expected to be regarded as FFU from KMD's perspective.
> +	 *
> +	 * 1. create two overlay FBs with full screen size and one primary FB w/ 1/4 screen size
> +	 * 2. panning the primary plane to top-left and flip for couple of frames
> +	 * 3. wait for couple of seconds to allow visual confirm
> +	 * 4. panning the primary plane from top-left to middle of screen
> +	 * 5. repeat step 3
> +	 * 6. panning the primary plane from middle to bottom-right of screen
> +	 * 7. repeat step 3
> +	 */
> +
> +	/* step 1 */
> +	igt_create_color_fb(data->fd, ob_w, ob_h, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    1.0, 1.0, 1.0, &data->ov_fb[0]);
> +	draw_color_alpha(&data->ov_fb[0], 0, 0, ob_w, ob_h, 1.0, 1.0, 1.0, .3);

Looks like we're setting the entire overlay fb as translucent (0.3
alpha), interesting...

Though this should still trigger a full-frame-update when flipping,
visually this might be strange. We'll see the undefined background color
in areas not covered by the primary plane:

+----------------------------+
| +-------------+            |
| |             |            |
| |  Primary    |            |    0.7 of background color shown
| |  (alpha=1.0)|     <---------- outside of primary plane
| +-------------+            |
|    Overlay                 |
|    (alpha=0.3)             |
+----------------------------+

Ideally we only want 0.0 alpha over the primary plane region, with the
rest as solid (1.0) alpha:
+----------------------------+
| +-------------+            |
| |             |            |
| |  Primary  <------------------ Overlay alpha=0.0 over
| |  (alpha=1.0)|            |    primary plane region
| +-------------+            |
|    Overlay                 |
|    (alpha=1.0)             |
+----------------------------+

We can do this as part of panning_rect_fb(), something like so:

```
/* Update primary plane position and size */
igt_plane_set_position(data->primary, curr_x, curr_y);
igt_plane_set_size(data->primary, rect_w, rect_h);

/* Fill in entire overlay plane with different colors and 1.0 alpha */
draw_color_alpha(&data->ov_fb[0], 0, 0, ob_w, ob_h, 0.5, 0.5, 0.5, 1.0);
draw_color_alpha(&data->ov_fb[1], 0, 0, ob_w, ob_h, 1.0, 1.0, 1.0, 1.0);

/* Fill in new alpha region */
draw_color_alpha(&data->ov_fb[0], curr_x, curr_y, rect_w, rect_h,
                  0.5, 0.5, 0.5, 0.0);
draw_color_alpha(&data->ov_fb[1], curr_x, curr_y, rect_w, rect_h,
                  1.0, 1.0, 1.0, 0.0);

/* flip loop */
for (int i = 0; i < N_FLIPS; ++i) {
...
```

Thanks,
Leo

> +	igt_create_color_fb(data->fd, ob_w, ob_h, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    1.0, 1.0, 1.0, &data->ov_fb[1]);
> +	draw_color_alpha(&data->ov_fb[1], 0, 0, ob_w, ob_h, .0, 1.0, .0, .3);
> +
> +	igt_create_color_fb(data->fd, pb_w, pb_h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    1.0, .0, 1.0, &rect_fb);
> +
> +	/* step 2 & 3 */
> +	panning_rect_fb(data, &rect_fb, pb_w, pb_h, 0, 0);
> +	sleep(5);
> +
> +	/* step 4 & 5 */
> +	panning_rect_fb(data, &rect_fb, pb_w, pb_h, pb_w / 2, pb_h / 2);
> +	sleep(5);
> +
> +	/* step 6 & 7 */
> +	panning_rect_fb(data, &rect_fb, pb_w, pb_h, pb_w, pb_h);
> +	sleep(5);
> +
> +	/* fini */
> +	igt_remove_fb(data->fd, &ref_fb);
> +	igt_remove_fb(data->fd, &data->ov_fb[0]);
> +	igt_remove_fb(data->fd, &data->ov_fb[1]);
> +	igt_remove_fb(data->fd, &rect_fb);
> +	test_fini(data);
> +}
> +
>   const char *help_str =
>   "  --visual-confirm           PSR visual confirm debug option enable\n";
>   
> @@ -367,6 +474,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		     "and to imitate Multiplane Overlay video playback scenario");
>   	igt_subtest("psr_su_mpo") run_check_psr_su_mpo(&data);
>   
> +	igt_describe("Test to validate PSR SU enablement with Visual Confirm "
> +		     "and to validate Full Frame Update scenario");
> +	igt_subtest("psr_su_ffu") run_check_psr_su_ffu(&data);
> +
>   	igt_fixture
>   	{
>   		if (opt.visual_confirm) {
