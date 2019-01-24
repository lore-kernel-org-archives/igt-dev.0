Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77206E378
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Jan 2019 18:27:48 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 24 Jan 2019 18:27:46 +0000
Message-ID: <c5d39a53a4d765a5cf0f54622a9f2115394ed009.camel@intel.com>
References: <20190123235636.8720-1-jose.souza@intel.com>
 <20190123235636.8720-3-jose.souza@intel.com>
 <1ebf61eb4983ff67ee416d17f0f8ad5ad3e72dfa.camel@intel.com>
In-Reply-To: <1ebf61eb4983ff67ee416d17f0f8ad5ad3e72dfa.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 3/4] test: Add PSR2 selective update
 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0959543370=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0959543370==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-t36IZRYruDIWqqAPDnHR"

--=-t36IZRYruDIWqqAPDnHR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-01-23 at 18:33 -0800, Dhinakaran Pandiyan wrote:
> On Wed, 2019-01-23 at 15:56 -0800, Jos=C3=A9 Roberto de Souza wrote:
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
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  lib/igt_psr.c          |  29 ++++
> >  lib/igt_psr.h          |   1 +
> >  tests/Makefile.sources |   1 +
> >  tests/kms_psr2_su.c    | 292
> > +++++++++++++++++++++++++++++++++++++++++
> >  tests/meson.build      |   1 +
> >  5 files changed, 324 insertions(+)
> >  create mode 100644 tests/kms_psr2_su.c
> >=20
> > diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> > index d726fad5..8c0f05e8 100644
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
> > index 519eac79..9174aecc 100644
> > --- a/tests/Makefile.sources
> > +++ b/tests/Makefile.sources
> > @@ -80,6 +80,7 @@ TESTS_progs =3D \
> >  	kms_plane_scaling \
> >  	kms_properties \
> >  	kms_psr \
> > +	kms_psr2_su \
> >  	kms_pwrite_crc \
> >  	kms_rmfb \
> >  	kms_rotation_crc \
> > diff --git a/tests/kms_psr2_su.c b/tests/kms_psr2_su.c
> > new file mode 100644
> > index 00000000..344ddffe
> > --- /dev/null
> > +++ b/tests/kms_psr2_su.c
> > @@ -0,0 +1,292 @@
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
>=20
> Won't this fail the same way as other PSR2 tests on WHL because of
> the
> default mode exceeding PSR2 capability?

As the goal of this test is not to test if PSR2 can be enabled, on
igt_fixture() we have:

igt_require(psr_enable(data.debugfs_fd, PSR_MODE_2));
igt_require(psr_wait_entry(data.debugfs_fd, PSR_MODE_2));

So this test will be skiped and the error will be reported by
kms_psr@psr2_basic and other tests in kms_psr.

>=20

--=-t36IZRYruDIWqqAPDnHR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxKA6AACgkQVenbO/mO
WkkGOwf8C44GByD9DfBj1MAjrIBJgxI20Rsg2eWIK94gNf8D4f13bGx4zWkCYT4o
csv16Q3rjfu/z5pItj3QUhCDPGrIF2oxLd5aDv/39ZUHJzxvg5tV2zEva1kQs+19
ogcjhmpRjcl9MWYIOfExOnbJckZYI1fZtU4XQvIKHlxD3jmGswk2Yimofb3Vsl4r
JnghTAfoU7yIwg7nPMxWze+ZVmeU88zrl2jVr33PzOWMwFf6JkrT/O8siRrrsOXq
kSCZyrZRGBqQfzwFkH6inJ3OK7PE98hHuRnBMWdxDVJ2hRX7i03m88UpdCVo5+zr
QoqebNhskqS8naXkhWB8ZQQsnNnzdw==
=26sd
-----END PGP SIGNATURE-----

--=-t36IZRYruDIWqqAPDnHR--

--===============0959543370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0959543370==--
