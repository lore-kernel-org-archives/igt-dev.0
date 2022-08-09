Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01066D4861
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Aug 2022 12:53:51 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id b16so14979422edd.4
 for <igt-dev@lists.freedesktop.org>; Tue, 09 Aug 2022 05:53:51 -0700 (PDT)
Message-ID: <8a3d78e8-64e3-c2dc-b188-efd2902bb944@gmail.com>
Date: Tue, 9 Aug 2022 15:53:43 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, igt-dev@lists.freedesktop.org
References: <20220804034029.17355-1-nidhi1.gupta@intel.com>
 <20220804034029.17355-3-nidhi1.gupta@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20220804034029.17355-3-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH 2/2] tests/i915/kms_draw_crc: Test Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Nidhi,

quickly looking I noticed few things which Bhanu didn't comment on

On 4.8.2022 6.40, Nidhi Gupta wrote:
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
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/i915/kms_draw_crc.c | 73 +++++++++++++++------------------------
>   1 file changed, 28 insertions(+), 45 deletions(-)
> 
> diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
> index 48c7d931..c7354df9 100644
> --- a/tests/i915/kms_draw_crc.c
> +++ b/tests/i915/kms_draw_crc.c
> @@ -31,12 +31,12 @@
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
> +igt_output_t *output;
>   drmModeConnectorPtr drm_connectors[MAX_CONNECTORS];
>   struct buf_ops *bops;
>   igt_pipe_crc_t *pipe_crc;
> @@ -64,30 +64,25 @@ struct modeset_params ms;
>   
>   static void find_modeset_params(void)
>   {
> -	int i;
> -	uint32_t crtc_id;
> -	drmModeConnectorPtr connector = NULL;
> -	drmModeModeInfoPtr mode = NULL;
> -
> -	for (i = 0; i < drm_res->count_connectors; i++) {
> -		drmModeConnectorPtr c = drm_connectors[i];
> +	enum pipe pipe1;
> +	drmModeModeInfo *mode;

Here is being replaced drmModeModeInfoPtr (drmModeModeInfo pointer) 
called 'mode' with pointer to drmModeModeInfo which is called 'mode'

>   
> -		if (c->count_modes) {
> -			connector = c;
> -			mode = &c->modes[0];
> -			break;
> -		}
> -	}
> -	igt_require(connector);
> +	igt_display_reset(&display);
> +	igt_display_commit(&display);
>   
> -	crtc_id = kmstest_find_crtc_for_connector(drm_fd, drm_res, connector,
> -						  0);
> -	igt_assert(mode);
> +	for_each_pipe_with_single_output(&display, pipe1, output) {
> +		output = igt_get_single_output_for_pipe(&display, pipe1);
> +		igt_require(output);
> +		igt_output_set_pipe(output, pipe1);
>   
> -	ms.connector_id = connector->connector_id;
> -	ms.crtc_id = crtc_id;
> -	ms.mode = mode;
> +		mode = igt_output_get_mode(output);
> +		igt_assert(mode);
>   
> +		ms.mode = mode;
> +		pipe_crc = igt_pipe_crc_new(drm_fd, pipe1, INTEL_PIPE_CRC_SOURCE_AUTO);
> +		/*Only one pipe/output is enough*/
> +		break;
> +	}
>   }
>   
>   static uint32_t get_color(uint32_t drm_format, bool r, bool g, bool b)
> @@ -122,9 +117,14 @@ static void get_method_crc(enum igt_draw_method method, uint32_t drm_format,
>   {
>   	struct igt_fb fb;
>   	int rc;
> +	igt_plane_t *primary;
> +
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   
>   	igt_create_fb(drm_fd, ms.mode->hdisplay, ms.mode->vdisplay,
>   		      drm_format, modifier, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +
>   	igt_draw_rect_fb(drm_fd, bops, 0, &fb, method,
>   			 0, 0, fb.width, fb.height,
>   			 get_color(drm_format, 0, 0, 1));
> @@ -144,8 +144,7 @@ static void get_method_crc(enum igt_draw_method method, uint32_t drm_format,
>   	igt_draw_rect_fb(drm_fd, bops, 0, &fb, method, 1, 1, 15, 15,
>   			 get_color(drm_format, 0, 1, 1));
>   
> -	rc = drmModeSetCrtc(drm_fd, ms.crtc_id, fb.fb_id, 0, 0,
> -			    &ms.connector_id, 1, ms.mode);
> +	rc = igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_assert_eq(rc, 0);
>   
>   	igt_pipe_crc_collect_crc(pipe_crc, crc);
> @@ -203,8 +202,7 @@ static void get_fill_crc(uint64_t modifier, igt_crc_t *crc)
>   
>   	igt_draw_fill_fb(drm_fd, &fb, 0xFF);
>   
> -	rc = drmModeSetCrtc(drm_fd, ms.crtc_id, fb.fb_id, 0, 0,
> -			    &ms.connector_id, 1, ms.mode);
> +	rc = igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_assert_eq(rc, 0);
>   
>   	igt_pipe_crc_collect_crc(pipe_crc, crc);
> @@ -227,8 +225,7 @@ static void fill_fb_subtest(void)
>   							 IGT_DRAW_MMAP_WC,
>   			 0, 0, fb.width, fb.height, 0xFF);
>   
> -	rc = drmModeSetCrtc(drm_fd, ms.crtc_id, fb.fb_id, 0, 0,
> -			    &ms.connector_id, 1, ms.mode);
> +	rc = igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_assert_eq(rc, 0);
>   
>   	igt_pipe_crc_collect_crc(pipe_crc, &base_crc);
> @@ -251,40 +248,26 @@ static void fill_fb_subtest(void)
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

you add igt_display_require(..) which you should clean up afterwards 
with igt_display_fini(..)

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
> -
>   	igt_pipe_crc_free(pipe_crc);
>   
>   	buf_ops_destroy(bops);
>   
> -	for (i = 0; i < drm_res->count_connectors; i++)
> -		drmModeFreeConnector(drm_connectors[i]);
> +	igt_display_reset(&display);

If you want this reset to go in you'll need to commit it before closing fd.

>   
> -	drmModeFreeResources(drm_res);
>   	close(drm_fd);
>   }
>   
