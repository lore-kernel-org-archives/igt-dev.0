Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CF1AE20A
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Aug 2022 10:37:29 +0000 (UTC)
Message-ID: <2236027b-e2a5-eb54-34d5-2b90929a9da5@intel.com>
Date: Fri, 12 Aug 2022 16:07:04 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220810101103.19554-1-nidhi1.gupta@intel.com>
 <20220810132753.27235-1-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220810132753.27235-1-nidhi1.gupta@intel.com>
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

On Wed-10-08-2022 06:57 pm, Nidhi Gupta wrote:
> v2: -Replace drm function call with existing library functions
>       (Bhanu)
> 
> v3: -Replace PIPE_A with compatible pipe/output combo.
>       (Bhanu)
> 
> v4: -use for_each_pipe_with_single_output() for finding
>       compatible pipe/ouput combo.
>       -remove crtc_id as not used anywhere.
>       -set fb to primary plane before commiting.
>       (Bhanu)
> 
> v5: -set fb to primary plane before commiting
>       for fill_fb_subtest() also.
>      -use existing IGT lib helper igt_display_has_format_mod()
>       instead of format_is_supported().
>       (Bhanu)
>      -added igt_display_fini(..) for cleanup
>       (Juha-Pekka Heikkila)
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/i915/kms_draw_crc.c | 113 ++++++++++++--------------------------
>   1 file changed, 36 insertions(+), 77 deletions(-)
> 
> diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
> index 48c7d931..f1887470 100644
> --- a/tests/i915/kms_draw_crc.c
> +++ b/tests/i915/kms_draw_crc.c
> @@ -29,15 +29,10 @@
>   
>   #define MAX_CONNECTORS 32
>   
> -struct modeset_params {
> -	uint32_t crtc_id;
> -	uint32_t connector_id;
> -	drmModeModeInfoPtr mode;
> -};
> -
>   int drm_fd;
> -drmModeResPtr drm_res;
> -drmModeConnectorPtr drm_connectors[MAX_CONNECTORS];
> +igt_display_t display;
> +igt_output_t *output;
> +drmModeModeInfoPtr mode;
>   struct buf_ops *bops;
>   igt_pipe_crc_t *pipe_crc;
>   
> @@ -60,34 +55,24 @@ struct base_crc {
>   };
>   struct base_crc base_crcs[ARRAY_SIZE(formats)];
>   
> -struct modeset_params ms;
> -
>   static void find_modeset_params(void)
>   {
> -	int i;
> -	uint32_t crtc_id;
> -	drmModeConnectorPtr connector = NULL;
> -	drmModeModeInfoPtr mode = NULL;
> -
> -	for (i = 0; i < drm_res->count_connectors; i++) {
> -		drmModeConnectorPtr c = drm_connectors[i];
> -
> -		if (c->count_modes) {
> -			connector = c;
> -			mode = &c->modes[0];
> -			break;
> -		}
> -	}
> -	igt_require(connector);
> +	enum pipe pipe;
>   
> -	crtc_id = kmstest_find_crtc_for_connector(drm_fd, drm_res, connector,
> -						  0);
> -	igt_assert(mode);
> +	igt_display_reset(&display);
> +	igt_display_commit(&display);
>   
> -	ms.connector_id = connector->connector_id;
> -	ms.crtc_id = crtc_id;
> -	ms.mode = mode;
> +	for_each_pipe_with_single_output(&display, pipe, output) {

s/for_each_pipe_with_single_output/for_each_pipe_with_valid_output/

> +		igt_output_set_pipe(output, pipe);
>   
> +		mode = igt_output_get_mode(output);
> +		if (!mode)
> +			continue;

I guess, every connected output will have atleast one valid mode, so we 
can drop this check.

Otherwise, we must unset output/pipe & continue, and we need a check to 
handle if there is no valid mode found with all connected outputs.

By addressing above commets, this patch is
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

> +
> +		pipe_crc = igt_pipe_crc_new(drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
> +		/*Only one pipe/output is enough*/
> +		break;
> +	}
>   }
>   
>   static uint32_t get_color(uint32_t drm_format, bool r, bool g, bool b)
> @@ -122,9 +107,14 @@ static void get_method_crc(enum igt_draw_method method, uint32_t drm_format,
>   {
>   	struct igt_fb fb;
>   	int rc;
> +	igt_plane_t *primary;
>   
> -	igt_create_fb(drm_fd, ms.mode->hdisplay, ms.mode->vdisplay,
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_create_fb(drm_fd, mode->hdisplay, mode->vdisplay,
>   		      drm_format, modifier, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +
>   	igt_draw_rect_fb(drm_fd, bops, 0, &fb, method,
>   			 0, 0, fb.width, fb.height,
>   			 get_color(drm_format, 0, 0, 1));
> @@ -144,8 +134,7 @@ static void get_method_crc(enum igt_draw_method method, uint32_t drm_format,
>   	igt_draw_rect_fb(drm_fd, bops, 0, &fb, method, 1, 1, 15, 15,
>   			 get_color(drm_format, 0, 1, 1));
>   
> -	rc = drmModeSetCrtc(drm_fd, ms.crtc_id, fb.fb_id, 0, 0,
> -			    &ms.connector_id, 1, ms.mode);
> +	rc = igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_assert_eq(rc, 0);
>   
>   	igt_pipe_crc_collect_crc(pipe_crc, crc);
> @@ -153,25 +142,6 @@ static void get_method_crc(enum igt_draw_method method, uint32_t drm_format,
>   	igt_remove_fb(drm_fd, &fb);
>   }
>   
> -static bool format_is_supported(uint32_t format, uint64_t modifier)
> -{
> -	uint32_t gem_handle, fb_id;
> -	unsigned int offsets[4] = {};
> -	unsigned int strides[4] = {};
> -	int ret;
> -
> -	gem_handle = igt_create_bo_with_dimensions(drm_fd, 64, 64,
> -						   format, modifier,
> -						   0, NULL, &strides[0], NULL);
> -	ret =  __kms_addfb(drm_fd, gem_handle, 64, 64,
> -			   format, modifier, strides, offsets, 1,
> -			   DRM_MODE_FB_MODIFIERS, &fb_id);
> -	drmModeRmFB(drm_fd, fb_id);
> -	gem_close(drm_fd, gem_handle);
> -
> -	return ret == 0;
> -}
> -
>   static void draw_method_subtest(enum igt_draw_method method,
>   				uint32_t format_index, uint64_t modifier)
>   {
> @@ -198,13 +168,12 @@ static void get_fill_crc(uint64_t modifier, igt_crc_t *crc)
>   	struct igt_fb fb;
>   	int rc;
>   
> -	igt_create_fb(drm_fd, ms.mode->hdisplay, ms.mode->vdisplay,
> +	igt_create_fb(drm_fd, mode->hdisplay, mode->vdisplay,
>   		      DRM_FORMAT_XRGB8888, modifier, &fb);
>   
>   	igt_draw_fill_fb(drm_fd, &fb, 0xFF);
>   
> -	rc = drmModeSetCrtc(drm_fd, ms.crtc_id, fb.fb_id, 0, 0,
> -			    &ms.connector_id, 1, ms.mode);
> +	rc = igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_assert_eq(rc, 0);
>   
>   	igt_pipe_crc_collect_crc(pipe_crc, crc);
> @@ -217,18 +186,22 @@ static void fill_fb_subtest(void)
>   	int rc;
>   	struct igt_fb fb;
>   	igt_crc_t base_crc, crc;
> +	igt_plane_t *primary;
>   	bool has_4tile = intel_get_device_info(intel_get_drm_devid(drm_fd))->has_4tile;
>   
> -	igt_create_fb(drm_fd, ms.mode->hdisplay, ms.mode->vdisplay,
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_create_fb(drm_fd, mode->hdisplay, mode->vdisplay,
>   		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
>   
> +	igt_plane_set_fb(primary, &fb);
> +
>   	igt_draw_rect_fb(drm_fd, bops, 0, &fb,
>   			 gem_has_mappable_ggtt(drm_fd) ? IGT_DRAW_MMAP_GTT :
>   							 IGT_DRAW_MMAP_WC,
>   			 0, 0, fb.width, fb.height, 0xFF);
>   
> -	rc = drmModeSetCrtc(drm_fd, ms.crtc_id, fb.fb_id, 0, 0,
> -			    &ms.connector_id, 1, ms.mode);
> +	rc = igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_assert_eq(rc, 0);
>   
>   	igt_pipe_crc_collect_crc(pipe_crc, &base_crc);
> @@ -251,40 +224,26 @@ static void fill_fb_subtest(void)
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
>   }
>   
>   static void teardown_environment(void)
>   {
> -	int i;
> +	igt_display_fini(&display);
>   
>   	igt_pipe_crc_free(pipe_crc);
>   
>   	buf_ops_destroy(bops);
>   
> -	for (i = 0; i < drm_res->count_connectors; i++)
> -		drmModeFreeConnector(drm_connectors[i]);
> -
> -	drmModeFreeResources(drm_res);
>   	close(drm_fd);
>   }
>   
> @@ -346,7 +305,7 @@ igt_main
>   					    !gem_has_mappable_ggtt(drm_fd))
>   						continue;
>   
> -					if (!format_is_supported(formats[format_idx], modifier))
> +					if (!igt_display_has_format_mod(&display, formats[format_idx], modifier))
>   						continue;
>   
>   					igt_dynamic_f("%s-%s-%s",
