Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010E810E74A
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 10:52:46 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_dark_screen_detection: Added
 IGT for validating dark screen detection
In-Reply-To: <20231213103442.2599632-3-kunal1.joshi@intel.com>
References: <20231213103442.2599632-1-kunal1.joshi@intel.com>
 <20231213103442.2599632-3-kunal1.joshi@intel.com>
Date: Wed, 13 Dec 2023 12:52:41 +0200
Message-ID: <878r5ywf0m.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Nemesa Garg <nemesa.garg@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 13 Dec 2023, Kunal Joshi <kunal1.joshi@intel.com> wrote:
> Added new IGT for validation of dark screen
> detection feature

There's threads and stuff, and *zero* explanation how this is supposed
to work. Nothing in the kernel patches, nothing in these patches,
nowhere.

All I'm asking for is a few well thought out paragraphs on *how* this is
all designed and supposed to work together, and then code to implement
that. With rationale why threads are required in igt.

I'm blocking the kernel part until I have that.


BR,
Jani.


>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Nemesa Garg <nemesa.garg@intel.com>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/intel/kms_darkscreen_detection.c | 196 +++++++++++++++++++++++++
>  tests/meson.build                      |   1 +
>  2 files changed, 197 insertions(+)
>  create mode 100644 tests/intel/kms_darkscreen_detection.c
>
> diff --git a/tests/intel/kms_darkscreen_detection.c b/tests/intel/kms_dar=
kscreen_detection.c
> new file mode 100644
> index 000000000..08d433305
> --- /dev/null
> +++ b/tests/intel/kms_darkscreen_detection.c
> @@ -0,0 +1,196 @@
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> +*/
> +
> +/**
> + * TEST: kms darkscreen detection
> + * Category: Display
> + * Description: Testing darkscreen detection works
> + *
> + * SUBTEST: basic
> + * Description: Check that we get uevent when dark screen
> + *              is detected
> + * Test category: functionality test
> + * Functionality: darkscreen
> + * Driver requirement: i915, xe
> + *
> + * SUBTEST: negative
> + * Description: Check dark screen detection doesn't report
> + *              false positives
> + * Test category: functionality test
> + * Functionality: darkscreen
> + * Driver requirement: i915, xe
> + */
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +
> +typedef struct {
> +	int drm_fd;
> +	uint32_t devid;
> +	struct igt_fb fb;
> +	igt_display_t display;
> +} data_t;
> +
> +enum test {
> +	BASIC,
> +	NEGATIVE,
> +};
> +
> +struct flip_data {
> +	int drm_fd;
> +	enum pipe pipe;
> +	enum test test;
> +	igt_output_t *output;
> +};
> +
> +pthread_mutex_t mutex =3D PTHREAD_MUTEX_INITIALIZER;
> +pthread_cond_t condA =3D PTHREAD_COND_INITIALIZER;
> +bool flips_competed;
> +
> +static void enable_dark_screen_and_flip_black_frame(struct flip_data *fl=
ip_data)
> +{
> +	unsigned int fb_id;
> +	double r, g, b;
> +	struct igt_fb fb;
> +	drmModeModeInfo *mode;
> +
> +	mode =3D igt_output_get_mode(flip_data->output);
> +	switch (flip_data->test) {
> +	case BASIC:
> +		r =3D g =3D b =3D 0.0;
> +		break;
> +	case NEGATIVE:
> +		r =3D g =3D b =3D 1.0;
> +		break;
> +	default:
> +		igt_assert_f(false, "Unknown test case\n");
> +	}
> +	fb_id =3D igt_create_color_fb(flip_data->drm_fd, mode->hdisplay, mode->=
vdisplay,
> +				    DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR,
> +				    r, g, b, &fb);
> +	pthread_mutex_lock(&mutex);
> +	while (flips_competed !=3D true)
> +		pthread_cond_wait(&condA, &mutex);
> +	pthread_mutex_unlock(&mutex);
> +	igt_set_dark_screen_detection(flip_data->drm_fd, flip_data->pipe, true);

This checks whether the screen is dark *right now*.

> +	drmModePageFlip(flip_data->drm_fd,
> +			flip_data->output->config.crtc->crtc_id,
> +			fb_id, DRM_MODE_PAGE_FLIP_EVENT,
> +			NULL);

It does not matter what this does. It's not checked, except perhaps by
accident in a subsequent call to this function.

> +	igt_remove_fb(flip_data->drm_fd, &fb);
> +}
> +
> +static void *flip_frames_untill_dark_screen_enabled(void *data)

*until

> +{
> +	int i;
> +	unsigned int fb_id1, fb_id2;
> +	unsigned int flip_fb;
> +	struct flip_data *args =3D data;
> +	struct igt_fb fb_1, fb_2;
> +	drmModeModeInfo *mode;
> +
> +	pthread_mutex_lock(&mutex);
> +	mode =3D igt_output_get_mode(args->output);
> +	fb_id1 =3D igt_create_color_fb(args->drm_fd, mode->hdisplay, mode->vdis=
play,
> +				    DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR,
> +				    1.0, 0.0, 0.0, &fb_1);
> +	fb_id2 =3D igt_create_color_fb(args->drm_fd, mode->hdisplay, mode->vdis=
play,
> +				    DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR,
> +				    0.0, 0.0, 1.0, &fb_2);
> +
> +	for (i =3D 1; i < 6; i++) {
> +		flip_fb =3D (((i) % 2) =3D=3D 0) ? fb_id2 : fb_id1;
> +		drmModePageFlip(args->drm_fd,
> +				args->output->config.crtc->crtc_id,
> +				flip_fb, DRM_MODE_PAGE_FLIP_EVENT,
> +				NULL);
> +	}
> +	flips_competed =3D true;
> +	pthread_cond_broadcast(&condA);
> +	pthread_mutex_unlock(&mutex);
> +	pthread_exit(NULL);
> +	igt_remove_fb(args->drm_fd, &fb_1);
> +	igt_remove_fb(args->drm_fd, &fb_2);
> +}
> +
> +static void do_modeset(data_t *data, igt_display_t *display,
> +		       enum pipe pipe, igt_output_t *output,
> +		       enum test test)
> +{
> +	unsigned int fb_id;
> +	struct igt_fb fb;
> +	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> +
> +	mode =3D igt_output_get_mode(output);
> +	fb_id =3D igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisp=
lay,
> +				    DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR,
> +				    0.0, 1.0, 0.0, &fb);
> +	igt_assert(fb_id);
> +	igt_output_set_pipe(output, pipe);
> +	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, &fb);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	igt_remove_fb(data->drm_fd, &fb);
> +}
> +
> +static bool run_test_for_pipe_output(data_t *data, enum test test,
> +				     enum pipe pipe,
> +				     igt_output_t *output)
> +{
> +	struct flip_data flip_data;
> +	pthread_t threadA;
> +
> +	flip_data.drm_fd =3D data->drm_fd;
> +	flip_data.pipe =3D pipe;
> +	flip_data.output =3D output;
> +	flip_data.test =3D test;
> +
> +	igt_require_f(igt_is_dark_screen_supported(data->drm_fd, pipe),
> +		      "Dark screen not supported\n");
> +	igt_display_reset(&data->display);
> +
> +	do_modeset(data, &data->display,
> +		   pipe, output, test);
> +	pthread_create(&threadA, NULL, flip_frames_untill_dark_screen_enabled, =
&flip_data);
> +	enable_dark_screen_and_flip_black_frame(&flip_data);
> +	pthread_join(threadA, NULL);
> +	return true;
> +}
> +
> +data_t data =3D {};
> +
> +igt_main
> +{
> +	enum pipe pipe;
> +	igt_output_t *output;
> +
> +	igt_fixture {
> +		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
> +		kmstest_set_vt_graphics_mode();
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
> +		igt_require(data.display.is_atomic);
> +	}
> +
> +	igt_describe("Check dark screen detection works");
> +	igt_subtest_with_dynamic("basic")
> +		for_each_pipe_with_valid_output(&data.display, pipe, output)
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> +				run_test_for_pipe_output(&data, BASIC, pipe, output);
> +
> +	igt_describe("Check dark screen detection doesn't report false positive=
s");
> +	igt_subtest_with_dynamic("negative")
> +		for_each_pipe_with_valid_output(&data.display, pipe, output)
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> +				run_test_for_pipe_output(&data, NEGATIVE, pipe, output);
> +
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index a5f5c143c..347b49821 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -249,6 +249,7 @@ intel_kms_progs =3D [
>  	'kms_busy',
>  	'kms_ccs',
>  	'kms_cdclk',
> +        'kms_darkscreen_detection',
>  	'kms_dirtyfb',
>  	'kms_draw_crc',
>  	'kms_dsc',

--=20
Jani Nikula, Intel
