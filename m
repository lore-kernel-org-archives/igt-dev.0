Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 23 Apr 2020 08:04:51 -0400
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20200423120451.7sd2qkszjtbjfjoh@smtp.gmail.com>
References: <20191022010032.pgqop52v4gz5omlc@smtp.gmail.com>
 <20200415094533.teqmhp7hoz5hbllw@gilmour.lan>
 <20200421210705.igifp4zckhxxmlll@smtp.gmail.com>
 <20200422180301.kvvrbhq4j33q6mb6@gilmour.lan>
MIME-Version: 1.0
In-Reply-To: <20200422180301.kvvrbhq4j33q6mb6@gilmour.lan>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH v7 i-g-t 4/4] kms_writeback: Add
 writeback-check-output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0365595534=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Petri Latvala <petri.latvala@intel.com>, Simon Ser <contact@emersion.fr>, intel-gfx@lists.freedesktop.org, Liviu Dudau <Liviu.Dudau@arm.com>, igt-dev@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, nd <nd@arm.com>, Brian Starkey <Brian.Starkey@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0365595534==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lpivh4e5kdpcvdcu"
Content-Disposition: inline


--lpivh4e5kdpcvdcu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 04/22, Maxime Ripard wrote:
> Hi!
>=20
> On Tue, Apr 21, 2020 at 05:07:05PM -0400, Rodrigo Siqueira wrote:
> > On 04/15, Maxime Ripard wrote:
> > > On Mon, Oct 21, 2019 at 10:00:39PM -0300, Brian Starkey wrote:
> > > > Add a test which makes commits using the writeback connector, and
> > > > checks the output buffer hash to make sure it is/isn't written as
> > > > appropriate.
> > > >
> > > > V6: Simon Ser
> > > >  - Add igt documentation with igt_describe
> > > >  - Replace int ret by unsigned int fd_id when calling igt_create_fb
> > > >  - Add a descriptive error message if sync_fence_wait fail
> > > >  - Replace color_idx variable by i
> > > >  - Use in_fb instead of out_fb for getting the expected CRC
> > > >  - Drop unnecessary parentheses
> > > >  - Replace igt_fb_mod_to_tiling to DRM_FORMAT_MOD_LINEAR
> > > >
> > > > Signed-off-by: Brian Starkey <brian.starkey@arm.com>
> > > > [rebased and updated the patch to address feedback]
> > > > Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > > ---
> > > >  tests/kms_writeback.c | 123 ++++++++++++++++++++++++++++++++++++++=
++++
> > > >  1 file changed, 123 insertions(+)
> > > >
> > > > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> > > > index a373ec4d..068595b9 100644
> > > > --- a/tests/kms_writeback.c
> > > > +++ b/tests/kms_writeback.c
> > > > @@ -30,6 +30,7 @@
> > > >  #include "igt.h"
> > > >  #include "igt_core.h"
> > > >  #include "igt_fb.h"
> > > > +#include "sw_sync.h"
> > > >
> > > >  IGT_TEST_DESCRIPTION("Exercise writeback feature.");
> > > >
> > > > @@ -196,6 +197,115 @@ static void writeback_test_fb(igt_output_t *o=
utput, igt_fb_t *valid_fb, igt_fb_t
> > > >  	igt_assert(ret =3D=3D -EINVAL);
> > > >  }
> > > >
> > > > +static void fill_fb(igt_fb_t *fb, double color[3])
> > > > +{
> > > > +	cairo_t *cr =3D igt_get_cairo_ctx(fb->fd, fb);
> > > > +	igt_assert(cr);
> > > > +
> > > > +	igt_paint_color(cr, 0, 0, fb->width, fb->height,
> > > > +			color[0], color[1], color[2]);
> > > > +}
> > > > +
> > >=20
> > > On which platform did you test this? On Arm (but I would assume
> > > anything !i915), this will fire up an assert.
> > >=20
> > > I've replaced this with a igt_fb_map_buffer/memset, and it works as
> > > expected.
> >
> > Could you share your fix for this issue? Since you already have a
> > solution that you know that works on ARM, I can just use it for avoiding
> > an unnecessary round of review in the next version.
>=20
> Sure, you'll find it attached

Thanks!

I'm going to submit a new version today.

Best Regards
=20
> Maxime

> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 97a656c8..be825220 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -3812,12 +3812,9 @@ int igt_fb_get_crc(struct igt_fb *fb, igt_crc_t *c=
rc)
>  	if (fb->num_planes !=3D 1)
>  		return -EINVAL;
> =20
> -	if (fb->is_dumb)
> -		ptr =3D kmstest_dumb_map_buffer(fb->fd, fb->gem_handle, fb->size,
> -					      PROT_READ);
> -	else
> -		ptr =3D gem_mmap__gtt(fb->fd, fb->gem_handle, fb->size,
> -				    PROT_READ);
> +	ptr =3D igt_fb_map_buffer(fb->fd, fb);
> +	igt_assert(ptr);
> +	map =3D ptr;
> =20
>  	/*
>  	 * Framebuffers are often uncached, which can make byte-wise accesses
> @@ -3846,7 +3843,7 @@ int igt_fb_get_crc(struct igt_fb *fb, igt_crc_t *cr=
c)
>  	crc->crc[0] =3D hash;
> =20
>  	free(line);
> -	munmap(map, fb->size);
> +	igt_fb_unmap_buffer(fb, map);
> =20
>  	return 0;
>  #undef FNV1a_OFFSET_BIAS
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 068595b9..c2ee05dd 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -149,7 +149,7 @@ static int do_writeback_test(igt_output_t *output, ui=
nt32_t fb_id,
> =20
>  	igt_output_set_prop_value(output, IGT_CONNECTOR_CRTC_ID, config->crtc->=
crtc_id);
>  	igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_FB_ID, fb_id);
> -	igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR=
, (uint64_t)out_fence_ptr);
> +	igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR=
, (uint64_t)(uintptr_t)out_fence_ptr);
> =20
>  	if (ptr_valid)
>  		*out_fence_ptr =3D 0;
> @@ -197,13 +197,18 @@ static void writeback_test_fb(igt_output_t *output,=
 igt_fb_t *valid_fb, igt_fb_t
>  	igt_assert(ret =3D=3D -EINVAL);
>  }
> =20
> -static void fill_fb(igt_fb_t *fb, double color[3])
> +static void fill_fb(igt_fb_t *fb, uint32_t pixel)
>  {
> -	cairo_t *cr =3D igt_get_cairo_ctx(fb->fd, fb);
> -	igt_assert(cr);
> +	void *ptr;
> =20
> -	igt_paint_color(cr, 0, 0, fb->width, fb->height,
> -			color[0], color[1], color[2]);
> +	igt_assert(fb->drm_format =3D=3D DRM_FORMAT_XRGB8888);
> +
> +	ptr =3D igt_fb_map_buffer(fb->fd, fb);
> +	igt_assert(ptr);
> +
> +	memset(ptr, pixel, fb->strides[0] * fb->height);=20
> +
> +	igt_fb_unmap_buffer(fb, ptr);
>  }
> =20
>  static void get_and_wait_out_fence(igt_output_t *output)
> @@ -222,11 +227,8 @@ static void writeback_sequence(igt_output_t *output,=
 igt_plane_t *plane,
>  				igt_fb_t *in_fb, igt_fb_t *out_fbs[], int n_commits)
>  {
>  	int i;
> -	double in_fb_colors[2][3] =3D {
> -		{ 1.0, 0.0, 0.0 },
> -		{ 0.0, 1.0, 0.0 },
> -	};
> -	double clear_color[3] =3D { 1.0, 1.0, 1.0 };
> +	uint32_t in_fb_colors[2] =3D { 0xffff0000, 0xff00ff00 };
> +	uint32_t clear_color =3D 0xffffffff;
>  	igt_crc_t cleared_crc, out_expected;
> =20
>  	for (i =3D 0; i < n_commits; i++) {


--=20
Rodrigo Siqueira
https://siqueira.tech

--lpivh4e5kdpcvdcu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl6hhF4ACgkQWJzP/com
vP8Lpg//bh1himKlDOnRdazQPimguB2ElLyW8jICEfkDeshSW+6FCZthKgaajGJj
88zxKTJECjGbsNp6Mw4LGZplKwxUMMWS5LGfPc9cDiB5C/bpRTAZgV+wfRV6usKB
ywf+t8LNPtDlUcr0FvPo27G9pBcK86pWRyKxFMybjnTiwrFwKkYWENlZdC5VJIMj
Yc8xjKQ/uV79oBFntHR74ZxAYwbFbC39oLSNU3RjSUWKZQ7gZ/5zWxPR8MJrdedA
0dUpEesc77M5yqEZg+r9zp3MP7bWekc2FQ10EiFV9vYAaO9HFC8kZaAVZExHCJ3/
g2fS2CanIlQL58u5xftfxZRgSLmKUBcEX+s8/qVn2pO0LWJMvE7moYN9LLqlKZr/
PwIIqcbai07PaH796TQpStCXXt7o4nf/ldZe8IYLADQgf46mpLQNKoh5B8aPqCCt
dNRfRzis+F8vpfYT8xhY08CAEoTbcu8nBBAI9tln79je4uaL6Ha/tzmeoapCKjQW
YYrVjtTt7HcsjepMRkVjaXQeX27D1/FKgM2MLKO+7p23oRvsrTihE51eRCoCRwa8
3KMpq2v/X/CZXBCvyXpnNlI7EfU4nbjllYOi6IDfr8Ios6J2EkQUAyx7DR/hmw5k
a3uajxrbBz5QManqTatvbfu+7n9byu+SRlHUZAbJPtd+Ln8/QXY=
=6QNw
-----END PGP SIGNATURE-----

--lpivh4e5kdpcvdcu--

--===============0365595534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0365595534==--
