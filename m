Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4316E10E8AE
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jan 2024 09:20:32 +0000 (UTC)
Date: Thu, 11 Jan 2024 11:20:28 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH i-g-t 3/4] tests/kms_atomic: Add solid fill plane subtest
Message-ID: <20240111112028.36736525.pekka.paalanen@collabora.com>
In-Reply-To: <6c910eb7-5f4b-4b03-ae3c-ca0498f0c667@quicinc.com>
References: <20231215-solid-fill-v1-0-12932f9f452d@quicinc.com>
 <20231215-solid-fill-v1-3-12932f9f452d@quicinc.com>
 <20231218121247.454bc00a.pekka.paalanen@collabora.com>
 <6c910eb7-5f4b-4b03-ae3c-ca0498f0c667@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZN93P6e4rln4UOruNdaMzeh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Simon Ser <contact@emersion.fr>, igt-dev@lists.freedesktop.org, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--Sig_/ZN93P6e4rln4UOruNdaMzeh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 21 Dec 2023 15:57:51 -0800
Jessica Zhang <quic_jesszhan@quicinc.com> wrote:

> On 12/18/2023 2:12 AM, Pekka Paalanen wrote:
> > On Fri, 15 Dec 2023 16:40:23 -0800
> > Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >  =20
> >> Add a basic test for solid fill planes.
> >>
> >> This test will first commit a single-color framebuffer plane then
> >> a solid fill plane with the same contents. It then validates the solid
> >> fill plane by comparing the resulting CRC with the CRC of the reference
> >> framebuffer commit.
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   tests/kms_atomic.c | 94 ++++++++++++++++++++++++++++++++++++++++++++=
++++++++++
> >>   1 file changed, 94 insertions(+)
> >>
> >> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> >> old mode 100644
> >> new mode 100755
> >> index 2b6e9a8f0383..8f81e65ad84f
> >> --- a/tests/kms_atomic.c
> >> +++ b/tests/kms_atomic.c
> >> @@ -128,6 +128,13 @@ enum kms_atomic_check_relax {
> >>   	PLANE_RELAX_FB =3D (1 << 1)
> >>   };
> >>  =20
> >> +struct solid_fill_blob {
> >> +	uint32_t r;
> >> +	uint32_t g;
> >> +	uint32_t b;
> >> +	uint32_t pad;
> >> +};
> >> +
> >>   static inline int damage_rect_width(struct drm_mode_rect *r)
> >>   {
> >>   	return r->x2 - r->x1;
> >> @@ -1322,6 +1329,79 @@ static void atomic_plane_damage(data_t *data)
> >>   	igt_remove_fb(data->drm_fd, &fb_2);
> >>   }
> >>  =20
> >> +static void test_solid_fill_plane(data_t *data, igt_output_t *output,=
  igt_plane_t *plane)
> >> +{
> >> +	struct drm_mode_create_blob c;
> >> +	struct drm_mode_destroy_blob d;
> >> +	drmModeModeInfo *mode =3D igt_output_get_mode(output);
> >> +	struct drm_mode_rect rect =3D { 0 };
> >> +	struct igt_fb ref_fb;
> >> +	igt_pipe_crc_t *pipe_crc;
> >> +	igt_crc_t ref_crc, new_crc;
> >> +	enum pipe pipe =3D data->pipe->pipe;
> >> +	int height, width;
> >> +	int ret;
> >> +
> >> +	struct solid_fill_blob blob_data =3D {
> >> +		.r =3D 0x00000000,
> >> +		.g =3D 0x00000000,
> >> +		.b =3D 0xff000000,
> >> +		.pad =3D 0x0,
> >> +	}; =20
> >=20
> > Hi Jessica!
> >=20
> > This is the blob sent to KMS as the solid fill color...
> >=20
> > ...
> >  =20
> >> +	igt_create_color_fb(data->drm_fd, width, height,
> >> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> >> +			    0.0, 0.0, 1.0, &ref_fb); =20
> >=20
> > ..and this (0.0, 0.0, 1.0) is the corresponding color in normalized
> > values, I presume.
> >=20
> > So you say that 0xff000000 =3D 1.0.
> >=20
> > However, the patch for the kernel UAPI header says this:
> >=20
> > +/**
> > + * struct drm_mode_solid_fill - User info for solid fill planes
> > + *
> > + * This is the userspace API solid fill information structure.
> > + *
> > + * Userspace can enable solid fill planes by assigning the plane "soli=
d_fill"
> > + * property to a blob containing a single drm_mode_solid_fill struct p=
opulated with an RGB323232
> > + * color and setting the pixel source to "SOLID_FILL".
> > + *
> > + * For information on the plane property, see drm_plane_create_solid_f=
ill_property()
> > + *
> > + * @r: Red color value of single pixel
> > + * @g: Green color value of single pixel
> > + * @b: Blue color value of single pixel
> > + * @pad: padding, must be zero
> > + */
> > +struct drm_mode_solid_fill {
> > +	__u32 r;
> > +	__u32 g;
> > +	__u32 b;
> > +	__u32 pad;
> > +};
> >=20
> > I assume that RGB323232 means unsigned 32-bit UNORM (Vulkan term)
> > format. That means 1.0 is 0xffffffff, not 0xff000000. This looks like a
> > bug in the test. =20
>=20
> Hey Pekka,
>=20
> Ah, thanks for catching this -- I'll change the blob value to 0xffffffff=
=20
> so it matches the 1.0.
>=20
> While we're talking about the UAPI struct, I'll also add the actual=20
> drm_mode_solid_fill struct to the IGT drm-uapi instead of the current=20
> workaround.
>=20
> >=20
> > It would be good to test more than one color:
> > - 0.0, 0.0, 0.0
> > - 1.0, 0.0, 0.0
> > - 0.0, 1.0, 0.0
> > - 0.0, 0.0, 1.0
> > - 1.0, 1.0, 1.0 =20
>=20
> Sounds good, will change the test to validate these combinations.
>=20
> >=20
> > for example. That would get at least the so often used black explicitly
> > tested, and verify each channel gets mapped correctly rather than only
> > blue.
> >=20
> > It would also be really good to test dim and mid grays, but I assume it
> > might be difficult to get CRC to match over various hardware. You'd
> > need to use writeback with an error tolerance. (For watching photos for
> > example, the background is not usually black but dim gray I believe.) =
=20
>=20
> Got it, we can add this to the list of colors to test.
>=20
> FWIW, I think as long as we keep the test structure as grabbing a=20
> reference CRC from an FB commit then comparing that to a CRC from a=20
> solid fill commit, I'm not expecting a difference in CRC values.

The worry I had here, is that different hardware may have different
precision for the solid fill. Maybe that can be worked around by
computing the solid fill blob values from the raw FB pixel values? Then
even if something gets rounded/truncated somewhere in the hardware, the
end result should be the same between FB and solid fill, right?

Unless, the hardware precision on solid fill values is less than FB
pixel precision, and the CRC input precision is high enough to show
that difference.


Thanks,
pq

--Sig_/ZN93P6e4rln4UOruNdaMzeh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmWfstwACgkQI1/ltBGq
qqcyyw/+L/ZwwfH9PwGpS54b85VCXqQOZNDB31eLzaRwtGVA/6uFdsfxvipKyaDD
utlNS23orCqEjwt6/a+SUuQ5ztWZRWzB4OUDsTp7Cd2ByhdAMBJnZcwWDVLVa//F
sDVPa+wPLhs2VDPxKBNqFCwvfOQL/FB8iY1CuoBuwj5nFkkNYM3FcgWq/GPEdRjD
DoGFasgXXmzVnNnIjfZ+dtwpiMy3hWep7D78GOf/TC2yFR0iGKreSjS7MiH3Z9mV
R4sYmQ8wwqxUOb71hvT9Si7hQcrYutpi4b31WGkVsBy/dtlVL/TEEHk8vKCylU/m
g5Kij3ZxySlSjFMx04jJ/N0X0L0iOcZD47wh8ceG1lzHslE5JPl6YZYqF7/o1D26
G3o5Jr8iCPHPv930Zi9K6SSOOvpY1MODCqXdRVc9G8FoQLreJU5i1o740zau/kMD
u9GHU2r8hY+w30G+YadGM5iGmHSZOljfMNAczaj0iwNwSgt0F+dPNd7skE7TFgi7
3SMaqTOziE4Q+WHsKuM4FVSGyhycTlsrRNaiK2VEicywVONIXncT5iE+n2d5Y3LQ
pSI8O1PnL6V6VZAht+YWKgRksd8Biyk4lGTG6jae9EMA+6lxDLkZmd//PZp5eteg
PWUylcse4v6O0Idh7LZzbR1bDTUuLVdb9U28ASQ1yhUj/3HETEw=
=hCn9
-----END PGP SIGNATURE-----

--Sig_/ZN93P6e4rln4UOruNdaMzeh--
