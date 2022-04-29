Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AA810ECBF
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 13:01:46 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id l19so10442611ljb.7
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 06:01:46 -0700 (PDT)
Date: Fri, 29 Apr 2022 16:01:41 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Message-ID: <20220429160141.0c9a394b@eldfell>
In-Reply-To: <20220328145509.2331195-9-maxime@cerno.tech>
References: <20220328145509.2331195-1-maxime@cerno.tech>
 <20220328145509.2331195-9-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HMCI4Ff1yBa7k1.diJYAENl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Subject: Re: [igt-dev] [PATCH i-g-t v2 8/8] tests/kms_writeback: Use a
 garbage X value to create fill our test buffer
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

--Sig_/HMCI4Ff1yBa7k1.diJYAENl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 28 Mar 2022 16:55:09 +0200
Maxime Ripard <maxime@cerno.tech> wrote:

> Since we use buffers in XRGB8888, whatever value we have in X should be
> ignored by the drivers and the hardware. However, since we always use
> 0xff in our test, whether that is the case or not cannot be determined.
>=20
> Let's use a garbage value (but consistent across test runs) to make sure
> it doesn't have any impact on the writeback output.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Yup, this is definitely a good idea.

I proposed to do the same in VKMS when writing out to XRGB writeback
buffer after blending, but Igor had the same problem as you with IGT. I
hope this series solves it.


Thanks,
pq

> ---
>  tests/kms_writeback.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 2366692865b7..4efd99713479 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -293,7 +293,7 @@ static void writeback_sequence(igt_output_t *output, =
igt_plane_t *plane,
>  				igt_fb_t *in_fb, igt_fb_t *out_fbs[], int n_commits)
>  {
>  	int i =3D 0;
> -	uint32_t in_fb_colors[2] =3D { 0xffff0000, 0xff00ff00 };
> +	uint32_t in_fb_colors[2] =3D { 0x42ff0000, 0x4200ff00 };
>  	uint32_t clear_color =3D 0xffffffff;
> =20
>  	igt_crc_t cleared_crc, out_expected;


--Sig_/HMCI4Ff1yBa7k1.diJYAENl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJr4bUACgkQI1/ltBGq
qqdYjBAArVGIhmpzue1Um3tU4hrAsarqEUtM6WLFypgUX0cP+yycI0/enTowGPh3
3NozsRN8iUNmZs4pg/O4Hl7CEbs9cYoHgWMDkzY/7aYchcXYJNoJQ10GrkDyG+y8
4uFQXTCA13+odC69ndgPE9YFy/+KySv9NkjSYfIutg6rR1dSLN50cJ3s1YmLuaJs
+AI23s5FwLviKXS1365GmVm5WRdZ5IUqzmLY8V3g0dzAmBAngli8P6rPUXnI2CMr
1IBHi7g88mZl3jLNwUWystVbtkzXcWbELHD47HYEEYbsk0wbla320Sr97h1771AL
V/1rjUSxzaCVWK2ZtJFPdJIU/koo/rMVPaXsxsblPHt16aqSTfNpwnEDBZVsgGCH
Zwg9dLknSXbMASU240/lHPKkGGBRihjsqkGh0NeVXHRfyL6E7AIJikhD70qvai9m
0QqLLRLxRIRg7i0yB9xyXGRLlKv3Sj9zlj5yAGy+uLbJYspejvSTEXnnXOHB+dHF
cQtPMFMMym/Jd+WdxQ4ow2tA/b4fy+UzOnQZQl5gZriv55gDm2mESCkFbPePGplC
+AfkS2hozZKC+cDY6C7ggVqkG1TkKDkihJTJpRIswLYtadfECDULkhBeaEp2cqjs
mvgmB1Py6qEBjXRKxuuHaXB8nMCBWKcIc5Z9PPXO/tLZocvlC4g=
=goCM
-----END PGP SIGNATURE-----

--Sig_/HMCI4Ff1yBa7k1.diJYAENl--
