Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5796E8A2
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Sep 2021 15:18:50 +0000 (UTC)
Date: Fri, 3 Sep 2021 18:18:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YTI811aPfzHitaTx@intel.com>
References: <20210514132643.30709-1-ville.syrjala@linux.intel.com>
 <20210514132643.30709-5-ville.syrjala@linux.intel.com>
 <DM8PR11MB571915B618E4E7421425C6E78DCF9@DM8PR11MB5719.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <DM8PR11MB571915B618E4E7421425C6E78DCF9@DM8PR11MB5719.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] tests/kms_color: Add GAMMA_LUT_3D
 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 03, 2021 at 05:05:03AM +0000, Modem, Bhanuprakash wrote:
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Ville
> > Syrjala
> > Sent: Friday, May 14, 2021 6:57 PM
> > To: igt-dev@lists.freedesktop.org
> > Subject: [igt-dev] [PATCH i-g-t 4/4] tests/kms_color: Add GAMMA_LUT_3D =
tests
> >=20
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >=20
> > Add some basic tests for 3D LUTs.
> >=20
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  tests/kms_color.c        | 95 ++++++++++++++++++++++++++++++++++++++++
> >  tests/kms_color_helper.c | 58 +++++++++++++++++++++++-
> >  tests/kms_color_helper.h | 18 ++++++++
> >  3 files changed, 170 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/tests/kms_color.c b/tests/kms_color.c
> > index 3a42532a5c27..e23e5f5fcc26 100644
> > --- a/tests/kms_color.c
> > +++ b/tests/kms_color.c
> > @@ -198,6 +198,88 @@ static void test_pipe_gamma(data_t *data,
> >  	free_lut(gamma_full);
> >  }
> >=20
> > +static void test_pipe_gamma_lut_3d(data_t *data,
> > +				   igt_plane_t *primary)
> > +{
> > +	igt_output_t *output;
> > +	igt_display_t *display =3D &data->display;
> > +	gamma_lut_t *gamma_lut_3d_linear, *gamma_lut_3d_full;
> > +	color_t red_green_blue[] =3D {
> > +		{ 1.0, 0.0, 0.0 },
> > +		{ 0.0, 1.0, 0.0 },
> > +		{ 0.0, 0.0, 1.0 }
> > +	};
> > +
> > +	igt_require(igt_pipe_obj_has_prop(primary->pipe,
> > IGT_CRTC_GAMMA_LUT_3D));
> > +
> > +	gamma_lut_3d_linear =3D generate_lut_3d(data->gamma_lut_3d_size, 1.0);
> > +	gamma_lut_3d_full =3D generate_lut_3d_max(data->gamma_lut_3d_size);
> > +
> > +	for_each_valid_output_on_pipe(&data->display, primary->pipe->pipe,
> > output) {
>=20
> Instead of running the test on all possible "pipe-connector" combinations,
> I think it is sufficient to run on single connector, since we are trying =
to
> validate PIPE properties. Also we can save some CI time.
>=20
> I am also thinking to revamp all color tests to run on single connector.

Yeah, the connector shouldn't matter here. Any single one will do.

<snip>
> > +		igt_plane_set_fb(primary, &fb);
> > +		igt_display_commit(&data->display);
> > +		igt_wait_for_vblank(data->drm_fd,
> > +				    display->pipes[primary->pipe->pipe].crtc_offset);
> > +		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
> > +
> > +		/* Draw a gradient with 3D LUT to remap all
> > +		 * values to max red/green/blue.
> > +		 */
> > +		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
> > +		igt_plane_set_fb(primary, &fb);
> > +		set_gamma_lut_3d(data, primary->pipe, gamma_lut_3d_full);
> > +		igt_display_commit(&data->display);
> > +		igt_wait_for_vblank(data->drm_fd,
> > +				    display->pipes[primary->pipe->pipe].crtc_offset);
> > +		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fulllut3d);
> > +
> > +		/* Verify that the CRC of the software computed output is
> > +		 * equal to the CRC of the degamma LUT transformation output.
> =20
> Typo: s/degamma/3dlut/
>=20
> So, is this the expectation?
> ((Solid colors + no 3dlut) =3D=3D (gradient colors + 3dlut)) ? PASS : FAI=
L;

IIRC yes.

<snip>
> > diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
> > index 3f49e7cae4c0..e21adaa228ff 100644
> > --- a/tests/kms_color_helper.h
> > +++ b/tests/kms_color_helper.h
> > @@ -52,6 +52,7 @@ typedef struct {
> >  	uint32_t color_depth;
> >  	uint64_t degamma_lut_size;
> >  	uint64_t gamma_lut_size;
> > +	uint64_t gamma_lut_3d_size;
>=20
> Maybe rename to gamma_3d_lut_size?

I wanted to be consistent with the naming everywhere, and because you
can't have things named "3d_lut" in C I went with the "lut_3d" order
for everything.

--=20
Ville Syrj=E4l=E4
Intel
