Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F0210EC81
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 12:58:34 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id j4so13881932lfh.8
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 05:58:34 -0700 (PDT)
Date: Fri, 29 Apr 2022 15:58:29 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Message-ID: <20220429155829.71bd6eae@eldfell>
In-Reply-To: <20220328145509.2331195-8-maxime@cerno.tech>
References: <20220328145509.2331195-1-maxime@cerno.tech>
 <20220328145509.2331195-8-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ud6U_TAphm=FqhnHX+srGLq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Subject: Re: [igt-dev] [PATCH i-g-t v2 7/8] lib/igt_fb: Ignore the X
 component when computing CRC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--Sig_/ud6U_TAphm=FqhnHX+srGLq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 28 Mar 2022 16:55:08 +0200
Maxime Ripard <maxime@cerno.tech> wrote:

> The igt_fb_get_fnv1a_crc() function will compute a FNV-1a hash over the
> content of the framebuffer. The sole user of this function is the
> writeback test suite, which will use it to compare an XRGB8888 buffer
> used in input to an XRGB8888 buffer filled by the writeback connector.
>=20
> However, that function uses each bytes of each buffers to compute the
> hash, and therefore the writeback code assumes that the hardware will
> preserve the content of the X component through the writeback pipeline,
> which isn't true for all hardware. VC4 doesn't for example.
>=20
> Since that function is only ever used for XRGB8888 buffers, let's just
> set the most significant to 0 (which is the X padding) for each pixel
> when computing the hash, and thus ignore whatever the hardware will
> return here.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Yes, this is absolutely a requirement when handling any pixel format
with X-channel.


Thanks,
pq

> ---
>  lib/igt_fb.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index eafbe7fd41cd..66c52bb83876 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -4392,15 +4392,19 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_c=
rc_t *crc)
>  {
>  	const uint32_t FNV1a_OFFSET_BIAS =3D 2166136261;
>  	const uint32_t FNV1a_PRIME =3D 16777619;
> +	uint32_t *line =3D NULL;
>  	uint32_t hash;
>  	void *map;
> -	char *ptr, *line =3D NULL;
> +	char *ptr;
>  	int x, y, cpp =3D igt_drm_format_to_bpp(fb->drm_format) / 8;
>  	uint32_t stride =3D calc_plane_stride(fb, 0);
> =20
>  	if (fb->num_planes !=3D 1)
>  		return -EINVAL;
> =20
> +	if (fb->drm_format !=3D DRM_FORMAT_XRGB8888)
> +		return -EINVAL;
> +
>  	ptr =3D igt_fb_map_buffer(fb->fd, fb);
>  	igt_assert(ptr);
>  	map =3D ptr;
> @@ -4422,9 +4426,17 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_cr=
c_t *crc)
> =20
>  		igt_memcpy_from_wc(line, ptr, fb->width * cpp);
> =20
> -		for (x =3D 0; x < fb->width * cpp; x++) {
> -			hash ^=3D line[x];
> -			hash *=3D FNV1a_PRIME;
> +		for (x =3D 0; x < fb->width; x++) {
> +			unsigned int i;
> +			uint32_t pixel =3D le32_to_cpu(line[x]);
> +			pixel &=3D 0x00ffffff;
> +
> +			for (i =3D 0; i < sizeof(pixel); i++) {
> +				uint8_t component =3D (pixel >> (i * 8)) & 0xff;
> +
> +				hash ^=3D component;
> +				hash *=3D FNV1a_PRIME;
> +			}
>  		}
>  	}
> =20


--Sig_/ud6U_TAphm=FqhnHX+srGLq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJr4PUACgkQI1/ltBGq
qqfVEhAAkuJNxQOHKfBXgidniVG/IMHEyuAleUjnos6soMJ/K3FbXWY0iCe/oT2o
IujjIeow+1poK3TDIrQNwqt7R7Nbg1iQaUeJNi/wg7L2yoyrNU4yjGE8yVMHmIIx
LEiSrU98U3/eDlswfZUg1/AJEPD2e01YAAcbjyddbWfJXvrirTCTpe2Pns3PA32W
eot3tl6Su4YFxF5blC9JhcLlZVQO+C6NF5P8d5Mf3z7HAPw3LiZhw+LzN9+dlv8F
amHlqwpscTdA1miklWGirYQ5CvVbzC2Hcm7kob/E7bZiV3xtP/zAH13HgyFOtHS0
qRHDbh3bDgj9xFifcTk1OS8RGElud2xYxCddozmNixCw9Az7J3IXzDyeOdiWOHSU
T05GpRR8bzSz2yeaFvatcY8ntjqQPkJ15X2uUhwyYj6oxwErogsy3O9BB4og6ljE
d2nAhvDzb+gLy4sQTpzQSdlWxg3WJX8HJ/MNeZSXsxPcmdrV2DbCtdGSzG9elTlc
kSgrxXojKG7wEXQuZPV7cjPWDc+ZlusNjLi6kP0l+HlXPGtLxWDLEgvWpvyJITx7
WShrphfuohwSN9HTPsi79QN2doFy2loItwj1iiLxTmS3f5TD/28mTBkcLTD2fxfp
7Hokw+qmu5vjQewS26EROx5UCV+vLnQM6vLouLj2JRbt1BFtIhQ=
=a2oN
-----END PGP SIGNATURE-----

--Sig_/ud6U_TAphm=FqhnHX+srGLq--
