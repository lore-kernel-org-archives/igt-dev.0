Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F239E10EFD0
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jun 2022 09:14:35 +0000 (UTC)
Message-ID: <3b70f533-a3a1-3f72-abc3-38ee8edcc30a@intel.com>
Date: Fri, 17 Jun 2022 14:44:00 +0530
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220615094636.23398-1-swati2.sharma@intel.com>
Content-Language: en-US
In-Reply-To: <20220615094636.23398-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_panel_fitting: Convert test
 to dynamic
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

On Wed-15-06-2022 03:16 pm, Swati Sharma wrote:
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_panel_fitting.c | 209 +++++++++++++++++++-------------------
>   1 file changed, 104 insertions(+), 105 deletions(-)
> 
> diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
> index 9f607376..a75aa629 100644
> --- a/tests/kms_panel_fitting.c
> +++ b/tests/kms_panel_fitting.c
> @@ -28,6 +28,11 @@
>   
>   IGT_TEST_DESCRIPTION("Test display panel fitting");
>   
> +enum test_type {
> +	TEST_LEGACY,
> +	TEST_ATOMIC,
> +};
> +
>   typedef struct {
>   	int drm_fd;
>   	igt_display_t display;
> @@ -80,109 +85,96 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
>   	igt_display_commit2(display, s);
>   }
>   
> -static void test_panel_fitting(data_t *d)
> +static void
> +test_panel_fitting_legacy(data_t *d, igt_display_t *display,
> +			  const enum pipe pipe, igt_output_t *output)
>   {
> -	igt_display_t *display = &d->display;
> -	igt_output_t *output;
> -	enum pipe pipe;
> -	int valid_tests = 0;
> +	drmModeModeInfo *mode, native_mode;
> +	bool is_plane_scaling_active = true;
>   
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> -		drmModeModeInfo *mode, native_mode;
> -		bool is_plane_scaling_active = true;
> -
> -		/* Check that the "scaling mode" property has been set. */
> -		if (!igt_output_has_prop(output, IGT_CONNECTOR_SCALING_MODE))
> -			continue;
> -
> -		cleanup_crtc(d);
> -		igt_output_set_pipe(output, pipe);
> -
> -		mode = igt_output_get_mode(output);
> -		native_mode = *mode;
> -
> -		/* allocate fb2 with image */
> -		igt_create_pattern_fb(d->drm_fd, mode->hdisplay / 2, mode->vdisplay / 2,
> -				      DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR, &d->fb2);
> +	igt_output_set_pipe(output, pipe);

As we are doing it here, we need to drop this from prepare_crtc().

>   
> -		/* Set up display to enable panel fitting */
> -		if (is_amdgpu_device(display->drm_fd)) {
> -			mode->hdisplay = 800;
> -			mode->vdisplay = 600;
> -		} else {
> -			mode->hdisplay = 640;
> -			mode->vdisplay = 480;
> -		}
> -		d->plane1 = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -		prepare_crtc(d, output, pipe, d->plane1, mode, COMMIT_LEGACY);
> +	mode = igt_output_get_mode(output);
> +	native_mode = *mode;
>   
> -		/* disable panel fitting */
> -		prepare_crtc(d, output, pipe, d->plane1, &native_mode, COMMIT_LEGACY);
> +	/* allocate fb2 with image */
> +	igt_create_pattern_fb(d->drm_fd, mode->hdisplay / 2, mode->vdisplay / 2,
> +			      DRM_FORMAT_XRGB8888,
> +			      DRM_FORMAT_MOD_LINEAR, &d->fb2);
>   
> -		/* enable panel fitting */
> +	/* set up display to enable panel fitting */
> +	if (is_amdgpu_device(display->drm_fd)) {
>   		mode->hdisplay = 800;
>   		mode->vdisplay = 600;
> -		prepare_crtc(d, output, pipe, d->plane1, mode, COMMIT_LEGACY);
> -
> -		/* disable panel fitting */
> -		prepare_crtc(d, output, pipe, d->plane1, &native_mode, COMMIT_LEGACY);
> +	} else {
> +		mode->hdisplay = 640;
> +		mode->vdisplay = 480;
> +	}
> +	d->plane1 = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	prepare_crtc(d, output, pipe, d->plane1, mode, COMMIT_LEGACY);
>   
> -		/* Set up fb2->plane2 mapping. */
> -		d->plane2 = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
> -		igt_plane_set_fb(d->plane2, &d->fb2);
> +	/* disable panel fitting */
> +	prepare_crtc(d, output, pipe, d->plane1, &native_mode, COMMIT_LEGACY);
>   
> -		/* enable sprite plane */
> -		igt_fb_set_position(&d->fb2, d->plane2, 100, 100);
> -		igt_fb_set_size(&d->fb2, d->plane2, d->fb2.width-200, d->fb2.height-200);
> -		igt_plane_set_position(d->plane2, 100, 100);
> +	/* enable panel fitting */
> +	mode->hdisplay = 800;
> +	mode->vdisplay = 600;
> +	prepare_crtc(d, output, pipe, d->plane1, mode, COMMIT_LEGACY);
>   
> -		if (is_i915_device(display->drm_fd)) {
> -			uint32_t devid = intel_get_drm_devid(display->drm_fd);
> -			/*
> -			 * Most of gen7 and all of gen8 doesn't support plane scaling
> -			 * at all.
> -			 *
> -			 * gen9 pipe C has only 1 scaler shared with the crtc, which
> -			 * means pipe scaling can't work simultaneously with panel
> -			 * fitting.
> -			 *
> -			 * Since this is the legacy path, userspace has to know about
> -			 * the HW limitations, whereas atomic can ask.
> -			 */
> -			if (IS_GEN8(devid) ||
> -				(IS_GEN7(devid) && !IS_IVYBRIDGE(devid)) ||
> -				(IS_GEN9(devid) && pipe == PIPE_C)) {
> -				is_plane_scaling_active = false;
> -			}
> -		}
> -		if (is_plane_scaling_active) {
> -			/*
> -			 * different than visible area of fb => plane scaling
> -			 * active
> -			 */
> -			igt_plane_set_size(d->plane2,
> -					   mode->hdisplay-200,
> -					   mode->vdisplay-200);
> -		}
> -		else {
> -			/* same as visible area of fb => no scaling */
> -			igt_plane_set_size(d->plane2,
> -				d->fb2.width - 200,
> -				d->fb2.height - 200);
> -		}
> +	/* disable panel fitting */
> +	prepare_crtc(d, output, pipe, d->plane1, &native_mode, COMMIT_LEGACY);
>   
> -		/* Plane scaling active (if possible), pfit off */
> -		igt_display_commit2(display, COMMIT_UNIVERSAL);
> +	/* set up fb2->plane2 mapping. */
> +	d->plane2 = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
> +	igt_plane_set_fb(d->plane2, &d->fb2);
>   
> -		/* enable panel fitting along with sprite scaling */
> -		mode->hdisplay = 1024;
> -		mode->vdisplay = 768;
> -		prepare_crtc(d, output, pipe, d->plane1, mode, COMMIT_LEGACY);
> +	/* enable sprite plane */
> +	igt_fb_set_position(&d->fb2, d->plane2, 100, 100);
> +	igt_fb_set_size(&d->fb2, d->plane2, d->fb2.width-200, d->fb2.height-200);
> +	igt_plane_set_position(d->plane2, 100, 100);
>   
> -		valid_tests++;
> +	if (is_i915_device(display->drm_fd)) {
> +		uint32_t devid = intel_get_drm_devid(display->drm_fd);
> +		/*
> +		 * Most of gen7 and all of gen8 doesn't support plane scaling
> +		 * at all.
> +		 *
> +		 * gen9 pipe C has only 1 scaler shared with the crtc, which
> +		 * means pipe scaling can't work simultaneously with panel
> +		 * fitting.
> +		 *
> +		 * Since this is the legacy path, userspace has to know about
> +		 * the HW limitations, whereas atomic can ask.
> +		 */
> +		if (IS_GEN8(devid) ||
> +			(IS_GEN7(devid) && !IS_IVYBRIDGE(devid)) ||
> +			(IS_GEN9(devid) && pipe == PIPE_C)) {
> +			is_plane_scaling_active = false;
> +		}
> +	}
> +	if (is_plane_scaling_active) {
> +		/*
> +		 * different than visible area of fb => plane scaling
> +		 * active
> +		 */
> +		igt_plane_set_size(d->plane2,
> +				   mode->hdisplay-200,
> +				   mode->vdisplay-200);
>   	}
> -	igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
> +	else {

Please fix if-else block style.

if {

} else {

}

> +		/* same as visible area of fb => no scaling */
> +		igt_plane_set_size(d->plane2,
> +			d->fb2.width - 200,
> +			d->fb2.height - 200);
> +	}
> +
> +	/* Plane scaling active (if possible), pfit off */
> +	igt_display_commit2(display, COMMIT_UNIVERSAL);
> +
> +	/* enable panel fitting along with sprite scaling */
> +	mode->hdisplay = 1024;
> +	mode->vdisplay = 768;
> +	prepare_crtc(d, output, pipe, d->plane1, mode, COMMIT_LEGACY);
>   }
>   
>   static void
> @@ -234,34 +226,41 @@ test_panel_fitting_fastset(igt_display_t *display, const enum pipe pipe, igt_out
>   	igt_display_commit_atomic(display, 0, NULL);
>   }
>   
> -static void test_atomic_fastset(data_t *data)
> +static void test_panel_fitting(data_t *data, enum test_type type)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output;
>   	enum pipe pipe;
> -	int valid_tests = 0;
>   	struct stat sb;
>   
> -	igt_require_f(is_i915_device(display->drm_fd), "not valid for non-i915 devices\n");
> +	if (type == TEST_ATOMIC) {
> +		igt_require_f(is_i915_device(display->drm_fd), "not valid for non-i915 devices\n");
>   
> -	if (is_i915_device(display->drm_fd)) {
> -		/* Until this is force enabled, force modeset evasion. */
> -		if (stat("/sys/module/i915/parameters/fastboot", &sb) == 0)
> -			igt_set_module_param_int(data->drm_fd, "fastboot", 1);
> +		if (is_i915_device(display->drm_fd)) {

This check is redundant, since we already using igt_require(i915).

> +			/* Until this is force enabled, force modeset evasion. */
> +			if (stat("/sys/module/i915/parameters/fastboot", &sb) == 0)
> +				igt_set_module_param_int(data->drm_fd, "fastboot", 1);
> +
> +			igt_require(intel_display_ver(intel_get_drm_devid(display->drm_fd)) >= 5);
> +		}
>   
> -		igt_require(intel_display_ver(intel_get_drm_devid(display->drm_fd)) >= 5);
> +		igt_require(display->is_atomic);

This should be moved to igt_fixture just before calling the 
igt_subtest_with_dynamic()

Apart from these minor changes, overall this patch LGTM.

- Bhanu

>   	}
>   
> -	igt_require(display->is_atomic);
>   	for_each_pipe_with_valid_output(display, pipe, output) {
> +		/* Check that the "scaling mode" property has been set. */
>   		if (!igt_output_has_prop(output, IGT_CONNECTOR_SCALING_MODE))
>   			continue;
>   
>   		cleanup_crtc(data);
> -		test_panel_fitting_fastset(display, pipe, output);
> -		valid_tests++;
> +
> +		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
> +			if (type == TEST_ATOMIC)
> +				test_panel_fitting_fastset(display, pipe, output);
> +			if (type == TEST_LEGACY)
> +				test_panel_fitting_legacy(data, display, pipe, output);
> +		}
>   	}
> -	igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
>   }
>   
>   igt_main
> @@ -275,12 +274,12 @@ igt_main
>   	}
>   
>   	igt_describe("Tests panel fitting usages with legacy style commit.");
> -	igt_subtest("legacy")
> -		test_panel_fitting(&data);
> +	igt_subtest_with_dynamic("legacy")
> +		test_panel_fitting(&data, TEST_LEGACY);
>   
>   	igt_describe("Tests panel fitting usages with atomic fastset.");
> -	igt_subtest("atomic-fastset")
> -		test_atomic_fastset(&data);
> +	igt_subtest_with_dynamic("atomic-fastset")
> +		test_panel_fitting(&data, TEST_ATOMIC);
>   
>   	igt_fixture
>   		igt_display_fini(&data.display);
