Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 21 Apr 2020 17:07:05 -0400
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20200421210705.igifp4zckhxxmlll@smtp.gmail.com>
References: <20191022010032.pgqop52v4gz5omlc@smtp.gmail.com>
 <20200415094533.teqmhp7hoz5hbllw@gilmour.lan>
MIME-Version: 1.0
In-Reply-To: <20200415094533.teqmhp7hoz5hbllw@gilmour.lan>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH v7 i-g-t 4/4] kms_writeback: Add
 writeback-check-output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0322808822=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Petri Latvala <petri.latvala@intel.com>, Simon Ser <contact@emersion.fr>, intel-gfx@lists.freedesktop.org, Liviu Dudau <Liviu.Dudau@arm.com>, igt-dev@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, nd <nd@arm.com>, Brian Starkey <Brian.Starkey@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0322808822==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o426swedp6k7oyhk"
Content-Disposition: inline


--o426swedp6k7oyhk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 04/15, Maxime Ripard wrote:
> Hi!
>=20
> On Mon, Oct 21, 2019 at 10:00:39PM -0300, Brian Starkey wrote:
> > Add a test which makes commits using the writeback connector, and
> > checks the output buffer hash to make sure it is/isn't written as
> > appropriate.
> >
> > V6: Simon Ser
> >  - Add igt documentation with igt_describe
> >  - Replace int ret by unsigned int fd_id when calling igt_create_fb
> >  - Add a descriptive error message if sync_fence_wait fail
> >  - Replace color_idx variable by i
> >  - Use in_fb instead of out_fb for getting the expected CRC
> >  - Drop unnecessary parentheses
> >  - Replace igt_fb_mod_to_tiling to DRM_FORMAT_MOD_LINEAR
> >
> > Signed-off-by: Brian Starkey <brian.starkey@arm.com>
> > [rebased and updated the patch to address feedback]
> > Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > ---
> >  tests/kms_writeback.c | 123 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 123 insertions(+)
> >
> > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> > index a373ec4d..068595b9 100644
> > --- a/tests/kms_writeback.c
> > +++ b/tests/kms_writeback.c
> > @@ -30,6 +30,7 @@
> >  #include "igt.h"
> >  #include "igt_core.h"
> >  #include "igt_fb.h"
> > +#include "sw_sync.h"
> >
> >  IGT_TEST_DESCRIPTION("Exercise writeback feature.");
> >
> > @@ -196,6 +197,115 @@ static void writeback_test_fb(igt_output_t *outpu=
t, igt_fb_t *valid_fb, igt_fb_t
> >  	igt_assert(ret =3D=3D -EINVAL);
> >  }
> >
> > +static void fill_fb(igt_fb_t *fb, double color[3])
> > +{
> > +	cairo_t *cr =3D igt_get_cairo_ctx(fb->fd, fb);
> > +	igt_assert(cr);
> > +
> > +	igt_paint_color(cr, 0, 0, fb->width, fb->height,
> > +			color[0], color[1], color[2]);
> > +}
> > +
>=20
> On which platform did you test this? On Arm (but I would assume
> anything !i915), this will fire up an assert.
>=20
> I've replaced this with a igt_fb_map_buffer/memset, and it works as
> expected.

Hi,

Could you share your fix for this issue? Since you already have a
solution that you know that works on ARM, I can just use it for avoiding
an unnecessary round of review in the next version.

Thanks
=20
> Maxime



--=20
Rodrigo Siqueira
https://siqueira.tech

--o426swedp6k7oyhk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl6fYHQACgkQWJzP/com
vP/RMg/+Pvcqn5tBfcF9zZGAs0ytSXqZWo/06QYONUM3naapkl9g1SIPFTVR87dD
CzUr0flJY1SyDbGVEiCZ52cYRd2eSZO1iQL6sNN90VGiPtvUJWS2MPxteVTanmhk
SzCTI69PPf3IgUpc4s6cZIGxEGI0rl8oQIcLhGa+2L/bqSWim54sdD4qdLRZL6Z2
QdFy5o10+s4Zu2J34LWw96vFVF4ihy9ARG2jZsLj9tyKPJRQxWkba9URdK5oysKK
tneBCtJk+tNrUira4+gXlVJHbtHWqlCYyPWQ8ysCnQxIpBCFB1aRfmK+y/aIcas9
8tnS1mBCRREEKZmmRwFKGp6ltkA0m4Ax9bFgq+yPfP4AnnQo4SbcHyW8yYJjgCxe
Os8iUAYSypmSgnjcS0i/oo3Sqab5qZzlqf355mrZrM6u0oDF8K8A7RGobiVUY9Cy
ke/BXyvnNe4tr4L/xdAd/jdtHSyk1R3iEvj3xHWZbaMtSQI3fAUQN5XNIUAjn2RR
WdozGMPydruFdE8271GN6FkKk7+7+kaz7G+An5BNJTUuK+r+I6X3wwJmuBYw5cF2
qdmGZAz14SFDSy+qtyOZBt58MnHuw/6xgHoLAldfjQrSbhpKKSisppasZluz0hp/
KIf8Xwom1ngpY7X1wjNwhtpO5rikNIuk+O3mhbp98W1kQcl6exE=
=xqLB
-----END PGP SIGNATURE-----

--o426swedp6k7oyhk--

--===============0322808822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0322808822==--
