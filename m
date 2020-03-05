Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742D489DC0
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2020 16:50:13 +0000 (UTC)
Date: Thu, 5 Mar 2020 18:50:10 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200305165010.GO13686@intel.com>
References: <1583379218-30115-1-git-send-email-kunal1.joshi@intel.com>
 <1583379218-30115-3-git-send-email-kunal1.joshi@intel.com>
 <20200305130115.GI13686@intel.com>
 <20200305084238.GB4267@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305084238.GB4267@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/kms_chamelium: Add support
 to validate RGB/YUV pixel formats
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 05, 2020 at 02:12:38PM +0530, Kunal Joshi wrote:
> On 2020-03-05 at 15:01:15 +0200, Ville Syrj=E4l=E4 wrote:
> > On Thu, Mar 05, 2020 at 09:03:38AM +0530, Kunal Joshi wrote:
> > > Currently, only hard coded pixel formats are validated which are not
> > > generic for all the platforms which leads to SKIPS.
> > > Added support to validate only those pixel formats which are supporte=
d by
> > > platform. Both RGB and YUV pixel formats are covered.
> > > =

> > > Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> > > ---
> > >  tests/kms_chamelium.c | 140 +++++++++++++++++++---------------------=
----------
> > >  1 file changed, 54 insertions(+), 86 deletions(-)
> > > =

> > > diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> > > index 5c4a189..5c96017 100644
> > > --- a/tests/kms_chamelium.c
> > > +++ b/tests/kms_chamelium.c
> > > @@ -2612,6 +2612,14 @@ static const struct edid *get_edid(enum test_e=
did edid)
> > >  			if (chamelium_port_get_type(port) =3D=3D \
> > >  			    DRM_MODE_CONNECTOR_ ## type__)
> > >  =

> > > +#define connector_subtest_start(name__, type__)              \
> > > +        igt_subtest_with_dynamic(name__)                     \
> > > +                for_each_port(p, port)                       \
> > > +                        if (chamelium_port_get_type(port) =3D=3D \
> > > +                            DRM_MODE_CONNECTOR_ ## type__) {
> > > +
> > > +#define connector_subtest_end }
> > > +
> > >  static data_t data;
> > >  =

> > >  IGT_TEST_DESCRIPTION("Tests requiring a Chamelium board");
> > > @@ -2817,54 +2825,29 @@ igt_main
> > >  					       CHAMELIUM_CHECK_CRC, 3);
> > >  =

> > >  		igt_describe(test_display_one_mode_desc);
> > > -		connector_subtest("hdmi-crc-argb8888", HDMIA)
> > > -			test_display_one_mode(&data, port, DRM_FORMAT_ARGB8888,
> > > -					      CHAMELIUM_CHECK_CRC, 1);
> > > -
> > > -		igt_describe(test_display_one_mode_desc);
> > > -		connector_subtest("hdmi-crc-abgr8888", HDMIA)
> > > -			test_display_one_mode(&data, port, DRM_FORMAT_ABGR8888,
> > > -					      CHAMELIUM_CHECK_CRC, 1);
> > > -
> > > -		igt_describe(test_display_one_mode_desc);
> > > -		connector_subtest("hdmi-crc-xrgb8888", HDMIA)
> > > -			test_display_one_mode(&data, port, DRM_FORMAT_XRGB8888,
> > > -					      CHAMELIUM_CHECK_CRC, 1);
> > > -
> > > -		igt_describe(test_display_one_mode_desc);
> > > -		connector_subtest("hdmi-crc-xbgr8888", HDMIA)
> > > -			test_display_one_mode(&data, port, DRM_FORMAT_XBGR8888,
> > > -					      CHAMELIUM_CHECK_CRC, 1);
> > > -
> > > -		igt_describe(test_display_one_mode_desc);
> > > -		connector_subtest("hdmi-crc-rgb888", HDMIA)
> > > -			test_display_one_mode(&data, port, DRM_FORMAT_RGB888,
> > > -					      CHAMELIUM_CHECK_CRC, 1);
> > > -
> > > -		igt_describe(test_display_one_mode_desc);
> > > -		connector_subtest("hdmi-crc-bgr888", HDMIA)
> > > -			test_display_one_mode(&data, port, DRM_FORMAT_BGR888,
> > > -					      CHAMELIUM_CHECK_CRC, 1);
> > > -
> > > -		igt_describe(test_display_one_mode_desc);
> > > -		connector_subtest("hdmi-crc-rgb565", HDMIA)
> > > -			test_display_one_mode(&data, port, DRM_FORMAT_RGB565,
> > > -					      CHAMELIUM_CHECK_CRC, 1);
> > > -
> > > -		igt_describe(test_display_one_mode_desc);
> > > -		connector_subtest("hdmi-crc-bgr565", HDMIA)
> > > -			test_display_one_mode(&data, port, DRM_FORMAT_BGR565,
> > > -					      CHAMELIUM_CHECK_CRC, 1);
> > > -
> > > -		igt_describe(test_display_one_mode_desc);
> > > -		connector_subtest("hdmi-crc-argb1555", HDMIA)
> > > -			test_display_one_mode(&data, port, DRM_FORMAT_ARGB1555,
> > > -					      CHAMELIUM_CHECK_CRC, 1);
> > > -
> > > -		igt_describe(test_display_one_mode_desc);
> > > -		connector_subtest("hdmi-crc-xrgb1555", HDMIA)
> > > -			test_display_one_mode(&data, port, DRM_FORMAT_XRGB1555,
> > > -					      CHAMELIUM_CHECK_CRC, 1);
> > > +		connector_subtest_start("hdmi-rgb-pixel-format", HDMIA)
> > > +			int k;
> > > +			igt_output_t *output;
> > > +			igt_plane_t *primary;
> > > +
> > > +			output =3D prepare_output(&data, port, TEST_EDID_BASE);
> > > +			primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIM=
ARY);
> > > +			igt_assert(primary);
> > > +
> > > +			for (k =3D 0; k < primary->format_mod_count; k++) {
> > > +				if (!igt_fb_supported_format(primary->formats[k]))
> > > +					continue;
> > > +
> > > +				if ((igt_format_is_yuv(primary->formats[k]) ||
> > > +				     primary->modifiers[k] !=3D LOCAL_DRM_FORMAT_MOD_NONE))
> > > +					continue;
> > > +
> > > +				igt_dynamic_f("testing-format-%c%c%c%c", IGT_FORMAT_ARGS_CODE(pr=
imary->formats[k]))
> > =

> > We have a igt_format_str() which is probably better for stuff like this.
> > =

> =

> Thanks ville for pointing that out
> I tried using igt_format_str()
> but it doesn't seem to support that i tried it like below
> =

> igt_dynamic_f("%s",igt_format_str("testing-format-%c%c%c%c",
> 				  IGT_FORMAT_ARGS_CODE(primary->formats[k]))

I don't know what you're trying to do there.

igt_dynamic_f("testing-format-%s", igt_format_str(format))
or whatever.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
