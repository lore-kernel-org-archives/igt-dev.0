Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE04D6EE88
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 23:00:05 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id o18so217985qvf.1
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 15:00:05 -0800 (PST)
Date: Thu, 20 Feb 2020 18:00:03 -0500
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20200220230003.h5oazrkquozu4zh4@smtp.gmail.com>
References: <20200220013336.1979-1-gabrielabittencourt00@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200220013336.1979-1-gabrielabittencourt00@gmail.com>
Subject: Re: [igt-dev] [PATCH] lib/igt_fb: Elimine repetitive verification
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1965394888=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Cc: lkcamp@listslibreplanetbr.org, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1965394888==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2ci7zscsz2w7mye6"
Content-Disposition: inline


--2ci7zscsz2w7mye6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Gabriela,

Lgtm

Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

Thanks for the patch :)

On 02/19, Gabriela Bittencourt wrote:
> Clean return function by elimine repetitive verification on return
> functions. The function is_ccs_modifier returns true either if fb->modifi=
er
> is equals I915_FORMAT_MOD_Y_TILED or I915_FORMAT_MOD_Yf_TILED. What makes
> possible to eliminate this verification on the return of the function:
> use_enginecopy. The function blitter_ok returns false whenever
> is_ccs_modifier returns true, so it's possible to eliminate the
> fb->modifier verifications on use_blitter also.
>=20
> Signed-off-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
> ---
>  lib/igt_fb.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 0c4fdc5d..34a91320 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2026,21 +2026,14 @@ static bool blitter_ok(const struct igt_fb *fb)
> =20
>  static bool use_enginecopy(const struct igt_fb *fb)
>  {
> -	if (blitter_ok(fb))
> -		return false;
> -
> -	return fb->modifier =3D=3D I915_FORMAT_MOD_Yf_TILED ||
> -	       is_ccs_modifier(fb->modifier) ||
> -	       !gem_has_mappable_ggtt(fb->fd);
> +	return !blitter_ok(fb) &&
> +	       (is_ccs_modifier(fb->modifier) ||
> +		!gem_has_mappable_ggtt(fb->fd));
>  }
> =20
>  static bool use_blitter(const struct igt_fb *fb)
>  {
> -	if (!blitter_ok(fb))
> -		return false;
> -
> -	return fb->modifier =3D=3D I915_FORMAT_MOD_Y_TILED ||
> -	       fb->modifier =3D=3D I915_FORMAT_MOD_Yf_TILED ||
> +	return blitter_ok(fb) &&
>  	       !gem_has_mappable_ggtt(fb->fd);
>  }
> =20
> --=20
> 2.25.0
>=20

--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--2ci7zscsz2w7mye6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl5PD2wACgkQWJzP/com
vP/EBw/8CwdRYxKD5SW/tKQY9npxBFpYvVIL7bYp1P4puPBQbXiHYDO7wqyeH1JS
Oy1CQk5qxS+amAmUQj4pzJdc8uLG9dxh8i4/RObBc1E0g1JI1Tv8D+fI0KXR6pOg
3MWjbYlLX/K22xPwPw12GahouGLwfXu5O6UH7WxkmPB+CKgv0y8yIKdryYnAYUp9
RUAIhNMGR2nIYaN0cKjXhx4uTvDCE8+2uRkku/AOiQdN7bHa0QPy1E891jeLv8ea
umC1pfebluAZ/DA0pVgXF6Wsryr5tof2vxHbP+1JaTRTnzAjQriO3R2MJbUM6x3U
omDxlPdgTkhlrxnOFMCL3Ax1VcoA52gLAN1zSZlCtfsyp4GYnecWvTJvwGmBqpu1
Eynn0nnPnaETQJY72vch8EFljlulYGfbJgG7Ro0p964oFTMIcYCa05G57sxmu65y
ofVtWMaL6bnC6ulHkCQQG+IWR+ZEQI7tsoJQrsMZMBrYPB+KOE8RYJ8S+xnBkUZR
foxpert4UcPWe7p6cKWdiYHEJwJy/CY5xFIYMHiOFb0esCS3PSpbNhWXKIcjamN0
yCwwz3NlIC8zyGFO4dxIbwg8wf0FT9GxVMt8NtEo+4dB+y6CJn2QJZrBMu9cdVje
t97hvq0sC7zSiLu4F/avdmQnSo50J9WrhIdf/VZj6P6HGuHCA5U=
=PHYQ
-----END PGP SIGNATURE-----

--2ci7zscsz2w7mye6--

--===============1965394888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1965394888==--
