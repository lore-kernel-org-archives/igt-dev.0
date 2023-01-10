Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BFC10E196
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jan 2023 18:44:00 +0000 (UTC)
Message-ID: <864c7ff1-4964-9d99-227a-9179430ab7b8@amd.com>
Date: Tue, 10 Jan 2023 11:43:54 -0700
Content-Language: en-US
To: Alaa Emad <aemad@igalia.com>, igt-dev@lists.freedesktop.org
References: <cover.1673098992.git.aemad@igalia.com>
 <fa0ed17d66ec1bffed2e6229769379da7ff9801f.1673098992.git.aemad@igalia.com>
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <fa0ed17d66ec1bffed2e6229769379da7ff9801f.1673098992.git.aemad@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH RFC i-g-t v2 8/8] tests/kms_universal_plane:
 create the run_functional_test_pipe and call all tests from it
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2023-01-07 06:45, Alaa Emad wrote:
> after decoupling `functional_test_pipe` to seven subtests, create the `run_functional_test_pipe` and
> call all tests from it and improve subtests's code.
> 
> Signed-off-by: Alaa Emad <aemad@igalia.com>
> ---
>   tests/kms_universal_plane.c | 764 ++++++++----------------------------
>   1 file changed, 166 insertions(+), 598 deletions(-)
> 
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 743ccbc6..1d6353aa 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -113,423 +113,192 @@ functional_test_fini(functional_test_t *test, igt_output_t *output)
>   }
>   
>   static void
> -test_legacy_atomic_interfaces(data_t *data, enum pipe pipe, igt_output_t *output)
> +test_legacy_atomic_interfaces(functional_test_t *test, igt_plane_t *primary, igt_plane_t *sprite, igt_output_t *output)
>   {
> -	functional_test_t test = { .data = data };
> +	data_t *data = test->data;
>   	igt_display_t *display = &data->display;
> -	igt_plane_t *primary, *sprite;
> -	int num_primary = 0, num_cursor = 0;
> -	int i;
> -
> -	igt_require_pipe(display, pipe);
> -
> -	igt_info("Testing connector %s using pipe %s\n", igt_output_name(output),
> -		 kmstest_pipe_name(pipe));
> -
> -	functional_test_init(&test, output, pipe);
> -
> -	/*
> -	 * Make sure we have no more than one primary or cursor plane per crtc.
> -	 * If the kernel accidentally calls drm_plane_init() rather than
> -	 * drm_universal_plane_init(), the type enum can get interpreted as a
> -	 * boolean and show up in userspace as the wrong type.
> -	 */
> -	for (i = 0; i < display->pipes[pipe].n_planes; i++)
> -		if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_PRIMARY)
> -			num_primary++;
> -		else if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_CURSOR)
> -			num_cursor++;
> -
> -	igt_warn_on(num_primary != 1);
> -	igt_warn_on(num_cursor > 1);
> -
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	sprite = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
> -	if (!sprite) {
> -		functional_test_fini(&test, output);
> -		igt_skip("No sprite plane available\n");
> -	}
> -
> -	igt_plane_set_position(sprite, 100, 100);
> -
> -	/* Step 2: Legacy API', blue primary, red sprite (CRC 2) */
> -	igt_plane_set_fb(primary, &test.blue_fb);
> -	igt_plane_set_fb(sprite, &test.red_fb);
> +	
> +	/* Legacy API', blue primary, red sprite (CRC 2) */
> +	igt_plane_set_fb(primary, &test->blue_fb);
> +	igt_plane_set_fb(sprite, &test->red_fb);
>   	igt_display_commit2(display, COMMIT_LEGACY);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_2);
> +	igt_pipe_crc_collect_crc(test->pipe_crc, &test->crc_2);
>   
> -	/* Step 4: Universal API's, blue primary, red sprite (CRC 4) */
> -	igt_plane_set_fb(primary, &test.blue_fb);
> -	igt_plane_set_fb(sprite, &test.red_fb);
> +	/* Universal API's, blue primary, red sprite (CRC 4) */
> +	igt_plane_set_fb(primary, &test->blue_fb);
> +	igt_plane_set_fb(sprite, &test->red_fb);
>   	igt_display_commit2(display, COMMIT_UNIVERSAL);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_4);
> -
> +	igt_pipe_crc_collect_crc(test->pipe_crc, &test->crc_4);
>   
>   	/* Blue bg + red sprite should be same under both types of API's */
> -	igt_assert_crc_equal(&test.crc_2, &test.crc_4);
> -
> -	igt_plane_set_fb(primary, NULL);
> -	igt_plane_set_fb(sprite, NULL);
> +	igt_assert_crc_equal(&test->crc_2, &test->crc_4);
>   
> -	functional_test_fini(&test, output);
>   }
>   
> -//SUCCESS on VKMS and i915
>   static void
> -test_disable_primary_red_sprite(data_t *data, enum pipe pipe, igt_output_t *output)
> +test_disable_primary_red_sprite(functional_test_t *test, igt_plane_t *primary, igt_plane_t *sprite, igt_output_t *output)
>   {
> -	functional_test_t test = { .data = data };
> +	data_t *data = test->data;
>   	igt_display_t *display = &data->display;
> -	igt_plane_t *primary, *sprite;
> -	int num_primary = 0, num_cursor = 0;
> -	int i;
>   
> -	igt_require_pipe(display, pipe);
> -
> -	igt_info("Testing connector %s using pipe %s\n", igt_output_name(output),
> -		 kmstest_pipe_name(pipe));
> -
> -	functional_test_init(&test, output, pipe);
> -
> -	/*
> -	 * Make sure we have no more than one primary or cursor plane per crtc.
> -	 * If the kernel accidentally calls drm_plane_init() rather than
> -	 * drm_universal_plane_init(), the type enum can get interpreted as a
> -	 * boolean and show up in userspace as the wrong type.
> -	 */
> -	for (i = 0; i < display->pipes[pipe].n_planes; i++)
> -		if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_PRIMARY)
> -			num_primary++;
> -		else if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_CURSOR)
> -			num_cursor++;
> -
> -	igt_warn_on(num_primary != 1);
> -	igt_warn_on(num_cursor > 1);
> -
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	sprite = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
> -	if (!sprite) {
> -		functional_test_fini(&test, output);
> -		igt_skip("No sprite plane available\n");
> -	}
> -
> -	igt_plane_set_position(sprite, 100, 100);
> -
> -	/* Step 1: Legacy API's, black primary, red sprite (CRC 1) */
> -	igt_plane_set_fb(primary, &test.black_fb);
> -	igt_plane_set_fb(sprite, &test.red_fb);
> +	/* Legacy API's, black primary, red sprite (CRC 1) */
> +	igt_plane_set_fb(primary, &test->black_fb);
> +	igt_plane_set_fb(sprite, &test->red_fb);
>   	igt_display_commit2(display, COMMIT_LEGACY);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_1);
> +	igt_pipe_crc_collect_crc(test->pipe_crc, &test->crc_1);
>   

The below two "if (!is_amdgpu_device(data->drm_fd))" can be combined.
> +	/* Universal API's, disable primary plane (CRC 5) */
>   	if (!is_amdgpu_device(data->drm_fd)) {
>   		igt_plane_set_fb(primary, NULL);
>   		igt_display_commit2(display, COMMIT_UNIVERSAL);
> -		igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_5);
> +		igt_pipe_crc_collect_crc(test->pipe_crc, &test->crc_5);
>   	}
>   
>   	/* Disabling primary plane should be same as black primary */
>   	if (!is_amdgpu_device(data->drm_fd))
> -		igt_assert_crc_equal(&test.crc_1, &test.crc_5);
> -
> -	igt_plane_set_fb(primary, NULL);
> -	igt_plane_set_fb(sprite, NULL);
> +		igt_assert_crc_equal(&test->crc_1, &test->crc_5);
>   
> -	functional_test_fini(&test, output);
>   }
>   
>   static void
> -test_re_enable_primary_with_blue(data_t *data, enum pipe pipe, igt_output_t *output)
> +test_re_enable_primary_with_blue(functional_test_t *test, igt_plane_t *primary, igt_plane_t *sprite, igt_output_t *output)
>   {
> -	functional_test_t test = { .data = data };
> +	data_t *data = test->data;
>   	igt_display_t *display = &data->display;
> -	igt_plane_t *primary, *sprite;
> -	int num_primary = 0, num_cursor = 0;
> -	int i;
>   
> -	igt_require_pipe(display, pipe);
> -
> -	igt_info("Testing connector %s using pipe %s\n", igt_output_name(output),
> -		 kmstest_pipe_name(pipe));
> -
> -	functional_test_init(&test, output, pipe);
> -
> -	/*
> -	 * Make sure we have no more than one primary or cursor plane per crtc.
> -	 * If the kernel accidentally calls drm_plane_init() rather than
> -	 * drm_universal_plane_init(), the type enum can get interpreted as a
> -	 * boolean and show up in userspace as the wrong type.
> -	 */
> -	for (i = 0; i < display->pipes[pipe].n_planes; i++)
> -		if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_PRIMARY)
> -			num_primary++;
> -		else if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_CURSOR)
> -			num_cursor++;
> -
> -	igt_warn_on(num_primary != 1);
> -	igt_warn_on(num_cursor > 1);
> -
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	sprite = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
> -	if (!sprite) {
> -		functional_test_fini(&test, output);
> -		igt_skip("No sprite plane available\n");
> -	}
> -
> -	igt_plane_set_position(sprite, 100, 100);
> -
> -	/* Step 2: Legacy API', blue primary, red sprite (CRC 2) */
> -	igt_plane_set_fb(primary, &test.blue_fb);
> -	igt_plane_set_fb(sprite, &test.red_fb);
> +	/* Legacy API', blue primary, red sprite (CRC 2) */
> +	igt_plane_set_fb(primary, &test->blue_fb);
> +	igt_plane_set_fb(sprite, &test->red_fb);
>   	igt_display_commit2(display, COMMIT_LEGACY);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_2);
> +	igt_pipe_crc_collect_crc(test->pipe_crc, &test->crc_2);
>   
> -	igt_plane_set_fb(primary, NULL);
> -	igt_display_commit2(display, COMMIT_UNIVERSAL);
> +	if (!is_amdgpu_device(data->drm_fd)){
> +		igt_plane_set_fb(primary, NULL);
> +		igt_display_commit2(display, COMMIT_UNIVERSAL);
> +	}
>   
> -	/* Step 6: Universal API's, re-enable primary with blue (CRC 6) */
> -	igt_plane_set_fb(primary, &test.blue_fb);
> +	/* Universal API's, re-enable primary with blue (CRC 6) */
> +	igt_plane_set_fb(primary, &test->blue_fb);
>   	igt_display_commit2(display, COMMIT_UNIVERSAL);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_6);
> +	igt_pipe_crc_collect_crc(test->pipe_crc, &test->crc_6);
>   
>   	/* Re-enabling primary should return to blue properly */
> -	igt_assert_crc_equal(&test.crc_2, &test.crc_6);
> -
> -	igt_plane_set_fb(primary, NULL);
> -	igt_plane_set_fb(sprite, NULL);
> -
> -	functional_test_fini(&test, output);
> +	igt_assert_crc_equal(&test->crc_2, &test->crc_6);
>   }
>   
> -
>   static void
> -test_universal_api_with_crtc_off(data_t *data, enum pipe pipe, igt_output_t *output)
> +test_universal_api_with_crtc_off(functional_test_t *test, igt_plane_t *primary, igt_plane_t *sprite, igt_output_t *output)
>   {
> -	functional_test_t test = { .data = data };
> +	data_t *data = test->data;
>   	igt_display_t *display = &data->display;
> -	igt_plane_t *primary, *sprite;
> -	int num_primary = 0, num_cursor = 0;
> -	int i;
>   
> -	igt_require_pipe(display, pipe);
> -
> -	igt_info("Testing connector %s using pipe %s\n", igt_output_name(output),
> -		 kmstest_pipe_name(pipe));
> -
> -	functional_test_init(&test, output, pipe);
> -
> -	/*
> -	 * Make sure we have no more than one primary or cursor plane per crtc.
> -	 * If the kernel accidentally calls drm_plane_init() rather than
> -	 * drm_universal_plane_init(), the type enum can get interpreted as a
> -	 * boolean and show up in userspace as the wrong type.
> -	 */
> -	for (i = 0; i < display->pipes[pipe].n_planes; i++)
> -		if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_PRIMARY)
> -			num_primary++;
> -		else if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_CURSOR)
> -			num_cursor++;
> -
> -	igt_warn_on(num_primary != 1);
> -	igt_warn_on(num_cursor > 1);
> -
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	sprite = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
> -	if (!sprite) {
> -		functional_test_fini(&test, output);
> -		igt_skip("No sprite plane available\n");
> -	}
> -
> -	igt_plane_set_position(sprite, 100, 100);
> -
> -	/* Step 2: Legacy API', blue primary, red sprite (CRC 2) */
> -	igt_plane_set_fb(primary, &test.blue_fb);
> -	igt_plane_set_fb(sprite, &test.red_fb);
> +	/* Legacy API', blue primary, red sprite (CRC 2) */
> +	igt_plane_set_fb(primary, &test->blue_fb);
> +	igt_plane_set_fb(sprite, &test->red_fb);
>   	igt_display_commit2(display, COMMIT_LEGACY);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_2);
> +	igt_pipe_crc_collect_crc(test->pipe_crc, &test->crc_2);
>   
> -	/* Step 7: Legacy API's, yellow primary, no sprite */
> -	igt_plane_set_fb(primary, &test.yellow_fb);
> +	/* Legacy API's, yellow primary, no sprite */
> +	igt_plane_set_fb(primary, &test->yellow_fb);
>   	igt_plane_set_fb(sprite, NULL);
>   	igt_display_commit2(display, COMMIT_LEGACY);
>   
> -	/* Step 8: Disable CRTC */
> +	/* Disable CRTC */
>   	igt_plane_set_fb(primary, NULL);
>   	igt_display_commit2(display, COMMIT_LEGACY);
>   
> -	/* Step 9: Universal API's with crtc off:
> +	/* Universal API's with crtc off:
>   	 *  - red sprite
>   	 *  - multiple primary fb's, ending in blue
>   	 */
> -	igt_plane_set_fb(sprite, &test.red_fb);
> +	igt_plane_set_fb(sprite, &test->red_fb);
>   	igt_display_commit2(display, COMMIT_UNIVERSAL);
> -	igt_plane_set_fb(primary, &test.yellow_fb);
> +	igt_plane_set_fb(primary, &test->yellow_fb);
>   	igt_display_commit2(display, COMMIT_UNIVERSAL);
> -	igt_plane_set_fb(primary, &test.black_fb);
> +	igt_plane_set_fb(primary, &test->black_fb);
>   	igt_display_commit2(display, COMMIT_UNIVERSAL);
> -	igt_plane_set_fb(primary, &test.blue_fb);
> +	igt_plane_set_fb(primary, &test->blue_fb);
>   	igt_display_commit2(display, COMMIT_UNIVERSAL);
>   
> -	/* Step 10: Enable crtc (fb = -1), take CRC (CRC 7) */
> +	/* Enable crtc (fb = -1), take CRC (CRC 7) */
>   	igt_assert(drmModeSetCrtc(data->drm_fd, output->config.crtc->crtc_id, -1,
>   				  0, 0, &output->config.connector->connector_id,
> -				  1, test.mode) == 0);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_7);
> +				  1, test->mode) == 0);
> +	igt_pipe_crc_collect_crc(test->pipe_crc, &test->crc_7);
>   	
>   	/*
>   	 * We should be able to setup plane FB's while CRTC is disabled and
>   	 * then have them pop up correctly when the CRTC is re-enabled.
>   	 */
> -	igt_assert_crc_equal(&test.crc_2, &test.crc_7);
> -
> -
> -	igt_plane_set_fb(primary, NULL);
> -	igt_plane_set_fb(sprite, NULL);
> -
> -	functional_test_fini(&test, output);
> +	igt_assert_crc_equal(&test->crc_2, &test->crc_7);
>   }
>   
> -//SUCCESS on VKMS and i915
>   static void
> -test_legacy_modeset_to_yellow_fb(data_t *data, enum pipe pipe, igt_output_t *output)
> +test_legacy_modeset_to_yellow_fb(functional_test_t *test, igt_plane_t *primary, igt_plane_t *sprite, igt_output_t *output)
>   {
> -	functional_test_t test = { .data = data };
> +	data_t *data = test->data;
>   	igt_display_t *display = &data->display;
> -	igt_plane_t *primary, *sprite;
> -	int num_primary = 0, num_cursor = 0;
> -	int i;
> -
> -	igt_require_pipe(display, pipe);
> -
> -	igt_info("Testing connector %s using pipe %s\n", igt_output_name(output),
> -		 kmstest_pipe_name(pipe));
> -
> -	functional_test_init(&test, output, pipe);
> -
> -	/*
> -	 * Make sure we have no more than one primary or cursor plane per crtc.
> -	 * If the kernel accidentally calls drm_plane_init() rather than
> -	 * drm_universal_plane_init(), the type enum can get interpreted as a
> -	 * boolean and show up in userspace as the wrong type.
> -	 */
> -	for (i = 0; i < display->pipes[pipe].n_planes; i++)
> -		if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_PRIMARY)
> -			num_primary++;
> -		else if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_CURSOR)
> -			num_cursor++;
> -
> -	igt_warn_on(num_primary != 1);
> -	igt_warn_on(num_cursor > 1);
>   
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	sprite = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
> -	if (!sprite) {
> -		functional_test_fini(&test, output);
> -		igt_skip("No sprite plane available\n");
> -	}
> -
> -	igt_plane_set_position(sprite, 100, 100);
> -
> -	/* Step 3: Legacy API's, yellow primary (CRC 3) */
> -	igt_plane_set_fb(primary, &test.yellow_fb);
> +	/* Legacy API's, yellow primary (CRC 3) */
> +	igt_plane_set_fb(primary, &test->yellow_fb);
>   	igt_display_commit2(display, COMMIT_LEGACY);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_3);
> +	igt_pipe_crc_collect_crc(test->pipe_crc, &test->crc_3);
>   
> -	/* Step 11: Disable primary plane */
> -	igt_plane_set_fb(primary, NULL);
> -	igt_display_commit2(display, COMMIT_UNIVERSAL);
> +	/* Disable primary plane */
> +	if (!is_amdgpu_device(data->drm_fd)) {
> +		igt_plane_set_fb(primary, NULL);
> +		igt_display_commit2(display, COMMIT_UNIVERSAL);
> +	}
>   
> -	/* Step 12: Legacy modeset to yellow FB (CRC 8) */
> -	igt_plane_set_fb(primary, &test.yellow_fb);
> +	/* Legacy modeset to yellow FB (CRC 8) */
> +	igt_plane_set_fb(primary, &test->yellow_fb);
>   	igt_display_commit2(display, COMMIT_LEGACY);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_8);
> +	igt_pipe_crc_collect_crc(test->pipe_crc, &test->crc_8);
>   
>   	/*
>   	 * We should be able to modeset with the primary plane off
>   	 * successfully
>   	 */
> -	igt_assert_crc_equal(&test.crc_3, &test.crc_8);
> -
> -	igt_plane_set_fb(primary, NULL);
> -	igt_plane_set_fb(sprite, NULL);
> -
> -	functional_test_fini(&test, output);
> +	igt_assert_crc_equal(&test->crc_3, &test->crc_8);
>   }
>   
> -//FAIL on VKMS
> -//SUCCESS on i915
>   static void
> -test_set_primary_completely_offscreen(data_t *data, enum pipe pipe, igt_output_t *output)
> +test_set_primary_completely_offscreen(functional_test_t *test, igt_plane_t *primary, igt_plane_t *sprite, igt_output_t *output)
>   {
> -	functional_test_t test = { .data = data };
> +	data_t *data = test->data;
>   	igt_display_t *display = &data->display;
> -	igt_plane_t *primary, *sprite;
> -	int num_primary = 0, num_cursor = 0;
> -	int i;
> -
> -	igt_require_pipe(display, pipe);
> -
> -	igt_info("Testing connector %s using pipe %s\n", igt_output_name(output),
> -		 kmstest_pipe_name(pipe));
> -
> -	functional_test_init(&test, output, pipe);
> -
> -	/*
> -	 * Make sure we have no more than one primary or cursor plane per crtc.
> -	 * If the kernel accidentally calls drm_plane_init() rather than
> -	 * drm_universal_plane_init(), the type enum can get interpreted as a
> -	 * boolean and show up in userspace as the wrong type.
> -	 */
> -	for (i = 0; i < display->pipes[pipe].n_planes; i++)
> -		if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_PRIMARY)
> -			num_primary++;
> -		else if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_CURSOR)
> -			num_cursor++;
>   
> -	igt_warn_on(num_primary != 1);
> -	igt_warn_on(num_cursor > 1);
> -
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	sprite = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
> -	if (!sprite) {
> -		functional_test_fini(&test, output);
> -		igt_skip("No sprite plane available\n");
> -	}
> -
> -	igt_plane_set_position(sprite, 100, 100);
> -
> -	/* Step 3: Legacy API's, yellow primary (CRC 3) */
> -	igt_plane_set_fb(primary, &test.yellow_fb);
> +	/* Legacy API's, yellow primary  */
> +	igt_plane_set_fb(primary, &test->yellow_fb);
>   	igt_display_commit2(display, COMMIT_LEGACY);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_3);
>   
> -	/* Step 4: Universal API's, blue primary, red sprite (CRC 4) */
> -	igt_plane_set_fb(primary, &test.blue_fb);
> -	igt_plane_set_fb(sprite, &test.red_fb);
> +	/* Universal API's, blue primary, red sprite */
> +	igt_plane_set_fb(primary, &test->blue_fb);
> +	igt_plane_set_fb(sprite, &test->red_fb);
>   	igt_display_commit2(display, COMMIT_UNIVERSAL);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_4);
>   
>   	/* Step 5: Universal API's, disable primary plane (CRC 5) */

"Step 5" should be removed as well.

>   	if (!is_amdgpu_device(data->drm_fd)) {
>   		igt_plane_set_fb(primary, NULL);
>   		igt_display_commit2(display, COMMIT_UNIVERSAL);
> -		igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_5);
> +		igt_pipe_crc_collect_crc(test->pipe_crc, &test->crc_5);
>   	}
>   
>   	/*
> -	 * Step 14: Universal API, set primary completely offscreen (CRC 9).
> +	 * Universal API, set primary completely offscreen (CRC 9).
>   	 * Skip on amdgpu which rejects offscreen planes.
>   	 */
>   	if (!is_amdgpu_device(data->drm_fd)) {

The "if(!is_amdgpu_device(data->drm_fd))" can be combined with the 
previous one.

>   		igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
>   					   output->config.crtc->crtc_id,
> -					   test.blue_fb.fb_id, 0,
> +					   test->blue_fb.fb_id, 0,
>   					   9000, 9000,
> -					   test.mode->hdisplay,
> -					   test.mode->vdisplay,
> +					   test->mode->hdisplay,
> +					   test->mode->vdisplay,
>   					   IGT_FIXED(0,0), IGT_FIXED(0,0),
> -					   IGT_FIXED(test.mode->hdisplay,0),
> -					   IGT_FIXED(test.mode->vdisplay,0)) == 0);
> -		igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_9);
> +					   IGT_FIXED(test->mode->hdisplay,0),
> +					   IGT_FIXED(test->mode->vdisplay,0)) == 0);
> +		igt_pipe_crc_collect_crc(test->pipe_crc, &test->crc_9);
>   	}
>   
>   	/*
> @@ -538,99 +307,52 @@ test_set_primary_completely_offscreen(data_t *data, enum pipe pipe, igt_output_t
>   	 * skipped with offscreen planes previously.
>   	 */
>   	if (!is_amdgpu_device(data->drm_fd))
So is this one.

> -		igt_assert_crc_equal(&test.crc_5, &test.crc_9);
> -
> -	igt_plane_set_fb(primary, NULL);
> -	igt_plane_set_fb(sprite, NULL);
> -
> -	functional_test_fini(&test, output);
> +		igt_assert_crc_equal(&test->crc_5, &test->crc_9);
>   }
>   
> -//SUCCESS on VKMS and i915
> +
>   static void
> -test_explicitly_disable_primary(data_t *data, enum pipe pipe, igt_output_t *output)
> +test_explicitly_disable_primary(functional_test_t *test, igt_plane_t *primary, igt_plane_t *sprite, igt_output_t *output)
>   {
> -	functional_test_t test = {.data = data};
> +	data_t *data = test->data;
>   	igt_display_t *display = &data->display;
> -	igt_plane_t *primary, *sprite;
> -	int num_primary = 0, num_cursor = 0;
> -	int i;
> -
> -	igt_require_pipe(display, pipe);
>   
> -	igt_info("Testing connector %s using pipe %s\n", igt_output_name(output),
> -			 kmstest_pipe_name(pipe));
> -
> -	functional_test_init(&test, output, pipe);
> -
> -	/*
> -	 * Make sure we have no more than one primary or cursor plane per crtc.
> -	 * If the kernel accidentally calls drm_plane_init() rather than
> -	 * drm_universal_plane_init(), the type enum can get interpreted as a
> -	 * boolean and show up in userspace as the wrong type.
> -	 */
> -	for (i = 0; i < display->pipes[pipe].n_planes; i++)
> -		if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_PRIMARY)
> -			num_primary++;
> -		else if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_CURSOR)
> -			num_cursor++;
> -
> -	igt_warn_on(num_primary != 1);
> -	igt_warn_on(num_cursor > 1);
> -
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	sprite = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
> -	if (!sprite)
> -	{
> -		functional_test_fini(&test, output);
> -		igt_skip("No sprite plane available\n");
> -	}
> -
> -	igt_plane_set_position(sprite, 100, 100);
> -
> -	/* Step 3: Legacy API's, yellow primary (CRC 3) */
> -	igt_plane_set_fb(primary, &test.yellow_fb);
> +	/* Legacy API's, yellow primary */
> +	igt_plane_set_fb(primary, &test->yellow_fb);
>   	igt_display_commit2(display, COMMIT_LEGACY);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_3);
>   
> -	/* Step 4: Universal API's, blue primary, red sprite (CRC 4) */
> -	igt_plane_set_fb(primary, &test.blue_fb);
> -	igt_plane_set_fb(sprite, &test.red_fb);
> +	/* Universal API's, blue primary, red sprite */
> +	igt_plane_set_fb(primary, &test->blue_fb);
> +	igt_plane_set_fb(sprite, &test->red_fb);
>   	igt_display_commit2(display, COMMIT_UNIVERSAL);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_4);
>   
> -	/* Step 5: Universal API's, disable primary plane (CRC 5) */
> +	/* Universal API's, disable primary plane */

The below two "if (!is_amdgpu_device(data->drm_fd))" can be combined.
>   	if (!is_amdgpu_device(data->drm_fd)) {
>   		igt_plane_set_fb(primary, NULL);
>   		igt_display_commit2(display, COMMIT_UNIVERSAL);
> -		igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_5);
> +		igt_pipe_crc_collect_crc(test->pipe_crc, &test->crc_5);
>   	}
>   
>   	/*
> -	 * Step 15: Explicitly disable primary after it's already been
> +	 * Explicitly disable primary after it's already been
>   	 * implicitly disabled (CRC 10).
>   	 */
>   	if (!is_amdgpu_device(data->drm_fd)) {
>   		igt_plane_set_fb(primary, NULL);
>   		igt_display_commit2(display, COMMIT_UNIVERSAL);
> -		igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_10);
> +		igt_pipe_crc_collect_crc(test->pipe_crc, &test->crc_10);
>   	}
>   
> -	/* Step 16: Legacy API's, blue primary, red sprite */
> -	igt_plane_set_fb(primary, &test.blue_fb);
> -	igt_plane_set_fb(sprite, &test.red_fb);
> +	/* Legacy API's, blue primary, red sprite */
> +	igt_plane_set_fb(primary, &test->blue_fb);
> +	igt_plane_set_fb(sprite, &test->red_fb);
>   	igt_display_commit2(display, COMMIT_LEGACY);
>   
>   	/*
>   	 * We should be able to explicitly disable an already
>   	 * implicitly-disabled primary plane
>   	 */
> -	igt_assert_crc_equal(&test.crc_5, &test.crc_10);
> -
> -	igt_plane_set_fb(primary, NULL);
> -	igt_plane_set_fb(sprite, NULL);
> -
> -	functional_test_fini(&test, output);
> +	igt_assert_crc_equal(&test->crc_5, &test->crc_10);
>   }
>   
>   
> @@ -650,196 +372,88 @@ test_explicitly_disable_primary(data_t *data, enum pipe pipe, igt_output_t *outp
>    *   - Enable CRTC, grab CRC:6 (should be same as CRC:2)
>    */
>   static void
> -functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
> +run_functional_test_pipe(data_t *data, enum pipe pipe)
>   {
> -	functional_test_t test = { .data = data };
> +	igt_output_t *output;
> +	functional_test_t test = {.data = data};
>   	igt_display_t *display = &data->display;
>   	igt_plane_t *primary, *sprite;
>   	int num_primary = 0, num_cursor = 0;
>   	int i;
> +	
> +	struct {
> +		const char *name;
> +		void (*testfunc) (functional_test_t*, igt_plane_t*, igt_plane_t* , igt_output_t*);
> +		const char *desc;
> +	} functional_tests[] = {
> +		{ "test-legacy-atomic-interfaces", test_legacy_atomic_interfaces,
> +		  " Blue bg + red sprite should be same under both types of API's " },
>   
> -	igt_require_pipe(display, pipe);
> -
> -	igt_info("Testing connector %s using pipe %s\n", igt_output_name(output),
> -		 kmstest_pipe_name(pipe));
> -
> -	functional_test_init(&test, output, pipe);
> +		{ "test-disable-primary-red-sprite", test_disable_primary_red_sprite,
> +		  "Disabling primary plane should be same as black primary " },
>   
> -	/*
> -	 * Make sure we have no more than one primary or cursor plane per crtc.
> -	 * If the kernel accidentally calls drm_plane_init() rather than
> -	 * drm_universal_plane_init(), the type enum can get interpreted as a
> -	 * boolean and show up in userspace as the wrong type.
> -	 */
> -	for (i = 0; i < display->pipes[pipe].n_planes; i++)
> -		if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_PRIMARY)
> -			num_primary++;
> -		else if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_CURSOR)
> -			num_cursor++;
> +		{ "test-re-enable-primary-with-blue", test_re_enable_primary_with_blue,
> +		  "Re-enabling primary should return to blue properly " },
>   
> -	igt_warn_on(num_primary != 1);
> -	igt_warn_on(num_cursor > 1);
> +		{ "test-universal-api-with-crtc-off", test_universal_api_with_crtc_off,
> +		  " setup plane FB's while CRTC is disabled and then have them pop up correctly when the CRTC is re-enabled" },
>   
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	sprite = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
> -	if (!sprite) {
> -		functional_test_fini(&test, output);
> -		igt_skip("No sprite plane available\n");
> -	}
> +		{ "test-legacy-modeset-to-yellow-fb", test_legacy_modeset_to_yellow_fb,
> +		  " modeset with the primary plane off successfully" },
>   
> -	igt_plane_set_position(sprite, 100, 100);
> +		{ "test-set-primary-completely-offscreen", test_set_primary_completely_offscreen,
> +		  " move the primary plane completely offscreen" },
>   
> -	/* Step 1: Legacy API's, black primary, red sprite (CRC 1) */
> -	igt_plane_set_fb(primary, &test.black_fb);
> -	igt_plane_set_fb(sprite, &test.red_fb);
> -	igt_display_commit2(display, COMMIT_LEGACY);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_1);
> +		{ "test-explicitly-disable-primary", test_explicitly_disable_primary,
> +		  "explicitly disable an already implicitly-disabled primary plane " }
> +	};
>   
> -	/* Step 2: Legacy API', blue primary, red sprite (CRC 2) */
> -	igt_plane_set_fb(primary, &test.blue_fb);
> -	igt_plane_set_fb(sprite, &test.red_fb);
> -	igt_display_commit2(display, COMMIT_LEGACY);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_2);
> -
> -	/* Step 3: Legacy API's, yellow primary (CRC 3) */
> -	igt_plane_set_fb(primary, &test.yellow_fb);
> -	igt_display_commit2(display, COMMIT_LEGACY);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_3);
> -
> -	/* Step 4: Universal API's, blue primary, red sprite (CRC 4) */
> -	igt_plane_set_fb(primary, &test.blue_fb);
> -	igt_plane_set_fb(sprite, &test.red_fb);
> -	igt_display_commit2(display, COMMIT_UNIVERSAL);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_4);
> -
> -	/* Step 5: Universal API's, disable primary plane (CRC 5) */
> -	if (!is_amdgpu_device(data->drm_fd)) {
> -		igt_plane_set_fb(primary, NULL);
> -		igt_display_commit2(display, COMMIT_UNIVERSAL);
> -		igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_5);
> +	igt_fixture {
> +		igt_require_pipe(&data->display, pipe);
>   	}
>   
> -	/* Step 6: Universal API's, re-enable primary with blue (CRC 6) */
> -	igt_plane_set_fb(primary, &test.blue_fb);
> -	igt_display_commit2(display, COMMIT_UNIVERSAL);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_6);
> -
> -	/* Step 7: Legacy API's, yellow primary, no sprite */
> -	igt_plane_set_fb(primary, &test.yellow_fb);
> -	igt_plane_set_fb(sprite, NULL);
> -	igt_display_commit2(display, COMMIT_LEGACY);
> -
> -	/* Step 8: Disable CRTC */
> -	igt_plane_set_fb(primary, NULL);
> -	igt_display_commit2(display, COMMIT_LEGACY);
> -
> -	/* Step 9: Universal API's with crtc off:
> -	 *  - red sprite
> -	 *  - multiple primary fb's, ending in blue
> -	 */
> -	igt_plane_set_fb(sprite, &test.red_fb);
> -	igt_display_commit2(display, COMMIT_UNIVERSAL);
> -	igt_plane_set_fb(primary, &test.yellow_fb);
> -	igt_display_commit2(display, COMMIT_UNIVERSAL);
> -	igt_plane_set_fb(primary, &test.black_fb);
> -	igt_display_commit2(display, COMMIT_UNIVERSAL);
> -	igt_plane_set_fb(primary, &test.blue_fb);
> -	igt_display_commit2(display, COMMIT_UNIVERSAL);
> -
> -	/* Step 10: Enable crtc (fb = -1), take CRC (CRC 7) */
> -	igt_assert(drmModeSetCrtc(data->drm_fd, output->config.crtc->crtc_id, -1,
> -				  0, 0, &output->config.connector->connector_id,
> -				  1, test.mode) == 0);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_7);
> -
> -	/* Step 11: Disable primary plane */
> -	igt_output_set_pipe(output, PIPE_NONE);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> -	igt_plane_set_fb(primary, NULL);
> -	igt_display_commit2(display, COMMIT_UNIVERSAL);
> +	for (int index = 0; index < ARRAY_SIZE(functional_tests); index++) {
> +		igt_describe(functional_tests[index].desc);
> +		igt_subtest_group {	
> +			igt_subtest_f("%s-%s",functional_tests[index].name, kmstest_pipe_name(pipe)) {
> +				for_each_valid_output_on_pipe(&data->display, pipe, output) {
> +					igt_require_pipe(display, pipe);
> +
> +					igt_info("Testing connector %s using pipe %s\n", igt_output_name(output),
> +							kmstest_pipe_name(pipe));
> +
> +					functional_test_init(&test, output, pipe);
> +
> +					for (i = 0; i < display->pipes[pipe].n_planes; i++)
> +						if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_PRIMARY)
> +							num_primary++;
> +						else if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_CURSOR)
> +							num_cursor++;
> +					
> +					igt_warn_on(num_primary != 1);
> +					igt_warn_on(num_cursor > 1);
> +
> +					primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +					sprite = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
> +
> +					if (!sprite)
> +					{
> +						functional_test_fini(&test, output);
> +						igt_skip("No sprite plane available\n");
> +					}
> +
> +					igt_plane_set_position(sprite, 100, 100);
> +	
> +					functional_tests[index].testfunc(&test, primary, sprite, output);
>   
> -	/* Step 12: Legacy modeset to yellow FB (CRC 8) */
> -	igt_plane_set_fb(primary, &test.yellow_fb);
> -	igt_output_set_pipe(output, pipe);
> -	igt_display_commit2(display, COMMIT_LEGACY);
> -	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_8);
> +					igt_plane_set_fb(primary, NULL);
> +					igt_plane_set_fb(sprite, NULL);
>   
> -	/* Step 13: Legacy API', blue primary, red sprite */
> -	igt_plane_set_fb(primary, &test.blue_fb);
> -	igt_plane_set_fb(sprite, &test.red_fb);
> -	igt_display_commit2(display, COMMIT_LEGACY);
> -
> -	/*
> -	 * Step 14: Universal API, set primary completely offscreen (CRC 9).
> -	 * Skip on amdgpu which rejects offscreen planes.
> -	 */
> -	if (!is_amdgpu_device(data->drm_fd)) {
> -		igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
> -					   output->config.crtc->crtc_id,
> -					   test.blue_fb.fb_id, 0,
> -					   9000, 9000,
> -					   test.mode->hdisplay,
> -					   test.mode->vdisplay,
> -					   IGT_FIXED(0,0), IGT_FIXED(0,0),
> -					   IGT_FIXED(test.mode->hdisplay,0),
> -					   IGT_FIXED(test.mode->vdisplay,0)) == 0);
> -		igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_9);
> -	}
> -
> -	/*
> -	 * Step 15: Explicitly disable primary after it's already been
> -	 * implicitly disabled (CRC 10).
> -	 */
> -	if (!is_amdgpu_device(data->drm_fd)) {
> -		igt_plane_set_fb(primary, NULL);
> -		igt_display_commit2(display, COMMIT_UNIVERSAL);
> -		igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_10);
> +					functional_test_fini(&test, output);
> +				}
> +			}
> +		}
>   	}
> -
> -	/* Step 16: Legacy API's, blue primary, red sprite */
> -	igt_plane_set_fb(primary, &test.blue_fb);
> -	igt_plane_set_fb(sprite, &test.red_fb);
> -	igt_display_commit2(display, COMMIT_LEGACY);
> -
> -	/* Blue bg + red sprite should be same under both types of API's */
> -	igt_assert_crc_equal(&test.crc_2, &test.crc_4);
> -
> -	/* Disabling primary plane should be same as black primary */
> -	if (!is_amdgpu_device(data->drm_fd))
> -		igt_assert_crc_equal(&test.crc_1, &test.crc_5);
> -
> -	/* Re-enabling primary should return to blue properly */
> -	igt_assert_crc_equal(&test.crc_2, &test.crc_6);
> -
> -	/*
> -	 * We should be able to setup plane FB's while CRTC is disabled and
> -	 * then have them pop up correctly when the CRTC is re-enabled.
> -	 */
> -	igt_assert_crc_equal(&test.crc_2, &test.crc_7);
> -
> -	/*
> -	 * We should be able to modeset with the primary plane off
> -	 * successfully
> -	 */
> -	igt_assert_crc_equal(&test.crc_3, &test.crc_8);
> -
> -	/*
> -	 * We should be able to move the primary plane completely offscreen
> -	 * and have it disable successfully. Skip on amdgpu since crc_9 was
> -	 * skipped with offscreen planes previously.
> -	 */
> -	igt_assert_crc_equal(&test.crc_5, &test.crc_9);
> -
> -	/*
> -	 * We should be able to explicitly disable an already
> -	 * implicitly-disabled primary plane
> -	 */
> -	igt_assert_crc_equal(&test.crc_5, &test.crc_10);
> -
> -	igt_plane_set_fb(primary, NULL);
> -	igt_plane_set_fb(sprite, NULL);
> -
> -	functional_test_fini(&test, output);
>   }
>   
>   static void
> @@ -1303,54 +917,6 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
>   
>   		igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
>   	}
> -	
> -	igt_describe("Check the switching between different primary plane fbs with CRTC off");
> -	igt_subtest_f("test-legacy-atomic-interfaces-%s",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			test_legacy_atomic_interfaces(data, pipe, output);
> -
> -	igt_describe("Check the switching between different primary plane fbs with CRTC off");
> -	igt_subtest_f("disable-primary-red-sprite-%s",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			test_disable_primary_red_sprite(data, pipe, output);
> -
> -	igt_describe("Check the switching between different primary plane fbs with CRTC off");
> -	igt_subtest_f("re-enable-primary-with-blue-%s",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			test_re_enable_primary_with_blue(data, pipe, output);
> -
> -	igt_describe("Check the switching between different primary plane fbs with CRTC off");
> -	igt_subtest_f("universal-api-with-crtc-off-%s",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			test_universal_api_with_crtc_off(data, pipe, output);
> -
> -	igt_describe("Check the switching between different primary plane fbs with CRTC off");
> -	igt_subtest_f("legacy-modeset-to-yellow-fb-%s",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			test_legacy_modeset_to_yellow_fb(data, pipe, output);
> -
> -	igt_describe("Check the switching between different primary plane fbs with CRTC off");
> -	igt_subtest_f("set-primary-completely-offscreen-%s",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			test_set_primary_completely_offscreen(data, pipe, output);
> -	
> -	igt_describe("Check the switching between different primary plane fbs with CRTC off");
> -	igt_subtest_f("explicitly-disable-primary-%s",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			test_explicitly_disable_primary(data, pipe, output);
> -
> -	igt_describe("Check the switching between different primary plane fbs with CRTC off");
> -	igt_subtest_f("universal-plane-pipe-%s-functional",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			functional_test_pipe(data, pipe, output);
>   
>   	igt_describe("Test for scale-up or scale-down using universal plane API without covering CRTC");
>   	igt_subtest_f("universal-plane-pipe-%s-sanity",
> @@ -1396,6 +962,8 @@ igt_main
>   	}
>   
>   	for_each_pipe_static(pipe) {
> +		igt_subtest_group
> +			run_functional_test_pipe(&data, pipe);
>   		igt_subtest_group
>   			run_tests_for_pipe(&data, pipe);
>   	}
