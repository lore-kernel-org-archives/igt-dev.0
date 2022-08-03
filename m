Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1DA10E4E8
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Aug 2022 07:41:10 +0000 (UTC)
Message-ID: <8e017daa-3499-0abf-208e-3f4ae8a7141e@intel.com>
Date: Wed, 3 Aug 2022 13:10:53 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220803042002.1929-1-nidhi1.gupta@intel.com>
 <20220803042002.1929-3-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220803042002.1929-3-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/2] tests/i915/kms_draw_crc: Test Cleanup
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

On Wed-03-08-2022 09:50 am, Nidhi Gupta wrote:
> v2: -Replace drm function call with existing library functions
>       (Bhanu)
> 
> v3: -Replace PIPE_A with compatible pipe/output combo.
>       (Bhanu)
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/i915/kms_draw_crc.c | 67 ++++++++++++++++-----------------------
>   1 file changed, 28 insertions(+), 39 deletions(-)
> 
> diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
> index edab2f3b..c1e395d6 100644
> --- a/tests/i915/kms_draw_crc.c
> +++ b/tests/i915/kms_draw_crc.c
> @@ -31,12 +31,13 @@
>   
>   struct modeset_params {
>   	uint32_t crtc_id;
> -	uint32_t connector_id;
>   	drmModeModeInfoPtr mode;
>   };
>   
>   int drm_fd;
> -drmModeResPtr drm_res;
> +igt_display_t display;
> +enum pipe pipe1;
> +igt_output_t *output;

We are nowhere using these pipe & output except setup_environment().
So, these variables are supposed to be local to setup_environment().

>   drmModeConnectorPtr drm_connectors[MAX_CONNECTORS];
>   struct buf_ops *bops;
>   igt_pipe_crc_t *pipe_crc;
> @@ -64,27 +65,33 @@ struct modeset_params ms;
>   
>   static void find_modeset_params(void)
>   {
> -	int i;
>   	uint32_t crtc_id;
> -	drmModeConnectorPtr connector = NULL;
> -	drmModeModeInfoPtr mode = NULL;
> +	drmModeModeInfo *mode;
>   
> -	for (i = 0; i < drm_res->count_connectors; i++) {
> -		drmModeConnectorPtr c = drm_connectors[i];
> +	igt_display_reset(&display);
> +	igt_display_commit(&display);
>   
> -		if (c->count_modes) {
> -			connector = c;
> -			mode = &c->modes[0];
> -			break;
> +	for_each_connected_output(&display, output) {
> +		for_each_pipe(&display, pipe1) {
> +			if (igt_pipe_connector_valid(pipe1, output))
> +				/*One pipe is enough*/
> +				break;
>   		}
> +		/*One output is enough*/
> +		break;

This is wrong. If no pipe is valid for first output, we need to try with 
next available output.

Instead, use for_each_pipe_with_valid_output() or 
for_each_pipe_with_single_output()

>   	}
> -	igt_require(connector);
>   
> -	crtc_id = kmstest_find_crtc_for_connector(drm_fd, drm_res, connector,
> -						  0);
> +	igt_info("pipe-%s-%s", kmstest_pipe_name(pipe1), output->name);
> +
> +	output = igt_get_single_output_for_pipe(&display, pipe1);
> +	igt_require(output);
> +	igt_output_set_pipe(output, pipe1);
> +
> +	mode = igt_output_get_mode(output);
>   	igt_assert(mode);
>   
> -	ms.connector_id = connector->connector_id;
> +	crtc_id = display.pipes[pipe1].crtc_id;
> +
>   	ms.crtc_id = crtc_id;

crtc_id is nowhere useful, please drop it.

>   	ms.mode = mode;
>   
> @@ -144,8 +151,7 @@ static void get_method_crc(enum igt_draw_method method, uint32_t drm_format,
>   	igt_draw_rect_fb(drm_fd, bops, 0, &fb, method, 1, 1, 15, 15,
>   			 get_color(drm_format, 0, 1, 1));
>   
> -	rc = drmModeSetCrtc(drm_fd, ms.crtc_id, fb.fb_id, 0, 0,
> -			    &ms.connector_id, 1, ms.mode);
> +	rc = igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);

hmm, Just realized that we are creating a fb and playing it, but not 
actually using it.

So, I guess we need to set the fb to any plane before commit. Otherwise, 
you'll get same CRC for any modifier/method/format combo, since we are 
not using any framebuffer.

Example: igt_plane_set_fb(primary, &fb);

>   	igt_assert_eq(rc, 0);
>   
>   	igt_pipe_crc_collect_crc(pipe_crc, crc);
> @@ -203,8 +209,7 @@ static void get_fill_crc(uint64_t modifier, igt_crc_t *crc)
>   
>   	igt_draw_fill_fb(drm_fd, &fb, 0xFF);
>   
> -	rc = drmModeSetCrtc(drm_fd, ms.crtc_id, fb.fb_id, 0, 0,
> -			    &ms.connector_id, 1, ms.mode);
> +	rc = igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_assert_eq(rc, 0);
>   
>   	igt_pipe_crc_collect_crc(pipe_crc, crc);
> @@ -227,8 +232,7 @@ static void fill_fb_subtest(void)
>   							 IGT_DRAW_MMAP_WC,
>   			 0, 0, fb.width, fb.height, 0xFF);
>   
> -	rc = drmModeSetCrtc(drm_fd, ms.crtc_id, fb.fb_id, 0, 0,
> -			    &ms.connector_id, 1, ms.mode);
> +	rc = igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_assert_eq(rc, 0);
>   
>   	igt_pipe_crc_collect_crc(pipe_crc, &base_crc);
> @@ -251,40 +255,25 @@ static void fill_fb_subtest(void)
>   
>   static void setup_environment(void)
>   {
> -	int i;
> -
>   	drm_fd = drm_open_driver_master(DRIVER_INTEL);
>   	igt_require(drm_fd >= 0);
> -
> -	drm_res = drmModeGetResources(drm_fd);
> -	igt_require(drm_res);
> -	igt_assert(drm_res->count_connectors <= MAX_CONNECTORS);
> -
> -	for (i = 0; i < drm_res->count_connectors; i++)
> -		drm_connectors[i] = drmModeGetConnectorCurrent(drm_fd,
> -							       drm_res->connectors[i]);
> +	igt_display_require(&display, drm_fd);
> +	igt_display_require_output(&display);
>   
>   	kmstest_set_vt_graphics_mode();
>   
>   	bops = buf_ops_create(drm_fd);
>   
>   	find_modeset_params();
> -	pipe_crc = igt_pipe_crc_new(drm_fd, kmstest_get_crtc_idx(drm_res, ms.crtc_id),
> -				    INTEL_PIPE_CRC_SOURCE_AUTO);
> +	pipe_crc = igt_pipe_crc_new(drm_fd, pipe1, INTEL_PIPE_CRC_SOURCE_AUTO);

We can move this statement to find_modset_parms() and drop pipe1 from 
global declaration.

>   }
>   
>   static void teardown_environment(void)
>   {
> -	int i;
> -
>   	igt_pipe_crc_free(pipe_crc);
>   
>   	buf_ops_destroy(bops);
>   
> -	for (i = 0; i < drm_res->count_connectors; i++)
> -		drmModeFreeConnector(drm_connectors[i]);
> -
> -	drmModeFreeResources(drm_res);

igt_output_set_pipe(PIPE_NONE);
or
igt_display_reset();

>   	close(drm_fd);
>   }
>   
