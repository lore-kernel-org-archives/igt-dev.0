Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525E96E350
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Feb 2019 00:46:26 +0000 (UTC)
Date: Thu, 14 Feb 2019 00:46:23 +0000
Message-ID: <3d18310fc5a0184ec5991ea6c3136a3616e47406.camel@intel.com>
References: <20190208005305.6599-1-jose.souza@intel.com>
 <d71495f81c02aa8e86c7368df888edda71d8e123.camel@intel.com>
In-Reply-To: <d71495f81c02aa8e86c7368df888edda71d8e123.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6 1/4] test: Add PSR2 selective update
 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
From: "Souza, Jose via igt-dev" <igt-dev@lists.freedesktop.org>
Reply-To: "Souza, Jose" <jose.souza@intel.com>
Content-Type: multipart/mixed; boundary="===============1548145594=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1548145594==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-VACimSUXx8BTJhyOQB/A"

--=-VACimSUXx8BTJhyOQB/A
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-02-13 at 16:21 -0800, Dhinakaran Pandiyan wrote:
> On Thu, 2019-02-07 at 16:53 -0800, Jos=C3=A9 Roberto de Souza wrote:
> > This tests checks if hardware is able to do selective update when
> > screen changes.
> > PSR2 don't trigger interruptions and the 'PSR2 SU status' register
> > is not kept loaded all the times, so it is necessary keep polling
> > PSR status debugfs until those values are loaded.
> >=20
> > Also from DEEP_SLEEP state HW will not do a seletive update, as
> > most of the memory/context is lost in deep sleep state hardware
> > will
> > need to exit PSR mode then wait a configured number of frames to
> > activate PSR again to then start doing seletive updates, that is
> > why
> > just one screen change is not enough to pass this tests.
> >=20
> > When a selective update happens and the values are loaded and read
> > from debugfs it is compared with the expected value of seletive
> > update blocks, if matches the polling is stopped and the test
> > passed
> > otherwise it will wait until it reachs a maximum number o screen
> > changes to fail the test.
> >=20
> > v2: Using new SU blocks debugfs output
> >=20
> > v3:
> > - removed the timerfd to fail the test, now failing based in a
> > maximum number of screen changes
> > - removing thread to read debugfs, read from main thread is enough
> > - improved commit message
> >=20
> > v4:
> > - getting cairo context for frontbuffer test in prepare()
> > - droppoing poll(), using blocking timerfd instead
> >=20
> > v5:
> > - Doing a modeset before trying to enable PSR2
> >=20
> > v6:
> > - doing atomic commits to fix(legacy commit is taking more time in
> > recent kernels causing us to miss the SU when reading debugfs) and
> > speedup test
> > - fixed code to skip test when PSR2 is not possile
>=20
> Thanks for making these changes.
>=20
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  lib/igt_psr.c          |  29 ++++
> >  lib/igt_psr.h          |   1 +
> >  tests/Makefile.sources |   1 +
> >  tests/kms_psr2_su.c    | 294
> > +++++++++++++++++++++++++++++++++++++++++
> >  tests/meson.build      |   1 +
> >  5 files changed, 326 insertions(+)
> >  create mode 100644 tests/kms_psr2_su.c
> >=20
> > diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> > index 6ad2c522..b5847bfd 100644
> > --- a/lib/igt_psr.c
> > +++ b/lib/igt_psr.c
> > @@ -178,3 +178,32 @@ bool psr_sink_support(int debugfs_fd, enum
> > psr_mode mode)
> >  		 */
> >  		return strstr(buf, "Sink support: yes [0x03]");
> >  }
> > +
> > +#define PSR2_SU_BLOCK_STR_LOOKUP "PSR2 SU blocks:\n0\t"
> > +
> > +static bool
> > +psr2_read_last_num_su_blocks_val(int debugfs_fd, uint16_t
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
> > +
> > +bool psr2_wait_su(int debugfs_fd, uint16_t *num_su_blocks)
> > +{
> > +	return igt_wait(psr2_read_last_num_su_blocks_val(debugfs_fd,
> > num_su_blocks), 40, 1);
> > +}
> > diff --git a/lib/igt_psr.h b/lib/igt_psr.h
> > index 7e7017bf..49599cf8 100644
> > --- a/lib/igt_psr.h
> > +++ b/lib/igt_psr.h
> > @@ -40,5 +40,6 @@ bool psr_wait_update(int debugfs_fd, enum
> > psr_mode
> > mode);
> >  bool psr_enable(int debugfs_fd, enum psr_mode);
> >  bool psr_disable(int debugfs_fd);
> >  bool psr_sink_support(int debugfs_fd, enum psr_mode);
> > +bool psr2_wait_su(int debugfs_fd, uint16_t *num_su_blocks);
> > =20
> >  #endif
> > diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> > index a234fa5d..d2c4f9fe 100644
> > --- a/tests/Makefile.sources
> > +++ b/tests/Makefile.sources
> > @@ -62,6 +62,7 @@ TESTS_progs =3D \
> >  	kms_plane_scaling \
> >  	kms_properties \
> >  	kms_psr \
> > +	kms_psr2_su \
> >  	kms_pwrite_crc \
> >  	kms_rmfb \
> >  	kms_rotation_crc \
> > diff --git a/tests/kms_psr2_su.c b/tests/kms_psr2_su.c
> > new file mode 100644
> > index 00000000..2c75b85b
> > --- /dev/null
> > +++ b/tests/kms_psr2_su.c
> > @@ -0,0 +1,294 @@
> > +/*
> > + * Copyright =C2=A9 2019 Intel Corporation
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
> > +#include <stdbool.h>
> > +#include <stdio.h>
> > +#include <string.h>
> > +#include <sys/timerfd.h>
> > +#include "intel_bufmgr.h"
> > +
> > +IGT_TEST_DESCRIPTION("Test PSR2 selective update");
> > +
> > +#define SQUARE_SIZE 100
> > +/* each selective update block is 4 lines tall */
> > +#define EXPECTED_NUM_SU_BLOCKS ((SQUARE_SIZE / 4) + (SQUARE_SIZE %
> > 4
> > ? 1 : 0))
> > +
> > +/*
> > + * Minimum is 15 as the number of frames to active PSR2 could be
> > configured
> > + * to 15 frames plus a few more in case we miss a selective update
> > between
> > + * debugfs reads.
> > + */
> > +#define MAX_SCREEN_CHANGES 20
> > +
> > +enum operations {
> > +	PAGE_FLIP,
> > +	FRONTBUFFER,
> > +	LAST
> Something like "INVALID" would have made it more obvious?
>=20
>=20
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
> > +	int drm_fd;
> > +	int debugfs_fd;
> > +	igt_display_t display;
> > +	drm_intel_bufmgr *bufmgr;
> > +	drmModeModeInfo *mode;
> > +	igt_output_t *output;
> > +	struct igt_fb fb[2];
> > +	enum operations op;
> > +	cairo_t *cr;
> > +	int change_screen_timerfd;
> > +	uint32_t screen_changes;
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
> > +static void prepare(data_t *data)
> > +{
> > +	igt_plane_t *primary;
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
> > +		/* paint a white square */
> > +		igt_paint_color_alpha(cr, 0, 0, SQUARE_SIZE,
> > SQUARE_SIZE,
> > +				      1.0, 1.0, 1.0, 1.0);
> > +		igt_put_cairo_ctx(data->drm_fd,  &data->fb[1], cr);
> > +	} else if (data->op =3D=3D FRONTBUFFER) {
> > +		data->cr =3D igt_get_cairo_ctx(data->drm_fd, &data-
> > > fb[0]);
> > +	}
> > +
> > +	primary =3D igt_output_get_plane_type(data->output,
> > +					    DRM_PLANE_TYPE_PRIMARY);
> > +
> > +	igt_plane_set_fb(primary, &data->fb[0]);
> > +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> > +
> > +	data->screen_changes =3D 0;
> > +}
> > +
> > +static bool update_screen_and_test(data_t *data)
> > +{
> > +	uint16_t su_blocks;
> > +	bool ret =3D false;
> > +
> > +	data->screen_changes++;
> > +
> > +	switch (data->op) {
> > +	case PAGE_FLIP: {
> > +		igt_plane_t *primary;
> > +
> > +		primary =3D igt_output_get_plane_type(data->output,
> > +						    DRM_PLANE_TYPE_PRIM
> > ARY);
> > +
> > +		igt_plane_set_fb(primary, &data->fb[data-
> > > screen_changes & 1]);
> > +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> > +		break;
> > +	}
> > +	case FRONTBUFFER: {
> > +		drmModeClip clip;
> > +
> > +		clip.x1 =3D clip.y1 =3D 0;
> > +		clip.x2 =3D clip.y2 =3D SQUARE_SIZE;
> > +
> > +		if (data->screen_changes & 1) {
> > +			/* go back to all green frame with a square */
> > +			igt_paint_color_alpha(data->cr, 0, 0,
> > SQUARE_SIZE,
> > +					      SQUARE_SIZE, 1.0, 1.0,
> > 1.0, 1.0);
> > +		} else {
> > +			/* go back to all green frame */
> > +			igt_paint_color_alpha(data->cr, 0, 0,
> > SQUARE_SIZE,
> > +					      SQUARE_SIZE, 0, 1.0, 0,
> > 1.0);
> > +		}
> > +
> > +		drmModeDirtyFB(data->drm_fd, data->fb[0].fb_id, &clip,
> > 1);
> > +		break;
> > +	}
> > +	default:
> > +		igt_assert_f(data->op, "Operation not handled\n");
> > +	}
> > +
> > +	if (psr2_wait_su(data->debugfs_fd, &su_blocks))
> > +		ret =3D su_blocks =3D=3D EXPECTED_NUM_SU_BLOCKS;
> > +
> > +	return ret;
> > +}
> > +
> > +static void run(data_t *data)
> > +{
> > +	bool result =3D false;
> > +
> > +	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
> > +
> > +	while (data->screen_changes < MAX_SCREEN_CHANGES && !result) {
>=20
> nitpick: Updating data->screen_changes here would have made it clear
> that we increment it every iteration.
>=20
> With or without above changes,=20
> Reviewed-by: Dhinakaran Pandiyan <
> dhinakaran.pandiyan@intel.com>
> On ICL,=20
> Tested-by: Dhinakaran Pandiyan <
> dhinakaran.pandiyan@intel.com>
>=20

Thanks, I just pushed this, we can improve on top when adding more
operations.

> > +		uint64_t exp;
> > +		int r;
> > +
> > +		r =3D read(data->change_screen_timerfd, &exp,
> > sizeof(exp));
> > +		if (r =3D=3D sizeof(uint64_t) && exp)
> > +			result =3D update_screen_and_test(data);
> > +	}
> > +
> > +	igt_debug("Screen changes: %u\n", data->screen_changes);
> > +	igt_assert_f(result,
> > +		     "No matching selective update blocks read from
> > debugfs\n");
> > +}
> > +
> > +static void cleanup(data_t *data)
> > +{
> > +	igt_plane_t *primary;
> > +
> > +	primary =3D igt_output_get_plane_type(data->output,
> > +					    DRM_PLANE_TYPE_PRIMARY);
> > +	igt_plane_set_fb(primary, NULL);
> > +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> > +
> > +	if (data->op =3D=3D PAGE_FLIP)
> > +		igt_remove_fb(data->drm_fd, &data->fb[1]);
> > +	else if (data->op =3D=3D FRONTBUFFER)
> > +		igt_put_cairo_ctx(data->drm_fd, &data->fb[0], data-
> > > cr);
> > +
> > +	igt_remove_fb(data->drm_fd, &data->fb[0]);
> > +}
> > +
> > +int main(int argc, char *argv[])
> > +{
> > +	data_t data =3D {};
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
> > +
> > +		igt_require_f(psr_sink_support(data.debugfs_fd,
> > PSR_MODE_2),
> > +			      "Sink does not support PSR2\n");
> > +
> > +		data.bufmgr =3D drm_intel_bufmgr_gem_init(data.drm_fd,
> > 4096);
> > +		igt_assert(data.bufmgr);
> > +		drm_intel_bufmgr_gem_enable_reuse(data.bufmgr);
> > +
> > +		display_init(&data);
> > +
> > +		/* Test if PSR2 can be enabled */
> > +		igt_require_f(psr_enable(data.debugfs_fd, PSR_MODE_2),
> > +			      "Error enabling PSR2\n");
> > +		data.op =3D FRONTBUFFER;
> > +		prepare(&data);
> > +		r =3D psr_wait_entry(data.debugfs_fd, PSR_MODE_2);
> I would rename this "r" to something more intuitive as assertions get
> debug logged.
>=20
>=20
>=20
> > +		cleanup(&data);
> > +		igt_require_f(r, "PSR2 can not be enabled\n");
> > +
> > +		/* blocking timerfd */
> > +		data.change_screen_timerfd =3D
> > timerfd_create(CLOCK_MONOTONIC, 0);
> > +		igt_require(data.change_screen_timerfd !=3D -1);
> > +		/* Changing screen at 30hz to support 30hz panels */
> > +		interval.it_value.tv_nsec =3D NSEC_PER_SEC / 30;
> > +		interval.it_value.tv_sec =3D 0;
> > +		interval.it_interval.tv_nsec =3D
> > interval.it_value.tv_nsec;
> > +		interval.it_interval.tv_sec =3D interval.it_value.tv_sec;
> > +		r =3D timerfd_settime(data.change_screen_timerfd, 0,
> > &interval, NULL);
> > +		igt_require_f(r !=3D -1, "Error setting timerfd\n");
> > +	}
> > +
> > +	for (data.op =3D PAGE_FLIP; data.op < LAST; data.op++) {
> > +		igt_subtest_f("%s", op_str(data.op)) {
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
> > index 0f12df26..ec980651 100644
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

--=-VACimSUXx8BTJhyOQB/A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxkul4ACgkQVenbO/mO
Wkk9UQf/X2Bx9dkTlitk6Nu+G4svw2ZUOG37aVmWV1EByxh/6CaPpXduflpX9Gg7
BEvgSVdIc4L7Kpn7ZJZnwkwLwuE6x8ShSKwi2arXfj9G4Z9reNuz2Tzv5tr5Zg2p
f0LGVD6+GDGfOm6ot46hUXYeilgjfT9SAbHjVOP4aEr6uzEmrvgjXCvvOlSZ/MdK
+8wOHYPcdPlg87B+32sGLoSoOFjt5wuGtPuNXZhPP0bvq9ztANM6gt1gsgd2hyFo
bhRccAONKa6CNnyGc8R8fonK7OU6Ny+F9tB3mhqGAU/V7T8JwkzbupdHa17H9ow0
Ipoybb3idx5eMcikOfRYld5tq1fIEw==
=0LlH
-----END PGP SIGNATURE-----

--=-VACimSUXx8BTJhyOQB/A--

--===============1548145594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1548145594==--
