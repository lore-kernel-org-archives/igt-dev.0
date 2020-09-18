Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67A16E155
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2020 11:32:53 +0000 (UTC)
Date: Fri, 18 Sep 2020 14:32:48 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200918113248.GG6112@intel.com>
References: <20200918064318.2143-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918064318.2143-1-karthik.b.s@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v8] tests/kms_async_flips: Add test to
 validate asynchronous flips
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
To: Karthik B S <karthik.b.s@intel.com>
Cc: michel@daenzer.net, igt-dev@lists.freedesktop.org, daniel.vetter@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 18, 2020 at 12:13:18PM +0530, Karthik B S wrote:
> Asynchronous flips are issued using the page flip IOCTL.
> The test consists of two subtests. The first subtest waits for
> the page flip event to be received before giving the next flip,
> and the second subtest doesn't wait for page flip events.
> =

> The test passes if the IOCTL is successful.
> =

> v2: -Add authors in the test file. (Paulo)
>     -Reduce the run time and timeouts to suit IGT needs. (Paulo)
>     -Replace igt_debug's with igt_assert's to catch slow flips. (Paulo)
>     -Follow IGT coding style regarding spaces. (Paulo)
>     -Make set up code part of igt_fixture. (Paulo)
>     -Skip the test if async flips are not supported. (Paulo)
>     -Replace suggested-by. (Paulo)
>     -Added description for test and subtests.
> =

> v3: -Rename the test to kms_async_flips. (Paulo)
>     -Modify the TODO comment. (Paulo)
>     -Remove igt_debug in flip_handler. (Paulo)
>     -Use drmIoctl() in has_async function. (Paulo)
>     -Add more details in igt_assert in flip_handler. (Paulo)
>     -Remove flag variable in flip_handler. (Paulo)
>     -Call igt_assert in flip_handler after the warm up time.
> =

> v4: -Calculate the time stamp in flip_handler from userspace, as the
>      kernel will return vbl timestamps and this cannot be used
>      for async flips.
>     -Add a new subtest to verify that the async flip time stamp
>      lies in between the previous and next vblank time stamp. (Daniel)
> =

> v5: -Add test that alternates between sync and async flips. (Ville)
>     -Add test to verify invalid async flips. (Ville)
>     -Remove the subtest async-flip-without-page-flip-events. (Michel)
>     -Remove the intel gpu restriction and make the test generic. (Michel)
> =

> v6: -Change the THRESHOLD from 10 to 8 as failures are seen on CI
>      on platforms <=3D gen10.
>     -In older platforms(<=3D gen10), async address update bit in plane ctl
>      is double buffered. Made changes in subtests to accomodate this.
>     -Moved the igt_assert from flip_handler to individual subtest as we
>      now have four subtests and adding conditions for the assert in
>      flip handler is messy.
> =

> v7: -Change flip_interval from int to float for more precision.
>     -Remove the fb height change case in 'invalid' subtest as per the
>      feedback received on the kernel patches.
>     -Add subtest to verify legacy cursor IOCTL. (Ville)
> =

> v8: -Add a cursor flip before async flip in cursor test. (Ville)
>     -Make flip_interval double for more precision as failures are seen
>      on older platforms on CI.
> =

> Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/Makefile.sources  |   1 +
>  tests/kms_async_flips.c | 428 ++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build       |   1 +
>  3 files changed, 430 insertions(+)
>  create mode 100644 tests/kms_async_flips.c
> =

> diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> index 6ae95155..f32ea9cf 100644
> --- a/tests/Makefile.sources
> +++ b/tests/Makefile.sources
> @@ -32,6 +32,7 @@ TESTS_progs =3D \
>  	feature_discovery \
>  	kms_3d \
>  	kms_addfb_basic \
> +	kms_async_flips \
>  	kms_atomic \
>  	kms_atomic_interruptible \
>  	kms_atomic_transition \
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> new file mode 100644
> index 00000000..ef63ec45
> --- /dev/null
> +++ b/tests/kms_async_flips.c
> @@ -0,0 +1,428 @@
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
> + * Authors:
> + *  Paulo Zanoni <paulo.r.zanoni@intel.com>
> + *  Karthik B S <karthik.b.s@intel.com>
> + */
> +
> +#include "igt.h"
> +#include "igt_aux.h"
> +#include <sys/ioctl.h>
> +#include <sys/time.h>
> +#include <poll.h>
> +
> +#define BUFS 4

I'd just truct igt_fb bufs[4], and replace all the other
"BUFS" usages with ARRAY_SIZE(bufs).

> +#define SYNC_FLIP 0
> +#define ASYNC_FLIP 1

enum

> +#define CURSOR_RES 64

Should query that from the kernel so that test is driver agnostic.

> +#define CURSOR_POS 128
> +
> +/*
> + * These constants can be tuned in case we start getting unexpected
> + * results in CI.
> + */
> +
> +#define WARM_UP_TIME 1
> +#define RUN_TIME 2
> +#define THRESHOLD 8

A rather non-descriptive name. I guess this is "min flips per frame" or
something along those lines?

> +
> +IGT_TEST_DESCRIPTION("Test asynchrous page flips.");

Check the spelling

> +
> +typedef struct {
> +	int drm_fd;
> +	uint32_t crtc_id;
> +	struct igt_fb bufs[BUFS];
> +	igt_display_t display;
> +} data_t;
> +
> +uint32_t refresh_rate;
> +unsigned long flip_timestamp_us;
> +double flip_interval;

Hmm. I wonder why these are outside the data_t?

> +
> +static drmModeConnectorPtr find_connector_for_modeset(data_t *data)
> +{
> +	igt_output_t *output;
> +	drmModeConnectorPtr ret =3D NULL;
> +
> +	for_each_connected_output(&data->display, output) {
> +		if (output->config.connector->count_modes > 0) {
> +			ret =3D output->config.connector;
> +			break;
> +		}
> +	}
> +
> +	igt_assert_f(ret, "Connector NOT found\n");
> +	return ret;
> +}
> +
> +static void flip_handler(int fd_, unsigned int sequence, unsigned int tv=
_sec,
> +			 unsigned int tv_usec, void *_data)
> +{
> +	static double last_ms;
> +	double cur_ms;
> +	struct timespec ts;
> +
> +	igt_assert(_data =3D=3D NULL);
> +
> +	clock_gettime(CLOCK_MONOTONIC, &ts);
> +
> +	cur_ms =3D  ts.tv_sec * 1000.0 + ts.tv_nsec / 1000000.0;
> +
> +	flip_interval =3D cur_ms - last_ms;
> +
> +	last_ms =3D cur_ms;
> +
> +	flip_timestamp_us =3D ts.tv_sec * 1000000 + ts.tv_nsec / 1000;
> +}
> +
> +static void wait_flip_event(data_t *data)
> +{
> +	int ret;
> +	drmEventContext evctx;
> +	struct pollfd pfd;
> +
> +	evctx.version =3D 2;
> +	evctx.vblank_handler =3D NULL;
> +	evctx.page_flip_handler =3D flip_handler;
> +
> +	pfd.fd =3D data->drm_fd;
> +	pfd.events =3D POLLIN;
> +	pfd.revents =3D 0;
> +
> +	ret =3D poll(&pfd, 1, 2000);
> +
> +	switch (ret) {
> +	case 0:
> +		igt_assert_f(0, "Flip Timeout\n");
> +		break;
> +	case 1:
> +		ret =3D drmHandleEvent(data->drm_fd, &evctx);
> +		igt_assert(ret =3D=3D 0);
> +		break;
> +	default:
> +		/* unexpected */
> +		igt_assert(0);
> +	}
> +}
> +
> +static void make_fb(data_t *data, struct igt_fb *fb,
> +		    drmModeConnectorPtr connector, int index)
> +{
> +	uint32_t width, height;
> +	int rec_width;
> +
> +	width =3D connector->modes[0].hdisplay;
> +	height =3D connector->modes[0].vdisplay;
> +
> +	rec_width =3D width / (BUFS * 2);
> +
> +	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_ARGB8888,

Make that XRGB8888. Otherwise some of our platforms won't support it.

> +		      LOCAL_I915_FORMAT_MOD_X_TILED, fb);
> +	igt_draw_fill_fb(data->drm_fd, fb, 0x88);
> +	igt_draw_rect_fb(data->drm_fd, NULL, NULL, fb, IGT_DRAW_MMAP_CPU,
> +			 rec_width * 2 + rec_width * index,
> +			 height / 4, rec_width,
> +			 height / 2, rand());
> +}
> +
> +static void has_monotonic_timestamp(int fd)

Would expect has_foo() to return a boolean. I would call this
require_monotonic_timestamp() or something. Or make this return
the cap (like the has_async() thing) and move the igt_require() to
the caller.

> +{
> +	struct drm_get_cap cap =3D { .capability =3D DRM_CAP_TIMESTAMP_MONOTONI=
C };
> +
> +	igt_assert(drmIoctl(fd, DRM_IOCTL_GET_CAP, &cap) =3D=3D 0);
> +
> +	igt_require_f(cap.value, "Monotonic timestamps not supported\n");
> +}
> +
> +static void test_async_flip(data_t *data, bool alternate_sync_async)
> +{
> +	int ret, frame, warm_end_frame, count =3D 0;
> +	long long int fps;
> +	struct timeval start, end, diff;
> +	bool toggle =3D SYNC_FLIP;
> +	bool test_flip_interval =3D true;
> +	bool warming_up =3D true;
> +
> +	has_monotonic_timestamp(data->drm_fd);
> +
> +	gettimeofday(&start, NULL);
> +	frame =3D 1;
> +	do {
> +		int flags =3D DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
> +
> +		if (alternate_sync_async) {
> +			if (toggle =3D=3D SYNC_FLIP) {
> +				flags &=3D ~DRM_MODE_PAGE_FLIP_ASYNC;
> +				test_flip_interval =3D false;
> +				toggle =3D ASYNC_FLIP;
> +			} else {
> +				/* In older platforms (<=3D Gen10), async address update bit is doub=
le buffered.
> +				 * So flip timestamp can be verified only from the second flip.
> +				 * The first async flip just enables the async address update.
> +				 */

We may want to limit this stuff to just those specific platforms.
That will make sure new platforms coming in would fail the test
if this mechanism ever broke again in hw.

The logic might be easier to understand if we just did an explciit
extra async flip for the bad hw:

do {
	if (sync) {
		...
	} else {
		/* blah */
		if (bad_hw) {
			drmModePAgeflip(async);
			wait();
		}
		...
	}
	drmModePageflip(async or sync);
	...
}

Actually I might even suggest replacing this toggle stuff
with two explicit drmModePageflip() calls. One would be async,
the other would be sync. That way you don't have to keep
more than one iteration of the loop in your mind when
reading the code.

But I guess we can massage this later as well.

> +				if (count =3D=3D 0) {
> +					count++;
> +					test_flip_interval =3D false;
> +				} else {
> +					count =3D 0;
> +					toggle =3D SYNC_FLIP;
> +					test_flip_interval =3D true;
> +				}
> +			}
> +		}
> +
> +		ret =3D drmModePageFlip(data->drm_fd, data->crtc_id,
> +				      data->bufs[frame % 4].fb_id,
> +				      flags, NULL);
> +
> +		igt_assert(ret =3D=3D 0);
> +
> +		wait_flip_event(data);
> +
> +		gettimeofday(&end, NULL);
> +		timersub(&end, &start, &diff);
> +
> +		/* 1s of warm-up time for the freq to stabilize */
> +		if (warming_up && diff.tv_sec >=3D WARM_UP_TIME) {
> +			warming_up =3D false;
> +			warm_end_frame =3D frame;
> +			start =3D end;
> +		}

What's this warming thing?

> +
> +		if (test_flip_interval && !warming_up) {
> +			igt_assert_f(flip_interval < 1000.0 / (refresh_rate * THRESHOLD),
> +				     "Flip interval not significantly smaller than vblank interval\n"
> +				     "Flip interval: %lfms, Refresh Rate =3D %dHz, Threshold =3D %d\=
n",
> +				     flip_interval, refresh_rate, THRESHOLD);
> +
> +		}
> +
> +		frame++;
> +	} while (diff.tv_sec < RUN_TIME);
> +
> +	if (!alternate_sync_async) {
> +		fps =3D (frame - warm_end_frame) * 1000 / RUN_TIME;
> +		igt_assert_f((fps / 1000) > (refresh_rate * THRESHOLD),
> +			     "FPS should be significantly higher than the refresh rate\n");
> +	}
> +}
> +
> +static void get_vbl_timestamp_us(data_t *data, unsigned long *vbl_time, =
unsigned int *seq)
> +{
> +	drmVBlank wait_vbl;
> +	uint32_t pipe_id_flag;
> +	int pipe;
> +
> +	memset(&wait_vbl, 0, sizeof(wait_vbl));
> +	pipe =3D kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id);
> +	pipe_id_flag =3D kmstest_get_vbl_flag(pipe);
> +
> +	wait_vbl.request.type =3D DRM_VBLANK_RELATIVE | pipe_id_flag;
> +	wait_vbl.request.sequence =3D 1;

Looks like this is actually doing a vblank wait. So the function
name is a bit poor.

> +
> +	igt_assert(drmIoctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK, &wait_vbl) =3D=
=3D 0);
> +	*vbl_time =3D wait_vbl.reply.tval_sec * 1000000 + wait_vbl.reply.tval_u=
sec;
> +	*seq =3D wait_vbl.reply.sequence;
> +}
> +
> +static void test_timestamp(data_t *data)
> +{
> +	int flags =3D DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
> +	unsigned long vbl_time, vbl_time1;
> +	unsigned int seq, seq1;
> +	int ret;
> +
> +	has_monotonic_timestamp(data->drm_fd);
> +
> +	/* In older platforms(<=3D gen10), async address update bit is double b=
uffered.
> +	 * So flip timestamp can be verified only from the second flip.
> +	 * The first async flip just enables the async address update.
> +	 */
> +	ret =3D drmModePageFlip(data->drm_fd, data->crtc_id,
> +			      data->bufs[0].fb_id,
> +			      flags, NULL);
> +
> +	igt_assert(ret =3D=3D 0);
> +
> +	wait_flip_event(data);
> +
> +	get_vbl_timestamp_us(data, &vbl_time, &seq);
> +
> +	ret =3D drmModePageFlip(data->drm_fd, data->crtc_id,
> +			      data->bufs[0].fb_id,
> +			      flags, NULL);
> +
> +	igt_assert(ret =3D=3D 0);
> +
> +	wait_flip_event(data);
> +
> +	get_vbl_timestamp_us(data, &vbl_time1, &seq1);

This one we could just replace with a query of the current vblank
count. Would speed up the test by one frame. I guess we still want
to keep the vblank wait before this one so that we know we have enough
time during the frame to perform the async flip.

Dunno if we might want to do more than one async flip here actually.
Potentially we might want to just do as many as possible until the
vblank count changes. And then assert that we did at least a few.
The timestamps should then be identical for all the flips except the
last one.

Nothing critical I guess. Could think about these as followup.

> +
> +	igt_assert_f(seq1 =3D=3D seq + 1,
> +		     "Vblank sequence is expected to be incremented by one(%d !=3D (%d=
 + 1)\n", seq1, seq);
> +
> +	igt_info("vbl1_timestamp =3D %ldus\nflip_timestamp =3D %ldus\nvbl2_time=
stamp =3D %ldus\n",
> +		 vbl_time, flip_timestamp_us, vbl_time1);
> +
> +	igt_assert_f(vbl_time < flip_timestamp_us && vbl_time1 > flip_timestamp=
_us,
> +		     "Async flip time stamp is expected to be in between 2 vblank time=
 stamps\n");
> +}
> +
> +static void test_cursor(data_t *data)
> +{
> +	int flags =3D DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
> +	int ret;
> +	struct igt_fb cursor_fb;
> +	struct drm_mode_cursor cur;
> +
> +	igt_create_color_fb(data->drm_fd, CURSOR_RES, CURSOR_RES, DRM_FORMAT_AR=
GB8888,
> +			    LOCAL_DRM_FORMAT_MOD_NONE, 1., 1., 1., &cursor_fb);
> +
> +	cur.flags =3D DRM_MODE_CURSOR_BO;
> +	cur.crtc_id =3D data->crtc_id;
> +	cur.width =3D CURSOR_RES;
> +	cur.height =3D CURSOR_RES;
> +	cur.handle =3D cursor_fb.gem_handle;
> +
> +	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_CURSOR, &cur);
> +
> +	ret =3D drmModePageFlip(data->drm_fd, data->crtc_id,
> +			      data->bufs[0].fb_id,
> +			      flags, NULL);
> +
> +	igt_assert(ret =3D=3D 0);
> +
> +	cur.flags =3D DRM_MODE_CURSOR_MOVE;
> +	cur.x =3D CURSOR_POS;
> +	cur.y =3D CURSOR_POS;
> +
> +	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_CURSOR, &cur);

Did we manage to get the anticipated oops?

> +}
> +
> +static void test_invalid(data_t *data, drmModeConnectorPtr connector)
> +{
> +	int flags =3D DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
> +	int ret;
> +	uint32_t width, height;
> +	struct igt_fb fb1, fb2;
> +
> +	width =3D connector->modes[0].hdisplay;
> +	height =3D connector->modes[0].vdisplay;
> +
> +	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_ARGB8888,

XRGB8888

> +		      LOCAL_I915_FORMAT_MOD_X_TILED, &fb1);
> +
> +	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_ARGB8888,

And since we just want to check the X->Y transition this too should be
XRGB8888.

I guess we might want a few more of these to test the different
things; stride and pixelformat at least. Could add those as a
followup.

> +		      LOCAL_I915_FORMAT_MOD_Y_TILED, &fb2);
> +
> +	ret =3D drmModePageFlip(data->drm_fd, data->crtc_id,
> +			      fb1.fb_id, flags, NULL);
> +
> +	igt_assert(ret =3D=3D 0);

Not quite sure why we have this first page flip here?

> +
> +	wait_flip_event(data);
> +
> +	/* Flip with a different fb modifier which is expected to be rejected */
> +	ret =3D drmModePageFlip(data->drm_fd, data->crtc_id,
> +			      fb2.fb_id, flags, NULL);
> +
> +	igt_assert(ret =3D=3D -EINVAL);

We're leaking the fbs here.

> +}
> +
> +static bool has_async(int fd)

has_async_flip() or has_async_page_flip() would be more descriptive.

> +{
> +	struct drm_get_cap cap =3D { .capability =3D DRM_CAP_ASYNC_PAGE_FLIP };
> +
> +	igt_assert(drmIoctl(fd, DRM_IOCTL_GET_CAP, &cap) =3D=3D 0);
> +	return cap.value;
> +}
> +
> +igt_main
> +{
> +	data_t data;

I think better make that static. IIRC there are issues with longjmp
magic otherwise.

> +	drmModeResPtr res;
> +	drmModeConnectorPtr connector;
> +	int i, ret;
> +	bool async_capable;

Pointless variable.

> +
> +	igt_fixture {
> +		data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> +		kmstest_set_vt_graphics_mode();
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
> +
> +		async_capable =3D has_async(data.drm_fd);
> +		igt_require_f(async_capable, "Async Flip is not supported\n");
> +	}
> +
> +	igt_describe("Verify the async flip functionality and the fps during as=
ync flips");
> +	igt_subtest_group {
> +		igt_fixture {
> +			res =3D drmModeGetResources(data.drm_fd);
> +			igt_assert(res);
> +
> +			kmstest_unset_all_crtcs(data.drm_fd, res);
> +
> +			connector =3D find_connector_for_modeset(&data);
> +			data.crtc_id =3D kmstest_find_crtc_for_connector(data.drm_fd,
> +								       res, connector, 0);
> +
> +			refresh_rate =3D connector->modes[0].vrefresh;
> +
> +			for (i =3D 0; i < BUFS; i++)
> +				make_fb(&data, &data.bufs[i], connector, i);
> +
> +			ret =3D drmModeSetCrtc(data.drm_fd, data.crtc_id, data.bufs[0].fb_id,=
 0, 0,
> +					     &connector->connector_id, 1, &connector->modes[0]);
> +			igt_assert(ret =3D=3D 0);

All of that stuff could be in a function AFAICS.

Also leaking 'res' AFAICS.

> +		}
> +
> +		igt_describe("Wait for page flip events in between successive asynchro=
nous flips");
> +		igt_subtest("async-flip-with-page-flip-events")
> +			test_async_flip(&data, false);
> +
> +		igt_describe("Alternate between sync and async flips");
> +		igt_subtest("alternate-sync-async-flip")
> +			test_async_flip(&data, true);
> +
> +		igt_describe("Verify that the async flip timestamp does not coincide w=
ith either previous or next vblank");
> +		igt_subtest("test-time-stamp")
> +			test_timestamp(&data);
> +
> +		igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async=
 flip");
> +		igt_subtest("test-cursor")
> +			test_cursor(&data);
> +
> +		igt_describe("Negative case to verify if changes in fb are rejected fr=
om kernel as expected");
> +		igt_subtest("invalid-async-flip")
> +			test_invalid(&data, connector);
> +
> +		igt_fixture {
> +			for (i =3D 0; i < BUFS; i++)
> +				igt_remove_fb(data.drm_fd, &data.bufs[i]);
> +		}
> +	}
> +
> +	igt_fixture
> +		igt_display_fini(&data.display);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 5eb2d2fc..515f7528 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -16,6 +16,7 @@ test_progs =3D [
>  	'feature_discovery',
>  	'kms_3d',
>  	'kms_addfb_basic',
> +	'kms_async_flips',
>  	'kms_atomic',
>  	'kms_atomic_interruptible',
>  	'kms_atomic_transition',
> -- =

> 2.22.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
