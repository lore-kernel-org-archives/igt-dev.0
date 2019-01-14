Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734C26E46A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jan 2019 22:48:58 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Mon, 14 Jan 2019 22:48:56 +0000
Message-ID: <59ebe358861deb3f999e01306cc79d49e73491bd.camel@intel.com>
References: <20190103143641.20200-1-jose.souza@intel.com>
 <20190103143641.20200-9-jose.souza@intel.com>
 <586981e862787b6cf77903c813a01692aa89f5ea.camel@intel.com>
In-Reply-To: <586981e862787b6cf77903c813a01692aa89f5ea.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 9/9] test: Add PSR2 selective update
 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2094593460=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============2094593460==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-jL1dU+7/mtTAvurEAY2M"

--=-jL1dU+7/mtTAvurEAY2M
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-01-11 at 15:15 -0800, Dhinakaran Pandiyan wrote:
> On Thu, 2019-01-03 at 06:36 -0800, Jos=C3=A9 Roberto de Souza wrote:
> > This tests checks if hardware is able to do selective update when
> > screen changes.
> > PSR2 don't trigger interruptions and the 'PSR2 SU status' register
> > is not kept loaded all the times, so it is necessary keep polling
> > PSR status debugfs until those values are loaded.
> Does this mean flipping once while polling SU status registers is not
> sufficient?

After a flip in DEEP_SLEEP it will do a PSR exit and PSR active
sequence, it will only do a selective update while in SLEEP state that
is why more than one flip is necessary and it will vary depending of
the values that is set to frames to activate PSR and frames to enter
deep sleep.

>=20
>=20
> > When loaded it is compared with the expected value, if matches
> > the polling is stopped and the test passed otherwise it will
> > wait until fail_timerfd to expire to fail the test.
> This patch warrants some explanation about the timeouts used and how
> they were selected.

The flip timeout is a value to achieve 15hz flips and the error timeout
will be removed as you suggested bellow, I will add a comment when
setting the interval to the flip timerfd.

>=20
> > v2: Using new SU blocks debugfs output
> >=20
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  lib/igt_psr.c          |  23 +++
> >  lib/igt_psr.h          |   1 +
> >  tests/Makefile.sources |   1 +
> >  tests/kms_psr2_su.c    | 362
> > +++++++++++++++++++++++++++++++++++++++++
> >  tests/meson.build      |   1 +
> >  5 files changed, 388 insertions(+)
> >  create mode 100644 tests/kms_psr2_su.c
> >=20
> > diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> > index 0f4b2e23..a8b9e4ce 100644
> > --- a/lib/igt_psr.c
> > +++ b/lib/igt_psr.c
> > @@ -234,3 +234,26 @@ bool psr2_wait_update(int debugfs_fd)
> >  {
> >  	return igt_wait(psr2_status_update(debugfs_fd), 40, 10);
> >  }
> > +
> > +#define PSR2_SU_BLOCK_STR_LOOKUP "PSR2 SU blocks:\n0\t"
> > +
> > +bool psr2_read_last_num_su_blocks_val(int debugfs_fd, uint16_t
> > *num_su_blocks)
> > +{
> > +	char buf[PSR_STATUS_MAX_LEN];
> > +	char *str;
> > +	int ret;
> > +
> > +	ret =3D igt_debugfs_simple_read(debugfs_fd,
> > "i915_edp_psr_status", buf,
> > +				      sizeof(buf));
> > +	if (ret < 0)
> > +		return false;
> > +
> > +	str =3D strstr(buf, PSR2_SU_BLOCK_STR_LOOKUP);
> > +	if (!str)
> > +		return false;
> > +
> > +	str =3D &str[strlen(PSR2_SU_BLOCK_STR_LOOKUP)];
> > +	*num_su_blocks =3D (uint16_t)strtol(str, NULL, 10);
> > +
> > +	return true;
> > +}
> > diff --git a/lib/igt_psr.h b/lib/igt_psr.h
> > index 2b8d1a90..349eb0c2 100644
> > --- a/lib/igt_psr.h
> > +++ b/lib/igt_psr.h
> > @@ -41,5 +41,6 @@ bool psr2_wait_update(int debugfs_fd);
> >  bool psr2_enable(int debugfs_fd);
> >  bool psr2_disable(int debugfs_fd);
> >  bool psr2_sink_support(int debugfs_fd);
> > +bool psr2_read_last_num_su_blocks_val(int debugfs_fd, uint16_t
> > *num_su_blocks);
> > =20
> >  #endif
> > diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> > index eedde1e8..3c79eec0 100644
> > --- a/tests/Makefile.sources
> > +++ b/tests/Makefile.sources
> > @@ -78,6 +78,7 @@ TESTS_progs =3D \
> >  	kms_plane_scaling \
> >  	kms_properties \
> >  	kms_psr \
> > +	kms_psr2_su \
> >  	kms_pwrite_crc \
> >  	kms_rmfb \
> >  	kms_rotation_crc \
> > diff --git a/tests/kms_psr2_su.c b/tests/kms_psr2_su.c
> > new file mode 100644
> > index 00000000..67c02f25
> > --- /dev/null
> > +++ b/tests/kms_psr2_su.c
> > @@ -0,0 +1,362 @@
> > +/*
> > + * Copyright =C2=A9 2018 Intel Corporation
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> > obtaining a
> > + * copy of this software and associated documentation files (the
> > "Software"),
> > + * to deal in the Software without restriction, including without
> > limitation
> > + * the rights to use, copy, modify, merge, publish, distribute,
> > sublicense,
> > + * and/or sell copies of the Software, and to permit persons to
> > whom
> > the
> > + * Software is furnished to do so, subject to the following
> > conditions:
> > + *
> > + * The above copyright notice and this permission notice
> > (including
> > the next
> > + * paragraph) shall be included in all copies or substantial
> > portions of the
> > + * Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO
> > EVENT SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
> > DAMAGES
> > OR OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > ARISING
> > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > OTHER DEALINGS
> > + * IN THE SOFTWARE.
> > + *
> > + */
> > +
> > +#include "igt.h"
> > +#include "igt_sysfs.h"
> > +#include "igt_psr.h"
> > +#include <errno.h>
> > +#include <poll.h>
> > +#include <pthread.h>
> > +#include <stdbool.h>
> > +#include <stdio.h>
> > +#include <string.h>
> > +#include <sys/timerfd.h>
> > +#include "intel_bufmgr.h"
> > +
> > +IGT_TEST_DESCRIPTION("Test PSR2 selective update");
> > +
> > +#define SQUARE_SIZE 100
> > +
> > +enum operations {
> > +	PAGE_FLIP,
> > +	FRONTBUFFER,
> > +	LAST
> > +};
> > +
> > +static const char *op_str(enum operations op)
> > +{
> > +	static const char * const name[] =3D {
> > +		[PAGE_FLIP] =3D "page_flip",
> > +		[FRONTBUFFER] =3D "frontbuffer"
> > +	};
> > +
> > +	return name[op];
> > +}
> > +
> > +typedef struct {
> > +	struct igt_fb fb[2];
> > +	struct pollfd pollfds[2];
> > +	pthread_t thread_id;
> > +	int drm_fd;
> > +	int debugfs_fd;
> > +	int flip_timerfd;
> > +	int fail_timerfd;
> > +	uint32_t changes;
> > +	volatile bool run;
> > +	volatile bool sucess;
> > +
> > +	enum operations op;
> > +	uint32_t devid;
> > +	uint32_t crtc_id;
> > +	igt_display_t display;
> > +	drm_intel_bufmgr *bufmgr;
> > +	int mod_size;
> > +	int mod_stride;
> > +	drmModeModeInfo *mode;
> > +	igt_output_t *output;
> > +} data_t;
> > +
> > +static void setup_output(data_t *data)
> > +{
> > +	igt_display_t *display =3D &data->display;
> > +	igt_output_t *output;
> > +	enum pipe pipe;
> > +
> > +	for_each_pipe_with_valid_output(display, pipe, output) {
> > +		drmModeConnectorPtr c =3D output->config.connector;
> > +
> > +		if (c->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
> > +			continue;
> > +
> > +		igt_output_set_pipe(output, pipe);
> > +		data->crtc_id =3D output->config.crtc->crtc_id;
> > +		data->output =3D output;
> > +		data->mode =3D igt_output_get_mode(output);
> > +
> > +		return;
> > +	}
> > +}
> > +
> > +static void display_init(data_t *data)
> > +{
> > +	igt_display_require(&data->display, data->drm_fd);
> > +	setup_output(data);
> > +}
> > +
> > +static void display_fini(data_t *data)
> > +{
> > +	igt_display_fini(&data->display);
> > +}
> > +
> > +static void *debugfs_thread(void *ptr)
> > +{
> > +	data_t *data =3D ptr;
> > +	uint16_t expected_num_su_blocks;
> > +
> > +	/* each selective update block is 4 lines tall */
> > +	expected_num_su_blocks =3D SQUARE_SIZE / 4;
> > +	expected_num_su_blocks +=3D SQUARE_SIZE % 4 ? 1 : 0;
> > +
> > +	while (data->run) {
> > +		uint16_t num_su_blocks;
> > +		bool r;
> > +
> > +		r =3D psr2_read_last_num_su_blocks_val(data->debugfs_fd,
> > +						     &num_su_blocks);
> > +		if (r && num_su_blocks =3D=3D expected_num_su_blocks) {
> > +			data->run =3D false;
> > +			data->sucess =3D true;
> > +			break;
> > +		}
> > +
> > +		usleep(1);
> > +	}
> > +
>=20
> What happens if you start this thread and then flip just once? Do you
> see the expected block count in debugfs at some instance after the
> flip?

As said above no, as we wait for DEEP_SLEEP state and even in SLEEP
state sometimes HW decides to go to PSR exit and PSR active flow
instead of do a selective update.

>=20
> > +	return NULL;
> > +}
> > +
> > +static void prepare(data_t *data)
> > +{
> > +	struct itimerspec interval;
> > +	igt_plane_t *primary;
> > +	int r;
> > +
> > +	/* all green frame */
> > +	igt_create_color_fb(data->drm_fd,
> > +			    data->mode->hdisplay, data->mode->vdisplay,
> > +			    DRM_FORMAT_XRGB8888,
> > +			    LOCAL_DRM_FORMAT_MOD_NONE,
> > +			    0.0, 1.0, 0.0,
> > +			    &data->fb[0]);
> > +
> > +	if (data->op =3D=3D PAGE_FLIP) {
> > +		cairo_t *cr;
> > +
> > +		igt_create_color_fb(data->drm_fd,
> > +				    data->mode->hdisplay, data->mode-
> > > vdisplay,
> > +				    DRM_FORMAT_XRGB8888,
> > +				    LOCAL_DRM_FORMAT_MOD_NONE,
> > +				    0.0, 1.0, 0.0,
> > +				    &data->fb[1]);
> > +
> > +		cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb[1]);
> > +		/* a white square */
> > +		igt_paint_color_alpha(cr, 0, 0, SQUARE_SIZE,
> > SQUARE_SIZE,
> > +				      1.0, 1.0, 1.0, 1.0);
> > +		igt_put_cairo_ctx(data->drm_fd,  &data->fb[1], cr);
> > +	}
> > +
> > +	primary =3D igt_output_get_plane_type(data->output,
> > +					    DRM_PLANE_TYPE_PRIMARY);
> > +	igt_plane_set_fb(primary, NULL);
> > +
> > +	igt_display_commit(&data->display);
> > +	igt_plane_set_fb(primary, &data->fb[0]);
> > +	igt_display_commit(&data->display);
> > +
> > +	igt_assert(psr2_wait_deep_sleep(data->debugfs_fd));
> > +
> > +	data->run =3D true;
> > +	data->sucess =3D false;
> > +	data->changes =3D 0;
> > +
> > +	r =3D pthread_create(&data->thread_id, NULL, debugfs_thread,
> > data);
> > +	if (r)
> > +		igt_warn("Error starting thread: %i\n", r);
> > +
> > +	interval.it_value.tv_nsec =3D 0;
> > +	interval.it_value.tv_sec =3D 3;
> > +	interval.it_interval.tv_nsec =3D interval.it_value.tv_nsec;
> > +	interval.it_interval.tv_sec =3D interval.it_value.tv_sec;
> > +	r =3D timerfd_settime(data->fail_timerfd, 0, &interval, NULL);
> > +	igt_require_f(r !=3D -1, "Error setting timerfd\n");
> > +}
> > +
> > +static void update_screen(data_t *data)
> > +{
> > +	data->changes++;
> > +
> > +	switch (data->op) {
> > +	case PAGE_FLIP: {
> > +		igt_plane_t *primary;
> > +
> > +		primary =3D igt_output_get_plane_type(data->output,
> > +						    DRM_PLANE_TYPE_PRIM
> > ARY);
> > +
> > +		igt_plane_set_fb(primary, &data->fb[data->changes &
> > 1]);
> > +		igt_display_commit(&data->display);
> > +		break;
> > +	}
> > +	case FRONTBUFFER: {
> > +		drmModeClip clip;
> > +		cairo_t *cr;
> > +		int r;
> > +
> > +		clip.x1 =3D clip.y1 =3D 0;
> > +		clip.x2 =3D clip.y2 =3D SQUARE_SIZE;
> > +
> > +		cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb[0]);
> > +
> > +		if (data->changes & 1) {
> > +			/* go back to all green frame with with square
> > */
> > +			igt_paint_color_alpha(cr, 0, 0, SQUARE_SIZE,
> > +					      SQUARE_SIZE, 1.0, 1.0,
> > 1.0, 1.0);
> > +		} else {
> > +			/* go back to all green frame */
> > +			igt_paint_color_alpha(cr, 0, 0, SQUARE_SIZE,
> > +					      SQUARE_SIZE, 0, 1.0, 0,
> > 1.0);
> > +		}
> > +
> > +		r =3D drmModeDirtyFB(data->drm_fd, data->fb[0].fb_id,
> > &clip, 1);
> > +		igt_assert(r =3D=3D 0 || r =3D=3D -ENOSYS);
> > +		break;
> > +	}
> > +	default:
> > +		igt_assert_f(data->op, "Operation not handled\n");
> > +	}
> > +}
> > +
> > +static void run(data_t *data)
> > +{
> > +	while (data->run) {
> > +		uint64_t exp;
> > +		int r;
> > +
> > +		r =3D poll(data->pollfds,
> > +			 sizeof(data->pollfds) / sizeof(data-
> > > pollfds[0]), -1);
> > +		if (r < 0)
> > +			break;
> > +
> > +		/* flip_timerfd timeout */
> > +		if (data->pollfds[0].revents & POLLIN) {
> > +			r =3D read(data->pollfds[0].fd, &exp,
> > sizeof(exp));
> > +
> > +			if (r !=3D sizeof(uint64_t)) {
> > +				igt_warn("read a not expected number of
> > bytes from flip_timerfd: %i\n", r);
> > +			} else if (exp)
> > +				update_screen(data);
> > +		}
> > +
> > +		/* fail_timerfd timeout */
> Wouldn't it be simpler to flip a fixed number of times?

Yeah it would be simpler, I will change to that.

>=20
>=20
> > +		if (data->pollfds[1].revents & POLLIN) {
> > +			r =3D read(data->pollfds[1].fd, &exp,
> > sizeof(exp));
> > +
> > +			if (r !=3D sizeof(uint64_t)) {
> > +				igt_warn("read a not expected number of
> > bytes from fail_timerfd: %i\n", r);
> > +			} else if (exp)
> > +				break;
> > +		}
> > +	}
> > +
> > +	data->run =3D false;
> > +	pthread_join(data->thread_id, NULL);
> > +
> > +	igt_debug("Changes: %u\n", data->changes);
> > +	igt_assert(data->sucess);
> > +}
> > +
> > +static void cleanup(data_t *data)
> > +{
> > +	igt_plane_t *primary;
> > +
> > +	primary =3D igt_output_get_plane_type(data->output,
> > +					    DRM_PLANE_TYPE_PRIMARY);
> > +	igt_plane_set_fb(primary, NULL);
> > +	igt_display_commit(&data->display);
> > +
> > +	igt_remove_fb(data->drm_fd, &data->fb[0]);
> > +	if (data->op =3D=3D PAGE_FLIP)
> > +		igt_remove_fb(data->drm_fd, &data->fb[1]);
> > +}
> > +
> > +int main(int argc, char *argv[])
> > +{
> > +	data_t data =3D {};
> > +	enum operations op;
> > +
> > +	igt_subtest_init_parse_opts(&argc, argv, "", NULL,
> > +				    NULL, NULL, NULL);
> > +	igt_skip_on_simulation();
> > +
> > +	igt_fixture {
> > +		struct itimerspec interval;
> > +		int r;
> > +
> > +		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> > +		data.debugfs_fd =3D igt_debugfs_dir(data.drm_fd);
> > +		kmstest_set_vt_graphics_mode();
> > +		data.devid =3D intel_get_drm_devid(data.drm_fd);
> > +
> > +		igt_require_f(psr2_sink_support(data.debugfs_fd),
> > +			      "Sink does not support PSR2\n");
> > +
> > +		data.bufmgr =3D drm_intel_bufmgr_gem_init(data.drm_fd,
> > 4096);
> > +		igt_assert(data.bufmgr);
> > +		drm_intel_bufmgr_gem_enable_reuse(data.bufmgr);
> > +
> > +		display_init(&data);
> > +
> > +		igt_require(psr2_enable(data.debugfs_fd));
> > +		igt_require(psr2_wait_deep_sleep(data.debugfs_fd));
> > +
> > +		data.flip_timerfd =3D timerfd_create(CLOCK_MONOTONIC,
> > +						   TFD_NONBLOCK);
> > +		igt_require(data.flip_timerfd !=3D -1);
> > +		interval.it_value.tv_nsec =3D NSEC_PER_SEC / 15;
> What's the rationale for this number?


15hz flips, I will add a comment here.



>=20
> > +		interval.it_value.tv_sec =3D 0;
> > +		interval.it_interval.tv_nsec =3D
> > interval.it_value.tv_nsec;
> > +		interval.it_interval.tv_sec =3D interval.it_value.tv_sec;
> > +		r =3D timerfd_settime(data.flip_timerfd, 0, &interval,
> > NULL);
> > +		igt_require_f(r !=3D -1, "Error setting timerfd\n");
> > +
> > +		data.fail_timerfd =3D timerfd_create(CLOCK_MONOTONIC,
> > +						   TFD_NONBLOCK);
> > +		igt_require(data.fail_timerfd !=3D -1);
> > +
> > +		data.pollfds[0].fd =3D data.flip_timerfd;
> > +		data.pollfds[0].events =3D POLLIN;
> > +		data.pollfds[0].revents =3D 0;
> > +
> > +		data.pollfds[1].fd =3D data.fail_timerfd;
> > +		data.pollfds[1].events =3D POLLIN;
> > +		data.pollfds[1].revents =3D 0;
> > +	}
> > +
> > +	for (op =3D PAGE_FLIP; op < LAST; op++) {
> > +		igt_subtest_f("%s", op_str(op)) {
> > +			data.op =3D op;
> > +			prepare(&data);
> > +			run(&data);
> > +			cleanup(&data);
> > +		}
> > +	}
> > +
> > +	igt_fixture {
> > +		close(data.debugfs_fd);
> > +		drm_intel_bufmgr_destroy(data.bufmgr);
> > +		display_fini(&data);
> > +	}
> > +
> > +	igt_exit();
> > +}
> > diff --git a/tests/meson.build b/tests/meson.build
> > index b8a6e61b..c557333c 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -49,6 +49,7 @@ test_progs =3D [
> >  	'kms_plane_scaling',
> >  	'kms_properties',
> >  	'kms_psr',
> > +	'kms_psr2_su',
> >  	'kms_pwrite_crc',
> >  	'kms_rmfb',
> >  	'kms_rotation_crc',

--=-jL1dU+7/mtTAvurEAY2M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlw9EdYACgkQVenbO/mO
WkmI6wf+LDr9Ofc0KjFImvYUrSvQ3C0CMlGFa8Ze4RE6qWF03N3mZBwPfaP9ZzUs
GO97P+1IqRVnyVSPfX6I8fYxmGtFeUmglOpm95yYbFAQF+M/NcEOfb68YNBFUvu8
BSUuo4xGRxqNf9jLO+rC45UodxU8pXy5QZn4Zbf7v39QiMs0BqUUZTP+yP8HldAM
remcTp9DEbqti3idN+vpuK3p6pjwc2X1YD3XhhtsLoTHh3ma1aoFWnJxEGbSFvSQ
bp7cOftyCmSKmsv7FjJmUJ7VYQwLqhff0Z0VSGxYTCe99RB/TNOIbEBx2BN3B3WP
g6ZfGFnUFcmSpbFGmUYUY2fY4FbDZQ==
=qoA4
-----END PGP SIGNATURE-----

--=-jL1dU+7/mtTAvurEAY2M--

--===============2094593460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============2094593460==--
