Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4751C6E9E5
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Jun 2021 08:27:06 +0000 (UTC)
Date: Thu, 24 Jun 2021 11:30:43 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Message-ID: <20210624083043.GA4981@intel.com>
References: <20210618104927.20061-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210618104927.20061-1-venkata.sai.patnana@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cdclk : Add test to validate
 cdclk crawling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org, Juha-Pekka =?iso-8859-1?Q?Heikkil=E4?= <juha-pekka.heikkila@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 04:19:27PM +0530, venkata.sai.patnana@intel.com wro=
te:
> From: Swati Sharma <swati2.sharma@intel.com>
> =

> Added test to validate cdclk crawling
> =

> * created new IGT
> * added 3 test scenarios (basic, scalar and mode-transition)
> * used existing i915_freq_info debugfs API to validate change in cdclk

Should note that in reality, we are still validating here not CDCLK crawlin=
g,
but just that CDCLK changes actually, if we change resolution or do scaling.
We can have CDCLK being changed, even without CDCLK crawling.

CDCLK crawl should allow to do CDCLK change, without doing a full modeset,
however due to some driver limitations, currently we are unable to test tha=
t. =


Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> =

> Cc: Mika Kahola <mika.kahola@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Juha-Pekka Heikkil=E4 <juha-pekka.heikkila@intel.com>
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  tests/kms_cdclk.c | 307 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build |   1 +
>  2 files changed, 308 insertions(+)
>  create mode 100644 tests/kms_cdclk.c
> =

> diff --git a/tests/kms_cdclk.c b/tests/kms_cdclk.c
> new file mode 100644
> index 00000000..d002be83
> --- /dev/null
> +++ b/tests/kms_cdclk.c
> @@ -0,0 +1,307 @@
> +/*
> + * Copyright =A9 2020 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + *
> + * Author:
> + *  Swati Sharma <swati2.sharma@intel.com>
> + */
> +
> +#include "igt.h"
> +
> +IGT_TEST_DESCRIPTION("Test cdclk features : crawling");
> +
> +/* Test flags */
> +enum {
> +	TEST_BASIC =3D 1 << 0,
> +	TEST_PLANESCALING =3D 1 << 1,
> +	TEST_MODETRANSITION =3D 1 << 2,
> +};
> +
> +typedef struct {
> +	int drm_fd;
> +	int debugfs_fd;
> +	uint32_t devid;
> +	igt_display_t display;
> +} data_t;
> +
> +static bool hardware_supported(data_t *data)
> +{
> +        if (intel_display_ver(data->devid) >=3D 13)
> +		return true;
> +
> +	return false;
> +}
> +
> +static int get_current_cdclk_freq(int debugfs_fd)
> +{
> +	int cdclk_freq_current;
> +	char buf[1024];
> +	char *start_loc;
> +	int res;
> +
> +	res =3D igt_debugfs_simple_read(debugfs_fd, "i915_frequency_info",
> +				      buf, sizeof(buf));
> +	igt_require(res > 0);
> +
> +	igt_assert(start_loc =3D strstr(buf, "Current CD clock frequency: "));
> +	igt_assert_eq(sscanf(start_loc, "Current CD clock frequency: %d", &cdcl=
k_freq_current), 1);
> +	igt_info("Current CD clock frequency: %d\n", cdclk_freq_current);
> +
> +	return cdclk_freq_current;
> +}
> +
> +static __u64 get_mode_data_rate(drmModeModeInfo *mode)
> +{
> +	__u64 data_rate =3D (__u64)mode->hdisplay * (__u64)mode->vdisplay * (__=
u64)mode->vrefresh;
> +	return data_rate;
> +}
> +
> +static drmModeModeInfo *get_highres_mode(igt_output_t *output)
> +{
> +	drmModeModeInfo *highest_mode =3D NULL;
> +	drmModeConnector *connector =3D output->config.connector;
> +	int j;
> +
> +	for (j =3D 0; j < connector->count_modes; j++) {
> +		if (!highest_mode) {
> +			highest_mode =3D &connector->modes[j];
> +		} else if (connector->modes[j].vdisplay && connector->modes[j].hdispla=
y) {
> +			__u64 highest_data_rate =3D get_mode_data_rate(highest_mode);
> +			__u64 data_rate =3D get_mode_data_rate(&connector->modes[j]);
> +
> +			if (highest_data_rate < data_rate)
> +				highest_mode =3D &connector->modes[j];
> +		}
> +	}
> +
> +	return highest_mode;
> +}
> +
> +static drmModeModeInfo *get_lowres_mode(igt_output_t *output)
> +{
> +	drmModeModeInfo *lowest_mode =3D NULL;
> +	drmModeConnector *connector =3D output->config.connector;
> +	int j;
> +
> +	for (j =3D 0; j < connector->count_modes; j++) {
> +		if (!lowest_mode) {
> +			lowest_mode =3D &connector->modes[j];
> +		} else if (connector->modes[j].vdisplay && connector->modes[j].hdispla=
y) {
> +			__u64 lowest_data_rate =3D get_mode_data_rate(lowest_mode);
> +			__u64 data_rate =3D get_mode_data_rate(&output->config.connector->mod=
es[j]);
> +
> +			if (lowest_data_rate > data_rate)
> +				lowest_mode =3D &connector->modes[j];
> +		}
> +	}
> +
> +	return lowest_mode;
> +}
> +
> +static void do_cleanup_display(igt_display_t *dpy)
> +{
> +	enum pipe pipe;
> +	igt_output_t *output;
> +	igt_plane_t *plane;
> +
> +	for_each_pipe(dpy, pipe)
> +		for_each_plane_on_pipe(dpy, pipe, plane)
> +			igt_plane_set_fb(plane, NULL);
> +
> +	for_each_connected_output(dpy, output)
> +		igt_output_set_pipe(output, PIPE_NONE);
> +
> +	igt_display_commit2(dpy, dpy->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY=
);
> +}
> +
> +static void test_basic(data_t *data, enum pipe pipe, igt_output_t *outpu=
t)
> +{
> +	igt_display_t *display =3D &data->display;
> +	int debugfs_fd =3D data->debugfs_fd;
> +	int cdclk_ref, cdclk_new;
> +	struct igt_fb fb;
> +	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> +
> +	do_cleanup_display(display);
> +	igt_display_reset(display);
> +
> +	igt_output_set_pipe(output, pipe);
> +	mode =3D igt_output_get_mode(output);
> +	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_create_color_pattern_fb(display->drm_fd,
> +				    mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888,
> +				    I915_TILING_NONE,
> +				    0.0, 0.0, 0.0, &fb);
> +
> +	igt_plane_set_fb(primary, &fb);
> +	cdclk_ref =3D get_current_cdclk_freq(debugfs_fd);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	cdclk_new =3D get_current_cdclk_freq(debugfs_fd);
> +
> +	/* cdclk should bump */
> +	igt_assert_lt(cdclk_ref, cdclk_new);
> +
> +	/* cleanup */
> +	do_cleanup_display(display);
> +	igt_remove_fb(display->drm_fd, &fb);
> +}
> +
> +static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_=
t *output)
> +{
> +	igt_display_t *display =3D &data->display;
> +	int debugfs_fd =3D data->debugfs_fd;
> +	int cdclk_ref, cdclk_new;
> +	struct igt_fb fb;
> +	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> +	int scaling =3D 60;
> +
> +	do_cleanup_display(display);
> +	igt_display_reset(display);
> +
> +	igt_output_set_pipe(output, pipe);
> +	mode =3D igt_output_get_mode(output);
> +
> +	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_create_color_pattern_fb(display->drm_fd,
> +				    mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888,
> +				    I915_TILING_NONE,
> +				    0.0, 0.0, 0.0, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +
> +	/* downscaling */
> +	igt_plane_set_size(primary, ((fb.width * scaling) / 100), ((fb.height *=
 scaling) / 100));
> +	cdclk_ref =3D get_current_cdclk_freq(debugfs_fd);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	cdclk_new =3D get_current_cdclk_freq(debugfs_fd);
> +
> +	/* cdclk should bump */
> +	igt_assert_lt(cdclk_ref, cdclk_new);
> +
> +	/* cleanup */
> +	do_cleanup_display(display);
> +	igt_remove_fb(display->drm_fd, &fb);
> +}
> +
> +static void test_mode_transition(data_t *data, enum pipe pipe, igt_outpu=
t_t *output)
> +{
> +	igt_display_t *display =3D &data->display;
> +	int debugfs_fd =3D data->debugfs_fd;
> +	int cdclk_ref, cdclk_new;
> +	struct igt_fb fb;
> +	igt_plane_t *primary;
> +	drmModeModeInfo *mode_hi, *mode_lo, *mode;
> +
> +	do_cleanup_display(display);
> +	igt_display_reset(display);
> +
> +	igt_output_set_pipe(output, pipe);
> +	mode =3D igt_output_get_mode(output);
> +	mode_lo =3D get_lowres_mode(output);
> +	mode_hi =3D get_highres_mode(output);
> +
> +	if (mode_hi->hdisplay =3D=3D mode_lo->hdisplay &&
> +	    mode_hi->vdisplay =3D=3D mode_lo->vdisplay)
> +		igt_skip("Highest and lowest mode resolutions are same; no transition\=
n");
> +
> +	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_create_color_pattern_fb(display->drm_fd,
> +				    mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888,
> +				    I915_TILING_NONE,
> +				    0.0, 0.0, 0.0, &fb);
> +
> +	/* switch to lower resolution */
> +	igt_output_override_mode(output, mode_lo);
> +	igt_plane_set_fb(primary, &fb);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	cdclk_ref =3D get_current_cdclk_freq(debugfs_fd);
> +
> +	/* switch to higher resolution */
> +	igt_output_override_mode(output, mode_hi);
> +	igt_plane_set_fb(primary, &fb);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	cdclk_new =3D get_current_cdclk_freq(debugfs_fd);
> +
> +	/* cdclk should bump */
> +	igt_assert_lt(cdclk_ref, cdclk_new);
> +
> +	/* cleanup */
> +	do_cleanup_display(display);
> +	igt_remove_fb(display->drm_fd, &fb);
> +}
> +
> +static void run_cdclk_test(data_t *data, uint32_t flags)
> +{
> +	igt_display_t *display =3D &data->display;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe))
> +			if (igt_pipe_connector_valid(pipe, output)) {
> +				if (flags & TEST_BASIC)
> +					test_basic(data, pipe, output);
> +				if (flags & TEST_PLANESCALING)
> +					test_plane_scaling(data, pipe, output);
> +				if (flags & TEST_MODETRANSITION)
> +					test_mode_transition(data, pipe, output);
> +			}
> +	}
> +}
> +
> +igt_main
> +{
> +	data_t data =3D {};
> +
> +	igt_fixture {
> +		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> +		igt_require(data.drm_fd >=3D 0);
> +		data.debugfs_fd =3D igt_debugfs_dir(data.drm_fd);
> +		igt_require(data.debugfs_fd);
> +		kmstest_set_vt_graphics_mode();
> +		data.devid =3D intel_get_drm_devid(data.drm_fd);
> +		igt_require_f(hardware_supported(&data),
> +			      "Hardware doesn't support crawling.\n");
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
> +	}
> +
> +	igt_describe("Basic test to validate cdclk frequency change");
> +	igt_subtest_with_dynamic("basic")
> +		run_cdclk_test(&data, TEST_BASIC);
> +	igt_describe("Plane scaling test to validate cdclk frequency change");
> +	igt_subtest_with_dynamic("plane-scaling")
> +		run_cdclk_test(&data, TEST_PLANESCALING);
> +	igt_describe("Mode transition (low to high) test to validate cdclk freq=
uency");
> +	igt_subtest_with_dynamic("mode-transition")
> +		run_cdclk_test(&data, TEST_MODETRANSITION);
> +
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 2351b3d3..01911c45 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -23,6 +23,7 @@ test_progs =3D [
>  	'kms_big_joiner' ,
>  	'kms_busy',
>  	'kms_ccs',
> +	'kms_cdclk',
>  	'kms_concurrent',
>  	'kms_content_protection',
>  	'kms_cursor_crc',
> -- =

> 2.32.0
> =

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
