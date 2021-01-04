Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F17789FEC
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Jan 2021 15:51:43 +0000 (UTC)
References: <20201216230223.24311-1-sungkim@amd.com>
 <20201216230223.24311-2-sungkim@amd.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <12f3a47e-f9e8-4d7d-049a-36eb39cdc084@amd.com>
Date: Mon, 4 Jan 2021 10:51:37 -0500
In-Reply-To: <20201216230223.24311-2-sungkim@amd.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/2] kms_rotation_crc:Add HW rotation test
 case for amdgpu
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Sung Joon Kim <sungkim@amd.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-12-16 6:02 p.m., Sung Joon Kim wrote:
> Added Hw rotation case specifically for amdgpu. Currently, kms_rotation_crc tests intel gpus. Added conditions to bypass all the requirements needed for intel when testing amdgpu.
> 
> Signed-off-by: Sung Joon Kim <sungkim@amd.com>
> ---
>   tests/kms_rotation_crc.c | 247 +++++++++++++++++++++++----------------
>   1 file changed, 149 insertions(+), 98 deletions(-)
> 
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index ffcc2cc2..d524b6c5 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -183,6 +183,12 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
>   	/* create the pipe_crc object for this pipe */
>   	igt_pipe_crc_free(data->pipe_crc);
>   
> +	if (is_amdgpu_device(data->gfx_fd)) {
> +		igt_fb_t fb_temp;
> +
> +		igt_create_fb(data->gfx_fd, 1280, 800, DRM_FORMAT_XRGB8888, 0, &fb_temp);
> +		igt_plane_set_fb(plane, &fb_temp);
> +	}

This framebuffer never gets freed.

I guess the issue you have here is that we can't start CRC capture when 
the CRTC is disabled and no planes are enabled because it ticks off of 
the vblank handler in kernel.

This has been a problem in a few IGT tests so I see two approaches here:

1) Switch CRC capture to use igt_pipe_crc_collect_crc instead of 
start/stop CRC in the test

2) Don't fail CRC enablement in the kernel if there's no stream for the 
CRTC - leave configuring/enabling the CRC capture until CRTC enablement.

I prefer 2) since this is how I assume i915 works as well and it 
prevents having to fix other tests down the line.

>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   	data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
>   
> @@ -207,6 +213,8 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
>   	uint64_t tiling = data->override_tiling ?: LOCAL_DRM_FORMAT_MOD_NONE;
>   	uint32_t pixel_format = data->override_fmt ?: DRM_FORMAT_XRGB8888;
>   	const float flip_opacity = 0.75;
> +	bool amd_gpu = is_amdgpu_device(data->gfx_fd);
> +	bool intel_gpu = is_i915_device(data->gfx_fd);
>   
>   	remove_fbs(data);
>   
> @@ -214,16 +222,21 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
>   
>   	mode = igt_output_get_mode(output);
>   	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
> -		if (data->use_native_resolution) {
> +		if (amd_gpu) {
>   			w = mode->hdisplay;
>   			h = mode->vdisplay;
> -		} else {
> -			w = min(TEST_MAX_WIDTH, mode->hdisplay);
> -			h = min(TEST_MAX_HEIGHT, mode->vdisplay);
> -		}
> +		} else if (intel_gpu) {
> +			if (data->use_native_resolution) {
> +				w = mode->hdisplay;
> +				h = mode->vdisplay;
> +			} else {
> +				w = min(TEST_MAX_WIDTH, mode->hdisplay);
> +				h = min(TEST_MAX_HEIGHT, mode->vdisplay);
> +			}
>   
> -		min_w = 256;
> -		min_h = 256;
> +			min_w = 256;
> +			min_h = 256;
> +		}

Don't need to modify this logic above: just add an is_amdgpu_device() 
check into test_plane_rotation to force use_native_resolution=true.

>   	} else {
>   		pixel_format = data->override_fmt ?: DRM_FORMAT_ARGB8888;
>   
> @@ -255,7 +268,8 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
>   	 * frame can fit in
>   	 */
>   	if (data->rotation & (IGT_ROTATION_90 | IGT_ROTATION_270)) {
> -		tiling = data->override_tiling ?: LOCAL_I915_FORMAT_MOD_Y_TILED;
> +		if (intel_gpu)
> +			tiling = data->override_tiling ?: LOCAL_I915_FORMAT_MOD_Y_TILED;
>   
>   		igt_swap(w, h);
>   	}
> @@ -266,34 +280,40 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
>   	 */
>   	igt_require(igt_display_has_format_mod(display, pixel_format, tiling));
>   
> -	/*
> -	 * Create a reference software rotated flip framebuffer.
> -	 */
> -	igt_create_fb(data->gfx_fd, ref_w, ref_h, pixel_format, tiling,
> -		      &data->fb_flip);
> -	paint_squares(data, data->rotation, &data->fb_flip,
> -		      flip_opacity);
> -	igt_plane_set_fb(plane, &data->fb_flip);
> -	if (plane->type != DRM_PLANE_TYPE_CURSOR)
> -		igt_plane_set_position(plane, data->pos_x, data->pos_y);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	if (intel_gpu) {
> +		/*
> +		 * Create a reference software rotated flip framebuffer.
> +		 */
> +		igt_create_fb(data->gfx_fd, ref_w, ref_h, pixel_format, tiling,
> +			      &data->fb_flip);
> +		paint_squares(data, data->rotation, &data->fb_flip,
> +			      flip_opacity);
> +		igt_plane_set_fb(plane, &data->fb_flip);
> +		if (plane->type != DRM_PLANE_TYPE_CURSOR)
> +			igt_plane_set_position(plane, data->pos_x, data->pos_y);
> +		igt_display_commit2(display, COMMIT_ATOMIC);'

This shouldn't be i915 specific - what are you trying to workaround here?

>   
> -	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &data->flip_crc);
> +		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &data->flip_crc);
>   
> -	/*
> -	  * Prepare the non-rotated flip fb.
> -	  */
> -	igt_remove_fb(data->gfx_fd, &data->fb_flip);
> -	igt_create_fb(data->gfx_fd, w, h, pixel_format, tiling,
> -		      &data->fb_flip);
> -	paint_squares(data, IGT_ROTATION_0, &data->fb_flip,
> -		      flip_opacity);
> +		/*
> +		  * Prepare the non-rotated flip fb.
> +		  */
> +		igt_remove_fb(data->gfx_fd, &data->fb_flip);
> +		igt_create_fb(data->gfx_fd, w, h, pixel_format, tiling,
> +			      &data->fb_flip);
> +		paint_squares(data, IGT_ROTATION_0, &data->fb_flip,
> +			      flip_opacity);
>   
> -	/*
> -	 * Create a reference CRC for a software-rotated fb.
> -	 */
> -	igt_create_fb(data->gfx_fd, ref_w, ref_h, pixel_format,
> -		      data->override_tiling ?: LOCAL_DRM_FORMAT_MOD_NONE, &data->fb_reference);
> +		/*
> +		 * Create a reference CRC for a software-rotated fb.
> +		 */
> +		igt_create_fb(data->gfx_fd, ref_w, ref_h, pixel_format,
> +			      data->override_tiling ?: LOCAL_DRM_FORMAT_MOD_NONE, &data->fb_reference);
> +	} else if (amd_gpu) {
> +		tiling = 0x1900;

Not sure what this magic constant is - if the tiling modifiers aren't in 
the included DRM headers in the igt repo then we should be updating and 
using those new constants.

The reference probably also shouldn't be tiled here.

> +		igt_create_fb(data->gfx_fd, ref_w, ref_h, pixel_format,
> +				  tiling, &data->fb_reference);
> +	}
>   	paint_squares(data, data->rotation, &data->fb_reference, 1.0);
>   
>   	igt_plane_set_fb(plane, &data->fb_reference);
> @@ -301,7 +321,10 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
>   		igt_plane_set_position(plane, data->pos_x, data->pos_y);
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   
> -	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &data->ref_crc);
> +	if (intel_gpu)
> +		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &data->ref_crc);
> +	else if (amd_gpu)
> +		igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_crc);
>   
>   	/*
>   	 * Prepare the plane with an non-rotated fb let the hw rotate it.
> @@ -339,33 +362,37 @@ static void test_single_case(data_t *data, enum pipe pipe,
>   	/* Verify commit was ok. */
>   	igt_assert_eq(ret, 0);
>   
> -	/* Check CRC */
> -	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc_output);
> -	igt_assert_crc_equal(&data->ref_crc, &crc_output);
> +	if (is_i915_device(data->gfx_fd)) {
> +		/* Check CRC */
> +		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc_output);
> +		igt_assert_crc_equal(&data->ref_crc, &crc_output);

This should be driver generic, not i915 specific. This is basically 
bypassing the test, is it not?

>   
> -	/*
> -	 * If flips are requested flip to a different fb and
> -	 * check CRC against that one as well.
> -	 */
> -	if (data->fb_flip.fb_id) {
> -		igt_plane_set_fb(plane, &data->fb_flip);
> -		if (data->rotation == IGT_ROTATION_90 || data->rotation == IGT_ROTATION_270)
> -			igt_plane_set_size(plane, data->fb.height, data->fb.width);
> -
> -		if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
> -			igt_display_commit_atomic(display, DRM_MODE_PAGE_FLIP_EVENT | DRM_MODE_ATOMIC_NONBLOCK, NULL);
> -		} else {
> -			ret = drmModePageFlip(data->gfx_fd,
> -					output->config.crtc->crtc_id,
> -					data->fb_flip.fb_id,
> -					DRM_MODE_PAGE_FLIP_EVENT,
> -					NULL);
> -			igt_assert_eq(ret, 0);
> +		/*
> +		 * If flips are requested flip to a different fb and
> +		 * check CRC against that one as well.
> +		 */
> +		if (data->fb_flip.fb_id) {
> +			igt_plane_set_fb(plane, &data->fb_flip);
> +			if (data->rotation == IGT_ROTATION_90 || data->rotation == IGT_ROTATION_270)
> +				igt_plane_set_size(plane, data->fb.height, data->fb.width);
> +
> +			if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
> +				igt_display_commit_atomic(display, DRM_MODE_PAGE_FLIP_EVENT | DRM_MODE_ATOMIC_NONBLOCK, NULL);
> +			} else {
> +				ret = drmModePageFlip(data->gfx_fd,
> +						output->config.crtc->crtc_id,
> +						data->fb_flip.fb_id,
> +						DRM_MODE_PAGE_FLIP_EVENT,
> +						NULL);
> +				igt_assert_eq(ret, 0);
> +			}
> +			kmstest_wait_for_pageflip(data->gfx_fd);
> +			igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc_output);
> +			igt_assert_crc_equal(&data->flip_crc,
> +					     &crc_output);
>   		}
> -		kmstest_wait_for_pageflip(data->gfx_fd);
> -		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc_output);
> -		igt_assert_crc_equal(&data->flip_crc,
> -				     &crc_output);
> +	} else if (is_amdgpu_device(data->gfx_fd)) {
> +		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_output);
>   	}
>   }
>   
> @@ -406,54 +433,74 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>   		igt_plane_t *plane;
>   		int i, j;
>   
> -		if (IS_CHERRYVIEW(data->devid) && pipe != PIPE_B)
> -			continue;
> -
> -		igt_output_set_pipe(output, pipe);
> +		if (is_i915_device(data->gfx_fd)) {
> +			if (IS_CHERRYVIEW(data->devid) && pipe != PIPE_B)
> +				continue;

I think we can combine this check into just is_i915_device(...) && 
IS_CEHRRYVIEW(...).

The rest can stay.

>   
> -		plane = igt_output_get_plane_type(output, plane_type);
> -		igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
> +			igt_output_set_pipe(output, pipe);
>   
> -		prepare_crtc(data, output, pipe, plane, true);
> +			plane = igt_output_get_plane_type(output, plane_type);
> +			igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
>   
> -		for (i = 0; i < num_rectangle_types; i++) {
> -			/* Unsupported on i915 */
> -			if (plane_type == DRM_PLANE_TYPE_CURSOR &&
> -			    i != square)
> -				continue;
> +			prepare_crtc(data, output, pipe, plane, true);
>   
> -			/* Only support partial covering primary plane on gen9+ */
> -			if (plane_type == DRM_PLANE_TYPE_PRIMARY &&
> -			    intel_gen(intel_get_drm_devid(data->gfx_fd)) < 9) {
> -				if (i != rectangle)
> +			for (i = 0; i < num_rectangle_types; i++) {
> +				/* Unsupported on i915 */
> +				if (plane_type == DRM_PLANE_TYPE_CURSOR &&
> +				    i != square)
>   					continue;
> -				else
> -					data->use_native_resolution = true;
> -			} else {
> -				data->use_native_resolution = false;
> -			}
>   
> -			if (!data->override_fmt) {
> -				struct igt_vec tested_formats;
> +				/* Only support partial covering primary plane on gen9+ */
> +				if (plane_type == DRM_PLANE_TYPE_PRIMARY &&
> +				    intel_gen(intel_get_drm_devid(data->gfx_fd)) < 9) {
> +					if (i != rectangle)
> +						continue;
> +					else
> +						data->use_native_resolution = true;
> +				} else {
> +					data->use_native_resolution = false;
> +				}
>   
> -				igt_vec_init(&tested_formats, sizeof(uint32_t));
> +				if (!data->override_fmt) {
> +					struct igt_vec tested_formats;
>   
> -				for (j = 0; j < plane->drm_plane->count_formats; j++) {
> -					uint32_t format = plane->drm_plane->formats[j];
> +					igt_vec_init(&tested_formats, sizeof(uint32_t));
>   
> -					if (!test_format(data, &tested_formats, format))
> -						continue;
> +					for (j = 0; j < plane->drm_plane->count_formats; j++) {
> +						uint32_t format = plane->drm_plane->formats[j];
>   
> +						if (!test_format(data, &tested_formats, format))
> +							continue;
> +
> +						test_single_case(data, pipe, output, plane, i,
> +								 format, test_bad_format);
> +					}
> +
> +					igt_vec_fini(&tested_formats);
> +				} else {
>   					test_single_case(data, pipe, output, plane, i,
> -							 format, test_bad_format);
> +							 data->override_fmt, test_bad_format);
>   				}
> +			}
> +		} else if (is_amdgpu_device(data->gfx_fd)) {
> +			uint32_t format = DRM_FORMAT_XRGB8888;
>   
> -				igt_vec_fini(&tested_formats);
> -			} else {
> -				test_single_case(data, pipe, output, plane, i,
> -						 data->override_fmt, test_bad_format);
> +			igt_output_set_pipe(output, pipe);
> +
> +			plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +			igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
> +
> +			prepare_crtc(data, output, pipe, plane, false);
> +
> +			if (plane_type != DRM_PLANE_TYPE_PRIMARY) {
> +				plane = igt_output_get_plane_type(output, plane_type);
> +				igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
>   			}
> +
> +			test_single_case(data, pipe, output, plane,
> +					 rectangle, format, test_bad_format);
>   		}
> +

Is this to just avoid testing all the formats? Can you modify 
test_format() instead to return false for anything that's not 
XRGB8888/ARGB8888 for amdgpu?



>   		igt_pipe_crc_stop(data->pipe_crc);
>   	}
>   }
> @@ -832,9 +879,11 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   	int gen = 0;
>   
>   	igt_fixture {
> -		data.gfx_fd = drm_open_driver_master(DRIVER_INTEL);
> -		data.devid = intel_get_drm_devid(data.gfx_fd);
> -		gen = intel_gen(data.devid);
> +		data.gfx_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_AMDGPU);
> +		if (is_i915_device(data.gfx_fd)) {
> +			data.devid = intel_get_drm_devid(data.gfx_fd);
> +			gen = intel_gen(data.devid);
> +		}
>   
>   		kmstest_set_vt_graphics_mode();
>   
> @@ -848,9 +897,11 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   		igt_subtest_f("%s-rotation-%s",
>   			      plane_test_str(subtest->plane),
>   			      rot_test_str(subtest->rot)) {
> -			igt_require(!(subtest->rot &
> -				    (IGT_ROTATION_90 | IGT_ROTATION_270)) ||
> -				    gen >= 9);
> +			if (is_i915_device(data.gfx_fd)) {
> +				igt_require(!(subtest->rot &
> +					    (IGT_ROTATION_90 | IGT_ROTATION_270)) ||
> +					    gen >= 9);
> +			}

Can simplify this check by merging the two conditions into the require.

Regards,
Nicholas Kazlauskas

>   			data.rotation = subtest->rot;
>   			test_plane_rotation(&data, subtest->plane, false);
>   		}
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
