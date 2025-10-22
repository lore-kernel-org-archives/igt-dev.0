Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A3FCCD1BB
	for <igt-dev@archiver.kernel.org>; Wed, 22 Oct 2025 12:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6C810E768;
	Wed, 22 Oct 2025 12:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QGL3Gmm5";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA6510E768
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 12:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761135345;
 bh=RAlJ7hU7KdLn1kAxLEMnM1PznnQ8G/9ojrH93KL6bdg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QGL3Gmm5x8HDbhAURaFIAYO4aTbbR+MlAGyTHDYE60DI4F7zaMBVnAjCnQKZAf/ZR
 DOe45e4vd8SH7543El2U/5CwffDOZTH+EjfE7A1qpA7wfbC+7GUS0hvo3BSMeJ3moa
 FAXaW/ibf4aJhI7lK62c0HJSI3aSUBwt2tL+15zlN71wiim9vRzk26fcJtrh78gbDN
 vENeUFNcF3UNbtKH/aS8zOBG6kAoUaHSa6EpFh2NxCfTNAulaZm7XCO3uIwTKoSSpJ
 w0HKQ9ZlnnshhihFodzqOcM7ePFx4LaYxDdY1dEtU9bpYsNVvUBeumZWiNbXNaPm37
 yzCdNDTiEfZsg==
Received: from xpredator (unknown
 [IPv6:2a02:2f08:e41c:5800:e88e:21ff:fe65:be18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E313917E00AC;
 Wed, 22 Oct 2025 14:15:44 +0200 (CEST)
Date: Wed, 22 Oct 2025 15:15:43 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, ashutosh.dixit@intel.com,
 adrinael@adrinael.net, juhapekka.heikkila@gmail.com,
 dmitry.baryshkov@oss.qualcomm.com, Swati Sharma <swati2.sharma@intel.com>,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 daniels@collabora.com
Subject: Re: [PATCH i-g-t] kms_max_link_bpc: Add 'link bpc' DRM connector
 property
Message-ID: <aPjK70qWZlqJLrUO@xpredator>
References: <20251006080705.2869-1-marius.vlad@collabora.com>
 <20251006095809.7ik5tgd74qi32nuj@kamilkon-DESK.igk.intel.com>
 <f6de4a3f-60e2-44de-859a-1352bbaa3008@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KUp7fERNsOoV36b/"
Content-Disposition: inline
In-Reply-To: <f6de4a3f-60e2-44de-859a-1352bbaa3008@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>


--KUp7fERNsOoV36b/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kamil, Karthik and all,

Thanks for the reviews!

I would like to have a quick note/heads-up here to let people know that
I'm currently re-working the 'link bpc' property to address some of the
comments I've got from Ville, Dmitry, Jani and Daniel on having the
property being connector-agnostic, immutable and use an uevent to
propagate the changes back to userspace rather than polling after a
modeset (which this test does now).

Most likely this needs a bit of adjustment (including the comments I got
already from Kamil and Karthik), hence me delaying on addressing the
comments I've got so far.=20

+CC Ville, Dmitry, Jani, Daniel.

On Fri, Oct 10, 2025 at 09:29:22AM +0530, Karthik B S wrote:
> Hi Marius,
>=20
> On 10/6/2025 3:28 PM, Kamil Konieczny wrote:
> > Hi Marius,
> > On 2025-10-06 at 11:07:01 +0300, Marius Vlad wrote:
> > > We can make use of 'link bpc' -- assuming that's available, to determ=
ine
> > > the current physical bpc used by the driver on a particular connector.
> > >=20
> > > This adds support for the DRM connector property and adds a simple te=
st
> > > that would set-up 'max bpc' followed by reading back the 'link bpc'.
> > > Test expect less or equal than 'max bpc'.
> > >=20
> > > kms_vrr, kms_hdr or kms_color assume CRC support  and all make use of
> > > debugfs to query 'max bpc', while this test will get the actual min/m=
ax
> > > values from 'max bpc' without the implication of having CRC support.
> > >=20
> > > A more thorough test would be to come up with a way that's known to
> > > lower the bpc value to an expected one but that's left for another ti=
me.
> > >=20
> > > Reference: https://lore.kernel.org/dri-devel/20250801101750.1726-1-ma=
rius.vlad@collabora.com/T/#u
> > +cc Karthik and Swati
> >=20
> > Cc: Karthik B S <karthik.b.s@intel.com>
> > Cc: Swati Sharma <swati2.sharma@intel.com>
> >=20
> > > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > > ---
> > >   lib/igt_kms.c            |  40 +++++++
> > >   lib/igt_kms.h            |   4 +
> > >   tests/kms_max_link_bpc.c | 225 ++++++++++++++++++++++++++++++++++++=
+++
> > >   tests/meson.build        |   1 +
> > Please split changes into lib/igt_kms and a new test
> > tests/kms_max_link_bpc
> >=20
> > Btw why not a shorter name: tests/kms_link_bpc
> >=20
> > with one subtest basic-max-link-bpc
> >=20
> > >   4 files changed, 270 insertions(+)
> > >   create mode 100644 tests/kms_max_link_bpc.c
> > >=20
> > > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > > index df4a96a17..d00b85a96 100644
> > > --- a/lib/igt_kms.c
> > > +++ b/lib/igt_kms.c
> > > @@ -732,6 +732,7 @@ const char * const igt_connector_prop_names[IGT_N=
UM_CONNECTOR_PROPS] =3D {
> > >   	[IGT_CONNECTOR_WRITEBACK_FB_ID] =3D "WRITEBACK_FB_ID",
> > >   	[IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR] =3D "WRITEBACK_OUT_FENCE_P=
TR",
> > >   	[IGT_CONNECTOR_DITHERING_MODE] =3D "dithering mode",
> > > +	[IGT_CONNECTOR_LINK_BPC] =3D "link bpc",
> > >   };
> > >   const char * const igt_rotation_names[] =3D {
> > > @@ -6261,6 +6262,20 @@ unsigned int igt_get_output_max_bpc(int drmfd,=
 char *connector_name)
> > >   	return maximum;
> > >   }
> > > +/**
> > > + * igt_get_output_link_bpc:
> > > + * @output: Target output
> > > + *
> > > + * Returns: The current 'link bpc' value from the connector property.
> > > + */
> > > +unsigned long int igt_get_output_link_bpc(igt_output_t *output)
> > > +{
> > > +	if (!igt_output_has_prop(output, IGT_CONNECTOR_LINK_BPC))
> > > +		return 0;
> > > +
> > > +	return igt_output_get_prop(output, IGT_CONNECTOR_LINK_BPC);
> > > +}
> > > +
> > >   /**
> > >    * igt_get_pipe_current_bpc:
> > >    * @drmfd: A drm file descriptor
> > > @@ -6346,6 +6361,31 @@ bool igt_check_output_bpc_equal(int drmfd, enu=
m pipe pipe,
> > >   	return (current =3D=3D bpc);
> > >   }
> > > +/**
> > > + * igt_assert_output_link_bpc_equal:
> > > + * @output: Target output
> > > + * @bpc: link bpc to compare with
> > > + *
> > > + * Assert if outputs's current link bpc is not matched with the requ=
ested one.
> > > + */
> > > +void igt_assert_output_link_bpc_equal(igt_output_t *output, unsigned=
 int bpc)
> > > +{
> > > +	igt_assert_eq(igt_get_output_link_bpc(output), bpc);
> > > +}
> > > +
> > > +/**
> > > + * igt_check_output_link_bpc_equal:
> > > + * @output: Target output
> > > + * @bpc: link bpc to compare with
> > > + *
> > > + * Returns: True if outputs's current link bpc is matched with the r=
equested bpc,
> > > + * else False.
> > > + */
> > > +bool igt_check_output_link_bpc_equal(igt_output_t *output, unsigned =
int bpc)
> > > +{
> > > +	return (igt_get_output_link_bpc(output) =3D=3D bpc);
> > > +}
> > > +
> > >   /**
> > >    * igt_max_bpc_constraint:
> > >    * @display: a pointer to an #igt_display_t structure
> > > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > > index 6ef6871d5..04dcd39df 100644
> > > --- a/lib/igt_kms.h
> > > +++ b/lib/igt_kms.h
> > > @@ -191,6 +191,7 @@ enum igt_atomic_connector_properties {
> > >          IGT_CONNECTOR_WRITEBACK_FB_ID,
> > >          IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR,
> > >          IGT_CONNECTOR_DITHERING_MODE,
> > > +       IGT_CONNECTOR_LINK_BPC,
> > >          IGT_NUM_CONNECTOR_PROPS
> > >   };
> > > @@ -1234,11 +1235,14 @@ bool igt_override_all_active_output_modes_to_=
fit_bw(igt_display_t *display);
> > >   bool igt_fit_modes_in_bw(igt_display_t *display);
> > >   bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
> > >   unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name=
);
> > > +unsigned long int igt_get_output_link_bpc(igt_output_t *output);
> > >   unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
> > >   void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
> > >   				char *output_name, unsigned int bpc);
> > >   bool igt_check_output_bpc_equal(int drmfd, enum pipe pipe,
> > >   				char *output_name, unsigned int bpc);
> > > +bool igt_check_output_link_bpc_equal(igt_output_t *output, unsigned =
int bpc);
> > > +void igt_assert_output_link_bpc_equal(igt_output_t *output, unsigned=
 int bpc);
> > >   int sort_drm_modes_by_clk_dsc(const void *a, const void *b);
> > >   int sort_drm_modes_by_clk_asc(const void *a, const void *b);
> > > diff --git a/tests/kms_max_link_bpc.c b/tests/kms_max_link_bpc.c
> > > new file mode 100644
> > > index 000000000..f5e2006ab
> > > --- /dev/null
> > > +++ b/tests/kms_max_link_bpc.c
> > > @@ -0,0 +1,225 @@
> > Add SPDX here.
> >=20
> > > +/*
> > > + * Copyright =A9 2025 Collabora Ltd.,
> > > + *
> > > + * Permission is hereby granted, free of charge, to any person obtai=
ning a
> > And remove text from here as SPDX raplaces it.
> >=20
> > > + * copy of this software and associated documentation files (the "So=
ftware"),
> > > + * to deal in the Software without restriction, including without li=
mitation
> > > + * the rights to use, copy, modify, merge, publish, distribute, subl=
icense,
> > > + * and/or sell copies of the Software, and to permit persons to whom=
 the
> > > + * Software is furnished to do so, subject to the following conditio=
ns:
> > > + *
> > > + * The above copyright notice and this permission notice (including =
the next
> > > + * paragraph) shall be included in all copies or substantial portion=
s of the
> > > + * Software.
> > > + *
> > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, E=
XPRESS OR
> > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTA=
BILITY,
> > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVEN=
T SHALL
> > > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAM=
AGES OR
> > > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERW=
ISE,
> > > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE US=
E OR
> > > + * OTHER DEALINGS IN THE SOFTWARE.
> > > + *
> > > + */
> > > +
> > > +/**
> > > + * TEST: kms max link bpc
> > > + * Category: Display
> > > + * Description: Test 'link bpc' connector property. 'max bpc' gives =
the
> > Add also what BPC is (my guess: bits per color)
> >=20
> > > + * possiblity to set-up the maximum value but there's nothing to rel=
y on for
> > > + * the current physical link value, as drivers could downgrade the b=
pc value.
> > > + * 'link bpc' can be used to get the current physical bpc value
> > > + * Mega feature: General Display Features
> > Karthik or Swati: do we need more fields here?
> No, this is sufficient as this test is agnostic of xe/i915.
> >=20
> > > + */
> > > +
> > > +#include "igt.h"
> > Move igt headers after system ones, also with one newline
> > separating them.
> >=20
> > > +#include <fcntl.h>
> > > +#include <termios.h>
> > > +#include <unistd.h>
> > > +
> > Here should go igt headers.
> >=20
> > > +/**
> > > + * SUBTEST: max-link-bpc
> > > + * Description: Verifies that 'link bpc' is at least the set-up valu=
e of 'max
> > > + * bpc'
> Isn't it the other way around? "igt_assert_lte_u64(link_bpc, range.max)"
> > > + *
> > > + */
> > > +
> > > +IGT_TEST_DESCRIPTION("Test 'max bpc' and 'link bpc' connector proper=
ties");
> > > +
> > > +/* Common test data. */
> > > +typedef struct data {
> > > +	igt_display_t display;
> > > +	igt_plane_t *primary;
> > > +	igt_output_t *output;
> > > +	int fd;
> > > +} data_t;
> > > +
> > > +typedef struct range {
> > > +	uint64_t min;
> > > +	uint64_t max;
> > > +} range_t;
> > > +
> > > +/* rather than using debugfs to get max bpc or current max bpc
> > > + * use the actual range */
> > > +static range_t
> > > +get_bpc_range(igt_output_t *output, const char *prop_name)
> This function should be moved to lib, IMHO.
> > > +{
> > > +	range_t range =3D { 0, 0 };
> > > +	drmModeObjectPropertiesPtr proplist;
> > > +	drmModePropertyPtr _prop;
> > > +	int drm_fd =3D output->display->drm_fd;
> > > +	int conn_id =3D output->config.connector->connector_id;
> > > +	int i;
> > > +
> > > +	if (!prop_name)
> > > +		return range;
> > > +
> > > +	proplist =3D drmModeObjectGetProperties(drm_fd, conn_id, DRM_MODE_O=
BJECT_CONNECTOR);
> > > +	if (!proplist)
> > > +		return range;
> > > +
> > > +	for (i =3D 0; i < proplist->count_props; i++) {
> > > +		_prop =3D drmModeGetProperty(drm_fd, proplist->props[i]);
> > > +		if (!_prop || !(_prop->flags & DRM_MODE_PROP_RANGE ||
> > > +				_prop->flags & DRM_MODE_PROP_SIGNED_RANGE))
> > > +			continue;
> > > +
> > > +		if (strcmp(_prop->name, prop_name) =3D=3D 0) {
> > > +			igt_assert_eq(_prop->count_values, 2);
> > > +
> > > +			range.max =3D _prop->values[1];
> > > +			range.min =3D _prop->values[0];
> > > +
> > > +			igt_log(IGT_LOG_DOMAIN, IGT_LOG_INFO,
> > > +				"Found %s property with min %lu max %lu\n",
> > > +				prop_name, range.min, range.max);
> > > +
> > > +			drmModeFreeProperty(_prop);
> > > +			break;
> > > +		} else {
> > > +			drmModeFreeProperty(_prop);
> > > +		}
> > > +	}
> > > +
> > > +	drmModeFreeObjectProperties(proplist);
> > > +	return range;
> > > +}
> > > +
> > > +static void
> > > +run_test_bpc(data_t *data, igt_output_t *output, range_t range)
> > > +{
> > > +	cairo_t *cr =3D NULL;
> > > +	igt_fb_t fb;
> > > +	int fb_id;
> > > +	unsigned long int link_bpc =3D 0;
> > > +
> > > +	fb_id =3D igt_create_fb(data->fd, 512, 512,
> > > +			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
> > > +	igt_assert(fb_id);
> > > +	cr =3D igt_get_cairo_ctx(fb.fd, &fb);
> > > +
> > > +	igt_paint_color(cr, 0, 0, fb.width, fb.height, 1.0, 1.0, 1.0);
> > > +	igt_paint_test_pattern(cr, fb.width, fb.height);
> > > +
> > > +	igt_put_cairo_ctx(cr);
> > > +
> > > +	data->primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_=
PRIMARY);
> > > +
> > > +	igt_plane_set_fb(data->primary, &fb);
> > > +	igt_plane_set_size(data->primary, fb.width, fb.height);
> > > +	igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_=
ONLY, NULL);
> > > +
> > > +	/* set to range.max */
> > > +	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, range.max);
> > > +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MOD=
ESET, NULL);
> > > +	link_bpc =3D igt_get_output_link_bpc(output);
> > > +	igt_log(IGT_LOG_DOMAIN, IGT_LOG_INFO,
> > > +		"Setting max bpc to %lu, link bpc is %lu\n", range.max, link_bpc);
> Please use igt_info() here.
> > > +	igt_assert_lte_u64(link_bpc, range.max);
> > > +
> > > +	/* FIXME: do a potential modeline change to determine a bpc downgra=
de
> > > +	 * which should be followed by a check for
> > > +	 * (igt_get_output_link_bpc(output) < range.max)) */
> > > +
> > > +	/* set to range.min */
> > > +	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, range.min);
> > > +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MOD=
ESET, NULL);
> > > +	link_bpc =3D igt_get_output_link_bpc(output);
> > > +	igt_log(IGT_LOG_DOMAIN, IGT_LOG_INFO,
> Please use igt_info() here.
> > > +		"Setting max bpc to %lu, link bpc is %lu\n", range.min,
> > > +		igt_get_output_link_bpc(output));
> > > +	igt_assert_lte_u64(link_bpc, range.min);
> > > +
> > > +	/* go back to range.max */
> > > +	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, range.max);
> > > +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MOD=
ESET, NULL);
> > > +	link_bpc =3D igt_get_output_link_bpc(output);
> > > +	igt_log(IGT_LOG_DOMAIN, IGT_LOG_INFO,
>=20
> Please use igt_info() here.
>=20
> Regards,
> Karthik.B.S
> > > +		"Setting max bpc to %lu, link bpc is %lu\n", range.max,
> > > +		igt_get_output_link_bpc(output));
> > > +	igt_assert_lte_u64(link_bpc, range.max);
> > > +
> > > +	igt_display_reset(&data->display);
> > > +	igt_remove_fb(data->fd, &fb);
> > > +}
> > > +
> > > +static void
> > > +test_bpc(data_t *data)
> > > +{
> > > +	igt_output_t *output;
> > > +	igt_display_t *display =3D &data->display;
> > > +
> > > +	igt_display_reset(display);
> > > +
> > > +	for_each_connected_output(display, output) {
> > > +		enum pipe pipe;
> > > +		range_t max_bpc_range;
> > > +
> > > +		if (!igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC)) {
> > > +			igt_info("Output %s: Doesn't support \"max bpc\" property.\n",
> > > +				 igt_output_name(output));
> > > +			continue;
> > > +		}
> > > +
> > > +		if (!igt_output_has_prop(output, IGT_CONNECTOR_LINK_BPC)) {
> > > +			igt_info("Output %s: Doesn't support \"link bpc\" property.\n",
> > > +				 igt_output_name(output));
> > > +			continue;
> > > +		}
> > > +
> > > +		max_bpc_range =3D get_bpc_range(output, "max bpc");
> > > +		for_each_pipe(&data->display, pipe) {
> > > +			igt_output_set_pipe(output, pipe);
> > > +			if (!intel_pipe_output_combo_valid(&data->display)) {
> > > +				igt_output_set_pipe(output, PIPE_NONE);
> > > +				continue;
> > > +			}
> > > +
> > > +			igt_dynamic_f("output-%s-%s", kmstest_pipe_name(pipe), output->na=
me)
> > > +				run_test_bpc(data, output, max_bpc_range);
> > > +		}
> > > +	}
> > > +}
> > > +
> > > +igt_main
> > > +{
> > > +	data_t data =3D { 0 };
> > > +
> > > +	igt_fixture {
> > > +		data.fd =3D drm_open_driver_master(DRIVER_ANY);
> > > +		kmstest_set_vt_graphics_mode();
> > > +
> > > +		igt_display_require(&data.display, data.fd);
> > > +		igt_require(data.display.is_atomic);
> > > +		igt_display_require_output(&data.display);
> > > +	}
> > > +
> > > +	igt_describe("Tests 'link bpc' being the at least 'max bpc'");
> > > +	igt_subtest_with_dynamic("max-link-bpc")
> > > +		test_bpc(&data);
> > > +
> > > +	igt_fixture {
> > > +		igt_display_fini(&data.display);
> > > +		drm_close_driver(data.fd);
> > > +	}
> > > +}
> > > diff --git a/tests/meson.build b/tests/meson.build
> > > index a7b9375ed..e948c5c3c 100644
> > > --- a/tests/meson.build
> > > +++ b/tests/meson.build
> > > @@ -32,6 +32,7 @@ test_progs =3D [
> > >   	'kms_cursor_legacy',
> > >   	'kms_debugfs',
> > >   	'kms_dither',
> > > +	'kms_max_link_bpc',
> > Move it to proper place to keep list in alphabeticall order.
> >=20
> > Regards,
> > Kamil
> >=20
> > >   	'kms_display_modes',
> > >   	'kms_dp_aux_dev',
> > >   	'kms_feature_discovery',
> > > --=20
> > > 2.47.2
> > >=20

--KUp7fERNsOoV36b/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmj4yuIACgkQ9jQS5glH
1u+0oxAAxt1Iw2V6GdY7GNWiSNVpUYx/vxaKpbl0hQKA8H+IuHnF8ACtVGoppaTK
dsHird1Z4VUK0jUZ8lNEniZgQu9+009Dk20eALuvnoR3aZpyGjL3ZPZ2yINmRxIY
lQpdMeRhdi/EdUW7PbBescF22F+uFiWZe61/fdhQt44rv8ed3YSgb5rbPlkI58Cq
W3wvuU30TzidjGSMOBkklKrFVnW2PJEiULE0PNFtSWjqQuGECzu/8CKzi+JjPv5F
SjrRMZzpuIVqhNnX50u2qQiczYjlX9U88aHntzLy0nvn8gz5VSquwr7KpA71FCub
R5KlgjOTvu7JYrQt06hT3Zzp2aRMvvywlHrwquH+kpnIvzuwANr1Ies56BwxaM+j
wpjyK181F34R9eRHgclNsf6uXhWrzZyricHYvC0G8N4zHJ79cKwESvblCvZVdyuD
LjgfAZcZjw66DXEPhKdLFR4RFSY3CMQHeBckkCPHlfIG3rF7q2mvuYToxecyBoP4
NdihJWQQA3s9rVOWVIvUapwCxHIegGJFJpE42Z+XCHpHSWeu92cnRwRjQ364l5MB
Qia7LAxwHm8uJEkpZVZEnlAMjzsT51UbOn++26XIMrfzL57EE3tllg80FpQEFtWw
QymRXqLlBc1l1yJdIDES0L3m2Z2G1L0dR7X2mDNoGy4QY5uAJv8=
=l0P9
-----END PGP SIGNATURE-----

--KUp7fERNsOoV36b/--
