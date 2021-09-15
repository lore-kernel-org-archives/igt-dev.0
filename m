Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A496E8D0
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Sep 2021 05:55:05 +0000 (UTC)
References: <20210912160106.539575-1-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <d5b70f4c-a6e4-4957-e354-f223099287de@intel.com>
Date: Wed, 15 Sep 2021 11:24:50 +0530
In-Reply-To: <20210912160106.539575-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v3] tests/kms: Move Intel specific kms tests
 to i915 directory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, igt-dev@lists.freedesktop.org
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Mark
 Yacoub <markyacoub@chromium.org>, Petri Latvala <petri.latvala@intel.com>, Vidya Srinivas <vidya.srinivas@intel.com>, "Navare, Manasi" <manasi.d.navare@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 9/12/2021 9:31 PM, Bhanuprakash Modem wrote:
> As KMS tests on IGT are officially supported on multiple SoCs
> and there is an active development on it. So, KMS tests are
> meant to be generic and if we need to test few things specific
> to Intel, we can use igt_require_intel(). But if the whole test
> is Intel specific, then the best place for the test would be
> tests/i915.
>
> This patch will
> * Move all Intel specific kms tests to tests/i915 directory.
> * Update the tests those are generic but still open the driver
>    as 'drm_open_driver_master(DRIVER_INTEL);'.
>
> V2:
> * Few more tests
> V3:
> * Remove cleanups (will submit separate patch later)
> * Move few more tests to i915 dir (Karthik)
>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Vidya Srinivas <vidya.srinivas@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Reviewed-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>   tests/{ => i915}/kms_big_fb.c               |  0
>   tests/{ => i915}/kms_busy.c                 |  0
>   tests/{ => i915}/kms_ccs.c                  |  0
>   tests/{ => i915}/kms_cdclk.c                |  0
>   tests/{ => i915}/kms_draw_crc.c             |  0
>   tests/{ => i915}/kms_dsc.c                  | 15 ++++----
>   tests/{ => i915}/kms_fbcon_fbt.c            |  0
>   tests/{ => i915}/kms_fence_pin_leak.c       |  0
>   tests/{ => i915}/kms_flip_scaled_crc.c      |  0
>   tests/{ => i915}/kms_flip_tiling.c          |  0
>   tests/{ => i915}/kms_frontbuffer_tracking.c |  0
>   tests/{ => i915}/kms_invalid_dotclock.c     |  0
>   tests/{ => i915}/kms_legacy_colorkey.c      |  0
>   tests/{ => i915}/kms_mmap_write_crc.c       |  0
>   tests/{ => i915}/kms_pipe_b_c_ivb.c         |  0
>   tests/{ => i915}/kms_psr.c                  |  0
>   tests/{ => i915}/kms_psr2_sf.c              |  0
>   tests/{ => i915}/kms_psr2_su.c              |  0
>   tests/{ => i915}/kms_pwrite_crc.c           |  0
>   tests/kms_3d.c                              |  2 +-
>   tests/kms_big_joiner.c                      |  2 +-
>   tests/kms_cursor_edge_walk.c                |  5 +--
>   tests/kms_flip.c                            |  1 +
>   tests/kms_force_connector_basic.c           |  4 +--
>   tests/kms_hdmi_inject.c                     | 11 +++---
>   tests/kms_tv_load_detect.c                  |  2 +-
>   tests/kms_universal_plane.c                 | 10 ++++--
>   tests/meson.build                           | 38 ++++++++++-----------
>   28 files changed, 47 insertions(+), 43 deletions(-)
>   rename tests/{ => i915}/kms_big_fb.c (100%)
>   rename tests/{ => i915}/kms_busy.c (100%)
>   rename tests/{ => i915}/kms_ccs.c (100%)
>   rename tests/{ => i915}/kms_cdclk.c (100%)
>   rename tests/{ => i915}/kms_draw_crc.c (100%)
>   rename tests/{ => i915}/kms_dsc.c (95%)
>   rename tests/{ => i915}/kms_fbcon_fbt.c (100%)
>   rename tests/{ => i915}/kms_fence_pin_leak.c (100%)
>   rename tests/{ => i915}/kms_flip_scaled_crc.c (100%)
>   rename tests/{ => i915}/kms_flip_tiling.c (100%)
>   rename tests/{ => i915}/kms_frontbuffer_tracking.c (100%)
>   rename tests/{ => i915}/kms_invalid_dotclock.c (100%)
>   rename tests/{ => i915}/kms_legacy_colorkey.c (100%)
>   rename tests/{ => i915}/kms_mmap_write_crc.c (100%)
>   rename tests/{ => i915}/kms_pipe_b_c_ivb.c (100%)
>   rename tests/{ => i915}/kms_psr.c (100%)
>   rename tests/{ => i915}/kms_psr2_sf.c (100%)
>   rename tests/{ => i915}/kms_psr2_su.c (100%)
>   rename tests/{ => i915}/kms_pwrite_crc.c (100%)
>
> diff --git a/tests/kms_big_fb.c b/tests/i915/kms_big_fb.c
> similarity index 100%
> rename from tests/kms_big_fb.c
> rename to tests/i915/kms_big_fb.c
> diff --git a/tests/kms_busy.c b/tests/i915/kms_busy.c
> similarity index 100%
> rename from tests/kms_busy.c
> rename to tests/i915/kms_busy.c
> diff --git a/tests/kms_ccs.c b/tests/i915/kms_ccs.c
> similarity index 100%
> rename from tests/kms_ccs.c
> rename to tests/i915/kms_ccs.c
> diff --git a/tests/kms_cdclk.c b/tests/i915/kms_cdclk.c
> similarity index 100%
> rename from tests/kms_cdclk.c
> rename to tests/i915/kms_cdclk.c
> diff --git a/tests/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
> similarity index 100%
> rename from tests/kms_draw_crc.c
> rename to tests/i915/kms_draw_crc.c
> diff --git a/tests/kms_dsc.c b/tests/i915/kms_dsc.c
> similarity index 95%
> rename from tests/kms_dsc.c
> rename to tests/i915/kms_dsc.c
> index b56e01837..3e450207f 100644
> --- a/tests/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -244,14 +244,12 @@ static void run_test(data_t *data, enum dsc_test_type test_type)
>   			      &data->fb_test_pattern);
>   
>   	for_each_pipe(&data->display, pipe) {
> -		if (is_i915_device(data->drm_fd)) {
> -			uint32_t devid = intel_get_drm_devid(data->drm_fd);
> +		uint32_t devid = intel_get_drm_devid(data->drm_fd);
>   
> -			if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
> -			    pipe == PIPE_A && IS_GEN11(devid)) {
> -				igt_debug("DSC not supported on Pipe A on external DP in Gen11 platforms\n");
> -				continue;
> -			}
> +		if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
> +		    pipe == PIPE_A && IS_GEN11(devid)) {
> +			igt_debug("DSC not supported on Pipe A on external DP in Gen11 platforms\n");
> +			continue;
>   		}
>   
>   		snprintf(test_name, sizeof(test_name), "-%dbpp", data->compression_bpp);
> @@ -279,8 +277,7 @@ igt_main
>   	drmModeConnector *connector = NULL;
>   	int i, j;
>   	igt_fixture {
> -		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> -		igt_require_intel(data.drm_fd);
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
>   		data.devid = intel_get_drm_devid(data.drm_fd);
>   		kmstest_set_vt_graphics_mode();
>   		igt_install_exit_handler(kms_dsc_exit_handler);
> diff --git a/tests/kms_fbcon_fbt.c b/tests/i915/kms_fbcon_fbt.c
> similarity index 100%
> rename from tests/kms_fbcon_fbt.c
> rename to tests/i915/kms_fbcon_fbt.c
> diff --git a/tests/kms_fence_pin_leak.c b/tests/i915/kms_fence_pin_leak.c
> similarity index 100%
> rename from tests/kms_fence_pin_leak.c
> rename to tests/i915/kms_fence_pin_leak.c
> diff --git a/tests/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
> similarity index 100%
> rename from tests/kms_flip_scaled_crc.c
> rename to tests/i915/kms_flip_scaled_crc.c
> diff --git a/tests/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
> similarity index 100%
> rename from tests/kms_flip_tiling.c
> rename to tests/i915/kms_flip_tiling.c
> diff --git a/tests/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
> similarity index 100%
> rename from tests/kms_frontbuffer_tracking.c
> rename to tests/i915/kms_frontbuffer_tracking.c
> diff --git a/tests/kms_invalid_dotclock.c b/tests/i915/kms_invalid_dotclock.c
> similarity index 100%
> rename from tests/kms_invalid_dotclock.c
> rename to tests/i915/kms_invalid_dotclock.c
> diff --git a/tests/kms_legacy_colorkey.c b/tests/i915/kms_legacy_colorkey.c
> similarity index 100%
> rename from tests/kms_legacy_colorkey.c
> rename to tests/i915/kms_legacy_colorkey.c
> diff --git a/tests/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
> similarity index 100%
> rename from tests/kms_mmap_write_crc.c
> rename to tests/i915/kms_mmap_write_crc.c
> diff --git a/tests/kms_pipe_b_c_ivb.c b/tests/i915/kms_pipe_b_c_ivb.c
> similarity index 100%
> rename from tests/kms_pipe_b_c_ivb.c
> rename to tests/i915/kms_pipe_b_c_ivb.c
> diff --git a/tests/kms_psr.c b/tests/i915/kms_psr.c
> similarity index 100%
> rename from tests/kms_psr.c
> rename to tests/i915/kms_psr.c
> diff --git a/tests/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
> similarity index 100%
> rename from tests/kms_psr2_sf.c
> rename to tests/i915/kms_psr2_sf.c
> diff --git a/tests/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
> similarity index 100%
> rename from tests/kms_psr2_su.c
> rename to tests/i915/kms_psr2_su.c
> diff --git a/tests/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c
> similarity index 100%
> rename from tests/kms_pwrite_crc.c
> rename to tests/i915/kms_pwrite_crc.c
> diff --git a/tests/kms_3d.c b/tests/kms_3d.c
> index 2e438b430..8284100ee 100644
> --- a/tests/kms_3d.c
> +++ b/tests/kms_3d.c
> @@ -34,7 +34,7 @@ igt_simple_main
>   	const struct edid *edid;
>   	int mode_count, connector_id;
>   
> -	drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +	drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
>   	res = drmModeGetResources(drm_fd);
>   	igt_require(res);
> diff --git a/tests/kms_big_joiner.c b/tests/kms_big_joiner.c
> index 4f1f3152e..45c5b2a2a 100644
> --- a/tests/kms_big_joiner.c
> +++ b/tests/kms_big_joiner.c
> @@ -258,7 +258,7 @@ igt_main
>   	uint16_t width = 0, height = 0;
>   
>   	igt_fixture {
> -		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);

Hi,

Big joiner is an i915 specific feature. So please keep the DRIVER_INTEL 
check and move this test inside i915 directory.

With this change, the patch looks good to me.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

Thanks,

Karthik.B.S

>   		kmstest_set_vt_graphics_mode();
>   
>   		igt_display_require(&data.display, data.drm_fd);
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index e9902f5e7..fbfc275c4 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -312,9 +312,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   	igt_fixture {
>   		int ret;
>   
> -		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
> -		data.devid = intel_get_drm_devid(data.drm_fd);
> +		if (is_i915_device(data.drm_fd))
> +			data.devid = intel_get_drm_devid(data.drm_fd);
>   
>   		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &max_curw);
>   		igt_assert(ret == 0 || errno == EINVAL);
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index b4836a44d..541378712 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -778,6 +778,7 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
>   
>   	memset(&hang, 0, sizeof(hang));
>   	if (do_flip && (o->flags & TEST_HANG)) {
> +		igt_require_intel(drm_fd);
>   		ahnd = get_reloc_ahnd(drm_fd, 0);
>   		hang = hang_gpu(drm_fd, ahnd);
>   	}
> diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
> index 3b0146fe9..683d36720 100644
> --- a/tests/kms_force_connector_basic.c
> +++ b/tests/kms_force_connector_basic.c
> @@ -37,7 +37,7 @@ static void reset_connectors(void)
>   	drmModeRes *res;
>   	drmModeConnector *connector = NULL;
>   
> -	drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +	drm_fd = drm_open_driver_master(DRIVER_ANY);
>   	res = drmModeGetResources(drm_fd);
>   
>   	for (int i = 0; i < res->count_connectors; i++) {
> @@ -86,7 +86,7 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
>   	igt_fixture {
>   		unsigned connector_id = 0;
>   
> -		drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +		drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
>   		res = drmModeGetResources(drm_fd);
>   		igt_require(res);
> diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
> index ad2dde569..a324950bb 100644
> --- a/tests/kms_hdmi_inject.c
> +++ b/tests/kms_hdmi_inject.c
> @@ -82,12 +82,13 @@ hdmi_inject_4k(int drm_fd, drmModeConnector *connector)
>   	int fb_id;
>   	struct igt_fb fb;
>   	uint8_t found_4k_mode = 0;
> -	uint32_t devid;
>   
> -	devid = intel_get_drm_devid(drm_fd);
> +	if (is_i915_device(drm_fd)) {
> +		uint32_t devid = intel_get_drm_devid(drm_fd);
>   
> -	/* 4K requires at least HSW */
> -	igt_require(IS_HASWELL(devid) || intel_display_ver(devid) >= 8);
> +		/* 4K requires at least HSW */
> +		igt_require(IS_HASWELL(devid) || intel_display_ver(devid) >= 8);
> +	}
>   
>   	edid = igt_kms_get_4k_edid();
>   	kmstest_force_edid(drm_fd, connector, edid);
> @@ -195,7 +196,7 @@ igt_main
>   	drmModeConnector *connector;
>   
>   	igt_fixture {
> -		drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +		drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
>   		res = drmModeGetResources(drm_fd);
>   		igt_require(res);
> diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
> index caac3aecb..80ced9918 100644
> --- a/tests/kms_tv_load_detect.c
> +++ b/tests/kms_tv_load_detect.c
> @@ -34,7 +34,7 @@ igt_main
>   	drmModeConnector *tv_connector = NULL, *temp;
>   
>   	igt_fixture {
> -		drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +		drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
>   		res = drmModeGetResources(drm_fd);
>   		igt_require(res);
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index c9a9cd47a..ea9bd9a56 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -107,7 +107,7 @@ functional_test_fini(functional_test_t *test, igt_output_t *output)
>   	igt_remove_fb(test->data->drm_fd, &test->red_fb);
>   	igt_remove_fb(test->data->drm_fd, &test->yellow_fb);
>   
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>   	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
>   }
>   
> @@ -382,6 +382,7 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   	 * doesn't cover CRTC (should fail on pre-gen9 and succeed on
>   	 * gen9+).
>   	 */
> +	igt_require_intel(data->drm_fd);
>   	igt_plane_set_fb(primary, &test.undersized_fb);
>   	expect = (data->display_ver < 9) ? -EINVAL : 0;
>   	igt_assert(igt_display_try_commit2(&data->display, COMMIT_UNIVERSAL) == expect);
> @@ -579,6 +580,7 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   
>   	igt_require_pipe(display, pipe);
>   	igt_require(display->has_cursor_plane);
> +	igt_require_intel(data->drm_fd);
>   
>   	igt_output_set_pipe(output, pipe);
>   	mode = igt_output_get_mode(output);
> @@ -704,6 +706,7 @@ gen9_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   
>   	int ret = 0;
>   
> +	igt_require_intel(data->drm_fd);
>   	igt_skip_on(data->display_ver < 9);
>   	igt_require_pipe(&data->display, pipe);
>   
> @@ -797,8 +800,9 @@ igt_main
>   	enum pipe pipe;
>   
>   	igt_fixture {
> -		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> -		data.display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		if (is_i915_device(data.drm_fd))
> +			data.display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
>   
>   		kmstest_set_vt_graphics_mode();
>   
> diff --git a/tests/meson.build b/tests/meson.build
> index cbc02534f..3c1b70259 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -19,11 +19,7 @@ test_progs = [
>   	'kms_atomic',
>   	'kms_atomic_interruptible',
>   	'kms_atomic_transition',
> -	'kms_big_fb',
>   	'kms_big_joiner' ,
> -	'kms_busy',
> -	'kms_ccs',
> -	'kms_cdclk',
>   	'kms_concurrent',
>   	'kms_content_protection',
>   	'kms_cursor_crc',
> @@ -32,26 +28,15 @@ test_progs = [
>   	'kms_dither',
>   	'kms_dp_aux_dev',
>   	'kms_dp_tiled_display',
> -	'kms_draw_crc',
> -	'kms_dsc',
> -	'kms_fbcon_fbt',
> -	'kms_fence_pin_leak',
>   	'kms_flip',
>   	'kms_flip_event_leak',
> -	'kms_flip_scaled_crc',
> -	'kms_flip_tiling',
>   	'kms_force_connector_basic',
> -	'kms_frontbuffer_tracking',
>   	'kms_getfb',
>   	'kms_hdmi_inject',
>   	'kms_hdr',
> -	'kms_invalid_dotclock',
>   	'kms_lease',
> -	'kms_legacy_colorkey',
> -	'kms_mmap_write_crc',
>   	'kms_multipipe_modeset',
>   	'kms_panel_fitting',
> -	'kms_pipe_b_c_ivb',
>   	'kms_pipe_crc_basic',
>   	'kms_plane',
>   	'kms_plane_alpha_blend',
> @@ -62,10 +47,6 @@ test_progs = [
>   	'kms_prime',
>   	'kms_prop_blob',
>   	'kms_properties',
> -	'kms_psr',
> -	'kms_psr2_su',
> -	'kms_psr2_sf',
> -	'kms_pwrite_crc',
>   	'kms_rmfb',
>   	'kms_rotation_crc',
>   	'kms_selftest',
> @@ -236,6 +217,25 @@ i915_progs = [
>   	'i915_query',
>   	'i915_selftest',
>   	'i915_suspend',
> +	'kms_big_fb',
> +	'kms_busy',
> +	'kms_ccs',
> +	'kms_cdclk',
> +	'kms_draw_crc',
> +	'kms_dsc',
> +	'kms_fbcon_fbt',
> +	'kms_fence_pin_leak',
> +	'kms_flip_scaled_crc',
> +	'kms_flip_tiling',
> +	'kms_frontbuffer_tracking',
> +	'kms_invalid_dotclock',
> +	'kms_legacy_colorkey',
> +	'kms_mmap_write_crc',
> +	'kms_pipe_b_c_ivb',
> +	'kms_psr',
> +	'kms_psr2_su',
> +	'kms_psr2_sf',
> +	'kms_pwrite_crc',
>   	'sysfs_clients',
>   	'sysfs_defaults',
>   	'sysfs_heartbeat_interval',

