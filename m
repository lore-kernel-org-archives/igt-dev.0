Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF2010F77D
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 18:57:39 +0000 (UTC)
Message-ID: <9a970d6e-1ba3-b7ff-d9b4-9a9ad0079c02@amd.com>
Date: Mon, 9 May 2022 14:57:34 -0400
Content-Language: en-US
To: David Zhang <dingchen.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20220505213226.2614662-1-dingchen.zhang@amd.com>
 <20220505213226.2614662-3-dingchen.zhang@amd.com>
From: Leo <sunpeng.li@amd.com>
In-Reply-To: <20220505213226.2614662-3-dingchen.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/4] tests/amdgpu/amd_psr: clean-up the code
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
> We'd clean-up the code to avoid repeated variable declarations in
> different psr-su test cases.
> 
> [how]
> - add primary/overlay framebuffer width/height to generic data
>   structure
> - add cursor framebuffer instance to data structure
> - clean-up the code for mpo/ffu/cusor test cases by using above
>   re-useable variables
> 
> Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Jay Pillai <aurabindo.pillai@amd.com>
> Cc: Wayne Lin <wayne.lin@amd.com>
> 
> Signed-off-by: David Zhang <dingchen.zhang@amd.com>

Reviewed-by: Leo Li <sunpeng.li@amd.com>

> ---
>  tests/amdgpu/amd_psr.c | 65 +++++++++++++++++++-----------------------
>  1 file changed, 30 insertions(+), 35 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
> index 5d190720..29982605 100644
> --- a/tests/amdgpu/amd_psr.c
> +++ b/tests/amdgpu/amd_psr.c
> @@ -56,12 +56,14 @@ typedef struct data {
>  	igt_pipe_crc_t *pipe_crc;
>  	igt_fb_t ov_fb[2];
>  	igt_fb_t pm_fb[2];
> +	igt_fb_t cs_fb;		/* cursor framebuffer */
>  	drmModeModeInfo *mode;
>  	enum pipe pipe_id;
>  	int fd;
>  	int debugfs_fd;
> -	int w;
> -	int h;
> +	int w, h;
> +	int pfb_w, pfb_h;
> +	int ofb_w, ofb_h;
>  } data_t;
>  
>  enum cursor_move {
> @@ -170,6 +172,10 @@ static void test_init(data_t *data)
>  
>  	data->w = data->mode->hdisplay;
>  	data->h = data->mode->vdisplay;
> +	data->ofb_w = data->w;
> +	data->ofb_h = data->h;
> +	data->pfb_w = data->w / 2;
> +	data->pfb_h = data->h / 2;
>  
>  	if (opt.visual_confirm) {
>  		/**
> @@ -308,7 +314,6 @@ static void run_check_psr(data_t *data, bool test_null_crtc) {
>  static void run_check_psr_su_mpo(data_t *data)
>  {
>  	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
> -	igt_fb_t ov_fb;		/* fb for overlay */
>  	igt_fb_t rect_fb[N_MPO_TEST_RECT_FB]; 	/* rectangle fbs for primary, emulate as video playback region */
>  	igt_fb_t ref_fb;	/* reference fb */
>  	igt_fb_t *flip_fb;
> @@ -341,28 +346,28 @@ static void run_check_psr_su_mpo(data_t *data)
>  	 * thus the overlay fb be initialized w/ ARGB pixel format to support blending
>  	 */
>  	igt_create_color_fb(data->fd, data->w, data->h, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
> -			    1.0, 1.0, 1.0, &ov_fb);
> +			    1.0, 1.0, 1.0, &data->ov_fb[0]);
>  	for (int i = 0; i < N_MPO_TEST_RECT_FB; ++i) {
>  		cairo_t *cr;
>  		int strip_w = data->w / (2 * N_MPO_TEST_RECT_FB);
>  
> -		igt_create_fb(data->fd, data->w / 2, data->h / 2, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +		igt_create_fb(data->fd, data->pfb_w, data->pfb_h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>  			      &rect_fb[i]);
>  		cr = igt_get_cairo_ctx(data->fd, &rect_fb[i]);
>  		igt_assert_f(cr, "Failed to get cairo context\n");
>  		/* background in black */
> -		igt_paint_color(cr, 0, 0, data->w / 2, data->h / 2, .0, .0, .0);
> +		igt_paint_color(cr, 0, 0, data->pfb_w, data->pfb_h, .0, .0, .0);
>  		/* foreground (megenta strip) */
> -		igt_paint_color(cr, i * strip_w, 0, strip_w, data->h / 2, 1.0, .0, 1.0);
> +		igt_paint_color(cr, i * strip_w, 0, strip_w, data->pfb_h, 1.0, .0, 1.0);
>  
>  		igt_put_cairo_ctx(cr);
>  	}
>  
>  	/* tie fbs to planes and set position/size/blending */
> -	igt_plane_set_fb(data->overlay, &ov_fb);
> +	igt_plane_set_fb(data->overlay, &data->ov_fb[0]);
>  	igt_plane_set_fb(data->primary, &rect_fb[0]);
>  	igt_plane_set_position(data->primary, 0, 0);
> -	igt_plane_set_size(data->primary, data->w / 2, data->h / 2);
> +	igt_plane_set_size(data->primary, data->pfb_w, data->pfb_h);
>  
>  	/**
>  	 * adjust alpha for vpb (primary plane) region in overlay
> @@ -375,7 +380,7 @@ static void run_check_psr_su_mpo(data_t *data)
>  	 * of each pixel in overlay corresponding to primary plane position/size
>  	 * to be zero.
>  	 */
> -	draw_color_alpha(&ov_fb, 0, 0, data->w / 2, data->h / 2, .5, .5, .5, .0);
> +	draw_color_alpha(&data->ov_fb[0], 0, 0, data->pfb_w, data->pfb_h, .5, .5, .5, .0);
>  
>  	igt_output_set_pipe(data->output, data->pipe_id);
>  	igt_display_commit_atomic(&data->display, 0, NULL);
> @@ -398,7 +403,7 @@ static void run_check_psr_su_mpo(data_t *data)
>  
>  	/* fini */
>  	igt_remove_fb(data->fd, &ref_fb);
> -	igt_remove_fb(data->fd, &ov_fb);
> +	igt_remove_fb(data->fd, &data->ov_fb[0]);
>  	for (int i = 0; i < N_MPO_TEST_RECT_FB; ++i)
>  		igt_remove_fb(data->fd, &rect_fb[i]);
>  	test_fini(data);
> @@ -438,17 +443,13 @@ static void panning_rect_fb(data_t *data, igt_fb_t *rect_fb, int rect_w, int rec
>  static void run_check_psr_su_ffu(data_t *data)
>  {
>  	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
> -	igt_fb_t rect_fb; 	/* rectangle fbs for primary */
>  	igt_fb_t ref_fb;	/* reference fb */
> -	int pb_w, pb_h;
>  
>  	/* skip the test run if no eDP sink detected */
>  	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
>  
>  	/* init */
>  	test_init(data);
> -	pb_w = data->w / 2;
> -	pb_h = data->h / 2;
>  
>  	/* run the test i.i.f. eDP panel supports and kernel driver both support PSR-SU  */
>  	igt_skip_on(!psr_su_supported(data));
> @@ -492,26 +493,26 @@ static void run_check_psr_su_ffu(data_t *data)
>  	/* step 1 */
>  	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, &data->ov_fb[0]);
>  	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, &data->ov_fb[1]);
> -	igt_create_color_fb(data->fd, pb_w, pb_h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> -			    1.0, .0, 1.0, &rect_fb); /* magenta primary */
> +	igt_create_color_fb(data->fd, data->pfb_w, data->pfb_h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    1.0, .0, 1.0, &data->pm_fb[0]); /* magenta primary */
>  
>  	/* step 2 & 3 */
> -	panning_rect_fb(data, &rect_fb, pb_w, pb_h, 0, 0);
> +	panning_rect_fb(data, &data->pm_fb[0], data->pfb_w, data->pfb_h, 0, 0);
>  	sleep(5);
>  
>  	/* step 4 & 5 */
> -	panning_rect_fb(data, &rect_fb, pb_w, pb_h, pb_w / 2, pb_h / 2);
> +	panning_rect_fb(data, &data->pm_fb[0], data->pfb_w, data->pfb_h, data->pfb_w / 2, data->pfb_h / 2);
>  	sleep(5);
>  
>  	/* step 6 & 7 */
> -	panning_rect_fb(data, &rect_fb, pb_w, pb_h, pb_w, pb_h);
> +	panning_rect_fb(data, &data->pm_fb[0], data->pfb_w, data->pfb_h, data->pfb_w, data->pfb_h);
>  	sleep(5);
>  
>  	/* fini */
>  	igt_remove_fb(data->fd, &ref_fb);
>  	igt_remove_fb(data->fd, &data->ov_fb[0]);
>  	igt_remove_fb(data->fd, &data->ov_fb[1]);
> -	igt_remove_fb(data->fd, &rect_fb);
> +	igt_remove_fb(data->fd, &data->pm_fb[0]);
>  	test_fini(data);
>  }
>  
> @@ -556,21 +557,15 @@ static void test_cursor_movement(data_t *data, int iters, int cs_size, enum curs
>  static void run_check_psr_su_cursor(data_t *data, bool test_mpo)
>  {
>  	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
> -	igt_fb_t cs_fb;		/* cursor FB */
>  	const int cs_size = 128;
>  	const int delay_sec = 5; /* seconds */
>  	int frame_rate = 0;
> -	int pb_w, pb_h, ob_w, ob_h;
>  
>  	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
>  
>  	test_init(data);
>  	igt_skip_on(!psr_su_supported(data));
>  
> -	ob_w = data->w;
> -	ob_h = data->h;
> -	pb_w = data->w / 2;
> -	pb_h = data->h / 2;
>  	frame_rate = data->mode->vrefresh;
>  
>  	/*
> @@ -578,26 +573,26 @@ static void run_check_psr_su_cursor(data_t *data, bool test_mpo)
>  	 * - create primary FBs of quarter screen size of different colors (blue and green)
>  	 * - create overlay FB of screen size of white color (default alpha 1.0)
>  	 */
> -	igt_create_color_fb(data->fd, pb_w, pb_h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +	igt_create_color_fb(data->fd, data->pfb_w, data->pfb_h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>  			    .0, .0, 1.0, &data->pm_fb[0]);
> -	igt_create_color_fb(data->fd, pb_w, pb_h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +	igt_create_color_fb(data->fd, data->pfb_w, data->pfb_h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>  			    .0, 1.0, .0, &data->pm_fb[1]);
> -	igt_create_color_fb(data->fd, ob_w, ob_h, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
> +	igt_create_color_fb(data->fd, data->ofb_w, data->ofb_h, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
>  			    1.0, 1.0, 1.0, &data->ov_fb[0]);
>  
>  	/* cursor FB creation, draw cursor pattern/set alpha regions */
> -	igt_create_fb(data->fd, cs_size, cs_size, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, &cs_fb);
> -	draw_color_cursor(&cs_fb, cs_size, 1.0, .0, 1.0);
> +	igt_create_fb(data->fd, cs_size, cs_size, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, &data->cs_fb);
> +	draw_color_cursor(&data->cs_fb, cs_size, 1.0, .0, 1.0);
>  
>  	/*
>  	 * panning the primary plane at the top-left of screen
>  	 * set alpha region in overlay plane and set alpha to 0.0 to show primary plane
>  	 * set cursor plane and starting from position of (0, 0)
>  	 */ 
> -	draw_color_alpha(&data->ov_fb[0], 0, 0, pb_w, pb_h, 1.0, 1.0, 1.0, .0);
> +	draw_color_alpha(&data->ov_fb[0], 0, 0, data->pfb_w, data->pfb_h, 1.0, 1.0, 1.0, .0);
>  	igt_plane_set_fb(data->primary, &data->pm_fb[0]);
>  	igt_plane_set_fb(data->overlay, &data->ov_fb[0]);
> -	igt_plane_set_fb(data->cursor, &cs_fb);
> +	igt_plane_set_fb(data->cursor, &data->cs_fb);
>  	igt_plane_set_position(data->cursor, 0, 0);
>  
>  	igt_output_set_pipe(data->output, data->pipe_id);
> @@ -624,7 +619,7 @@ static void run_check_psr_su_cursor(data_t *data, bool test_mpo)
>  
>  	igt_remove_fb(data->fd, &data->pm_fb[0]);
>  	igt_remove_fb(data->fd, &data->pm_fb[1]);
> -	igt_remove_fb(data->fd, &cs_fb);
> +	igt_remove_fb(data->fd, &data->cs_fb);
>  	igt_remove_fb(data->fd, &data->ov_fb[0]);
>  	test_fini(data);
>  }
