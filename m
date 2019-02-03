Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC3A6E250
 for <igt-dev@lists.freedesktop.org>; Sun,  3 Feb 2019 20:25:24 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id q8so7239959qke.1
 for <igt-dev@lists.freedesktop.org>; Sun, 03 Feb 2019 12:25:24 -0800 (PST)
Date: Sun, 3 Feb 2019 18:25:19 -0200
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190203202519.micxqf3imcioj7lj@smtp.gmail.com>
References: <7fe5b67752b0d53137360a0a4539572df0287e7d.1549204343.git.mamtashukla555@gmail.com>
 <f6b066cd3ad75629844ade3853e71c6c0786f3a1.1549204343.git.mamtashukla555@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f6b066cd3ad75629844ade3853e71c6c0786f3a1.1549204343.git.mamtashukla555@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t, v3,
 2/2] tests/kms_cursor_crc.c: Remove framebuffer at the end of the
 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0543735880=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mamta Shukla <mamtashukla555@gmail.com>
Cc: igt-dev@lists.freedesktop.org, hamohammed.sa@gmail.com, daniel@ffwll.ch
List-ID: <igt-dev@lists.freedesktop.org>


--===============0543735880==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cqph34cqcrpgns5j"
Content-Disposition: inline


--cqph34cqcrpgns5j
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 02/03, Mamta Shukla wrote:
> Use igt_remove_fb(data->drm_fd, &data->fb) to remove locally
> created framebuffer at the end of the hardware test loop in
> test_cursor_size() function for cursor-size-change subtest in
> kms_cursor_crc.
>=20
> Signed-off-by: Mamta Shukla <mamtashukla555@gmail.com>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> ---
> No changes in v2
>=20
> changes in v3:
> -Modify commit message
>=20
>  tests/kms_cursor_crc.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 144b44b0..fd74fda5 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -583,6 +583,7 @@ static void test_cursor_size(data_t *data)
>  		igt_pipe_crc_collect_crc(pipe_crc, &crc[i]);
>  	}
>  	cursor_disable(data);
> +	igt_remove_fb(data->drm_fd, &data->fb);
>  	/* Software test loop */
>  	for (i =3D 0, size =3D cursor_max_size; size >=3D 64; size /=3D 2, i++)=
 {
>  		/* Now render the same in software and collect crc */
> --=20
> 2.17.1
>=20

Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

--=20
Rodrigo Siqueira
https://siqueira.tech
Graduate Student
Department of Computer Science
University of S=E3o Paulo

--cqph34cqcrpgns5j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlxXTi4ACgkQWJzP/com
vP9BQQ//aitI0w3H8XMukGcp+LK6J9Cii7HyJhGOXFKo2FTmxyzSiOJwfT59K/Xm
JMRzz3kz90GlSypEYwEIej0GcGGL8feA2TUz1DI9/PpU4NJwGGzGbC2L7SnAGdQw
UEkUZChwB7bmysxYBPnrBfF+ZkCZzaFZ6RqE+9mBLWF2YvlcsNX5WEW+WzhfcY1p
1t86o+lY+0bEXnLGWTYNwX8qghEvOhD8hns3X5MO2P3EVUtMRu7Buu4Sss4vdHIa
rGAY0srDJAKNEoi8kRcL7vX1kDzbBgO7gKBwbPWA6frM9JcAikHrlKgTNHOauV5n
+JiLZh7ZsdcWLgqF2xskOwnSCWpZpmY5/iKn8Oe8WK17GDJX0XfJmylkQ9z/B0N9
+7QuxSxJPIT/XsVvaN+cD0JZrR13wTqv8pR4zax32746GROpPYjeAdByNckL6y3f
o29Lps/Y0a1oBioT38RvdOFPFP32ejmxm1mGXCTfZDmk7DkYpde3OJWTcBZNb5c5
vEe22N1FxyJnrrD+rJu9oEqGH6Quld3g6Ex9ZB4DIGvuinJmTc0KRYrjFnYTNqLH
Nlr1aTMqobw1fysV85PP3tNvYHg4TKMV29pvepE1fYOblRk0sjzG+anaph6iRTf/
9pudTCdaoUR3YxFLa3PltkxXS/Agl10iZ//KUxgN524KNKK7YsE=
=wuNJ
-----END PGP SIGNATURE-----

--cqph34cqcrpgns5j--

--===============0543735880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0543735880==--
