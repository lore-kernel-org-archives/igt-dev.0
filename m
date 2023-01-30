Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C907210E0C1
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jan 2023 06:35:42 +0000 (UTC)
Message-ID: <be0d2cdc-8c93-10d3-3165-05fd9f0c018c@intel.com>
Date: Mon, 30 Jan 2023 12:05:20 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230103064658.27655-1-swati2.sharma@intel.com>
 <20230103064658.27655-3-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230103064658.27655-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] tests/kms_atomic: Test cleanup
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

Hi Swati,

On Tue-03-01-2023 12:16 pm, Swati Sharma wrote:
> Sanitize the system state before starting the subtest
> and avoid skips inside tests.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_atomic.c | 83 +++++++++++++++++++++++++++++-----------------
>   1 file changed, 53 insertions(+), 30 deletions(-)
> 
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index cd1dd9c87..e5502ce36 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -365,27 +365,23 @@ plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
>   
>   static void
>   plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
> -		     igt_output_t *output)
> +		     igt_output_t *output, igt_plane_t *primary, int n_planes)
>   {
>   	cairo_t *cr;
>   	struct igt_fb fb_ref;
> -	igt_plane_t *primary;
>   	drmModeModeInfo *mode;
>   	igt_pipe_crc_t *pipe_crc;
>   	igt_crc_t ref_crc, new_crc;
>   	int fb_id_lower, fb_id_upper;
> -	int n_planes = pipe->n_planes;
>   	igt_plane_t *plane_ptr[n_planes];
>   	struct igt_fb fb_lower, fb_upper;
>   	uint32_t w_lower, h_lower, w_upper, h_upper;
>   
>   	memset(plane_ptr, 0, n_planes * sizeof(igt_plane_t *));
>   
> -	igt_require(n_planes >= 2);
>   	igt_require_pipe_crc(display->drm_fd);
>   
>   	mode = igt_output_get_mode(output);
> -	primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>   
>   	/* for lower plane */
>   	w_lower = mode->hdisplay;
> @@ -591,17 +587,13 @@ static void plane_primary(igt_pipe_t *pipe, igt_plane_t *plane, struct igt_fb *f
>    * Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches the
>    * free-standing state objects and nothing else.
>    */
> -static void test_only(igt_pipe_t *pipe_obj,
> -		      igt_plane_t *primary,
> -		      igt_output_t *output)
> +static void test_only(igt_pipe_t *pipe_obj, igt_plane_t *primary,
> +		      igt_output_t *output, uint32_t format)
>   {
>   	drmModeModeInfo *mode = igt_output_get_mode(output);
> -	uint32_t format = plane_get_igt_format(primary);
>   	struct igt_fb fb;
>   	uint64_t old_plane_values[IGT_NUM_PLANE_PROPS], old_crtc_values[IGT_NUM_CRTC_PROPS];
>   
> -	igt_require(format != 0);
> -
>   	plane_get_current_state(primary, old_plane_values);
>   	crtc_get_current_state(pipe_obj, old_crtc_values);
>   
> @@ -1153,7 +1145,7 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
>   	 * NOTE: This will result in no update on plane as damage is outside, so
>   	 * will see no change on the screen.
>   	 */
> -	/* Reszie fb_1 to be bigger than plane */
> +	/* Resize fb_1 to be bigger than plane */
>   	igt_remove_fb(pipe->display->drm_fd, &fb_1);
>   	igt_create_color_fb(pipe->display->drm_fd, fb->width * 2, fb->height,
>   			    fb->drm_format, I915_TILING_NONE, 0.2, 0.2, 0.2,
> @@ -1281,13 +1273,15 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
>   static void atomic_setup(igt_display_t *display, enum pipe pipe, igt_output_t *output,
>   			 igt_plane_t *primary, struct igt_fb *fb)
>   {
> +	igt_display_reset(display);
>   	igt_output_set_pipe(output, pipe);
>   	igt_plane_set_fb(primary, fb);
>   
>   	crtc_commit(primary->pipe, primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
>   }
>   
> -static void atomic_clear(igt_display_t *display, enum pipe pipe, igt_plane_t *primary, igt_output_t *output)
> +static void atomic_clear(igt_display_t *display, enum pipe pipe, igt_plane_t *primary,
> +			 igt_output_t *output, struct igt_fb *fb)
>   {
>   	igt_plane_t *plane;
>   
> @@ -1298,6 +1292,13 @@ static void atomic_clear(igt_display_t *display, enum pipe pipe, igt_plane_t *pr
>   
>   	igt_output_set_pipe(output, PIPE_NONE);
>   	crtc_commit(primary->pipe, primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
> +	igt_remove_fb(display->drm_fd, fb);
> +}
> +
> +/* Returns true if plane supports zpos property. */
> +static bool has_zpos(igt_plane_t *plane)
> +{
> +	return igt_plane_has_prop(plane, IGT_PLANE_ZPOS);
>   }
>   
>   igt_main
> @@ -1334,9 +1335,12 @@ igt_main
>   	igt_subtest("plane-overlay-legacy") {
>   		igt_plane_t *overlay =
>   			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
> -		igt_require(overlay);
> +		if (!overlay)
> +			continue;

"continue" outside the loop?

imho the old one is better. Don't use "continue" outside the loop.
This comment is applicable for the all places in this patch.

> +
>   		atomic_setup(&display, pipe, output, primary, &fb);
>   		plane_overlay(pipe_obj, output, overlay);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_describe("Test for KMS atomic modesetting on primary plane and ensure coherency between "
> @@ -1344,39 +1348,52 @@ igt_main
>   	igt_subtest("plane-primary-legacy") {
>   		atomic_setup(&display, pipe, output, primary, &fb);
>   		plane_primary(pipe_obj, primary, &fb);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_describe("Test to verify that the overlay plane can cover the primary one (and "\
>   		     "vice versa) by changing their zpos property.");
>   	igt_subtest("plane-primary-overlay-mutable-zpos") {
> -		uint32_t format_primary = DRM_FORMAT_ARGB8888;
> -		uint32_t format_overlay = DRM_FORMAT_ARGB1555;

Better to keep the old one, since it is easy to maintain.

Example:
Maybe in feature if we want to use different formats, we can simply 
update at single place.

- Bhanu

>   		igt_plane_t *overlay =
>   			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
> -		igt_require(overlay);
> +		if (!overlay)
> +			continue;
>   
> -		igt_require(igt_plane_has_prop(primary, IGT_PLANE_ZPOS));
> -		igt_require(igt_plane_has_prop(overlay, IGT_PLANE_ZPOS));
> +		if (!has_zpos(primary) || !has_zpos(overlay))
> +			continue;
> +
> +		if (!igt_plane_has_format_mod(primary, DRM_FORMAT_ARGB8888, 0x0) ||
> +		    !igt_plane_has_format_mod(overlay, DRM_FORMAT_ARGB1555, 0x0))
> +			continue;
>   
> -		igt_require(igt_plane_has_format_mod(primary, format_primary, 0x0));
> -		igt_require(igt_plane_has_format_mod(overlay, format_overlay, 0x0));
>   		igt_output_set_pipe(output, pipe);
>   		plane_primary_overlay_mutable_zpos(pipe_obj, output, primary, overlay,
> -						   format_primary, format_overlay);
> +						   DRM_FORMAT_ARGB8888, DRM_FORMAT_ARGB1555);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_describe("Test to verify the reported zpos property of planes by making sure "\
>   		     "only higher zpos planes cover the lower zpos ones.");
>   	igt_subtest("plane-immutable-zpos") {
> +		int n_planes = pipe_obj->n_planes;
> +
> +		if (n_planes < 2)
> +			continue;
> +
>   		igt_output_set_pipe(output, pipe);
> -		plane_immutable_zpos(&display, pipe_obj, output);
> +		plane_immutable_zpos(&display, pipe_obj, output, primary, n_planes);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_describe("Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches "
>   		     "the free-standing state objects and nothing else.");
>   	igt_subtest("test-only") {
> -		atomic_clear(&display, pipe, primary, output);
> -		test_only(pipe_obj, primary, output);
> +		uint32_t format = plane_get_igt_format(primary);
> +		if (!format)
> +			continue;
> +
> +		atomic_clear(&display, pipe, primary, output, &fb);
> +		test_only(pipe_obj, primary, output, format);
>   	}
>   
>   	igt_describe("Test for KMS atomic modesetting on cursor plane and ensure coherency between "
> @@ -1384,33 +1401,39 @@ igt_main
>   	igt_subtest("plane-cursor-legacy") {
>   		igt_plane_t *cursor =
>   			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_CURSOR);
> -		igt_require(cursor);
> +		if (!cursor)
> +			continue;
>   		atomic_setup(&display, pipe, output, primary, &fb);
>   		plane_cursor(pipe_obj, output, cursor);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_describe("Test error handling when invalid plane parameters are passed");
>   	igt_subtest("plane-invalid-params") {
>   		atomic_setup(&display, pipe, output, primary, &fb);
>   		plane_invalid_params(pipe_obj, output, primary, &fb);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_describe("Test error handling when invalid plane fence parameters are passed");
>   	igt_subtest("plane-invalid-params-fence") {
>   		atomic_setup(&display, pipe, output, primary, &fb);
>   		plane_invalid_params_fence(pipe_obj, output, primary);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_describe("Test error handling when invalid crtc parameters are passed");
>   	igt_subtest("crtc-invalid-params") {
>   		atomic_setup(&display, pipe, output, primary, &fb);
>   		crtc_invalid_params(pipe_obj, output, primary, &fb);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_describe("Test error handling when invalid crtc fence parameters are passed");
>   	igt_subtest("crtc-invalid-params-fence") {
>   		atomic_setup(&display, pipe, output, primary, &fb);
>   		crtc_invalid_params_fence(pipe_obj, output, primary, &fb);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_describe("Test abuse the atomic ioctl directly in order to test "
> @@ -1419,19 +1442,19 @@ igt_main
>   	igt_subtest("atomic-invalid-params") {
>   		atomic_setup(&display, pipe, output, primary, &fb);
>   		atomic_invalid_params(pipe_obj, primary, output, &fb);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_describe("Test to use FB_DAMAGE_CLIPS plane property");
>   	igt_subtest("atomic-plane-damage") {
> -		igt_require(igt_plane_has_prop(primary, IGT_PLANE_FB_DAMAGE_CLIPS));
> +		if (!igt_plane_has_prop(primary, IGT_PLANE_FB_DAMAGE_CLIPS))
> +			continue;
>   		atomic_setup(&display, pipe, output, primary, &fb);
>   		atomic_plane_damage(pipe_obj, primary, &fb);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_fixture {
> -		atomic_clear(&display, pipe, primary, output);
> -		igt_remove_fb(display.drm_fd, &fb);
> -
>   		igt_display_fini(&display);
>   		close(display.drm_fd);
>   	}
