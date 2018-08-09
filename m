Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id DDB0B6E4BA
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Aug 2018 21:25:50 +0000 (UTC)
From: Eric Anholt <eric@anholt.net>
In-Reply-To: <1e358ab42ddaedf5460560c68df2b61cb6ecd611.1532596850.git-series.maxime.ripard@bootlin.com>
References: <cover.85e5bbe6ef5f0fd420e1fc21fc248471b98481e5.1532596850.git-series.maxime.ripard@bootlin.com>
 <1e358ab42ddaedf5460560c68df2b61cb6ecd611.1532596850.git-series.maxime.ripard@bootlin.com>
Date: Thu, 09 Aug 2018 14:25:48 -0700
Message-ID: <87y3dfs04j.fsf@anholt.net>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 06/13] fb: Add more formats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2141776618=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: eben@raspberrypi.org, Maxime Ripard <maxime.ripard@bootlin.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============2141776618==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Maxime Ripard <maxime.ripard@bootlin.com> writes:

> We're going to need some DRM formats, and we're going to need the igt_fb
> code to handle them. Since it relies on the format_desc structure to map
> the DRM fourcc to the pixman and cairo formats, we need to add these new
> formats to that structure.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  lib/igt_fb.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 9defbd8b044c..17deeada5beb 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -72,16 +72,46 @@ static struct format_desc_struct {
>  	int num_planes;
>  	int plane_bpp[4];
>  } format_desc[] = {
> +	{ .name = "ARGB1555", .depth = 15, .drm_id = DRM_FORMAT_ARGB1555,

.depth=16 here?

Other than that, 1-6 are:

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAltssVwACgkQtdYpNtH8
nujVZw//V7GfCkN/Ach3oO1I09ZDual7HsKkZSD65rupK59UpFSb8bI5QJvFdbj+
2cgjLebq3dJfwlFOADeIGvXBkbsvrFEULtx+l+HfGL9w07Ia9GdsJKtGLNANkhjk
8JpyfSXYa84/yqJjDm34TsAjR6qaDddVeVRYJlO6o7dr5EVqumeXENEzGoHqYP/w
rniunp5QlISX5Sd6AJD1dDt5c3LLPUNp8CqQB+EVA099Dj5xQzqr6pmlRlB+bcH7
7u4Bghs00BWIfi53244k/oyvvvVxiU1HZjVWarBGIcyz81Ojwyhv+HPGWt6/baY9
Ah/+l5DwBCTC/WQ8ybfbvCBImSlpLfjYilB8qJMLNb7hJi9mnidQPwmZJYbAeNhR
o2mzBsBiT7DHN6hZG20WdP2Mj4kwVlyoutCSkzYKmVoDNocSB3KbrGBTfgqCuBqL
BmzapZMmzeVPBVQbO/rzrP6TcHjfP5N60CmgzWhAFeeWNM5fa2KpluP0xBFTZvyg
xFyuy8YwAfwS47QS7+KLAB4ZYJODvViWeiu27ownFzhOPUJzM1Qj+FbaSfSXZA15
vSE3TPH9jy4kFCPEZGIFn5fu5FIsc5d1lQ+ATxbhAQ4+j7s7sWsscexOJqDwsueR
2mYqiAgyo+Tf9Zv0MSTCpv4lfB8Vr6tF8fyTz/mEfjLwrUt3U44=
=SqUB
-----END PGP SIGNATURE-----
--=-=-=--

--===============2141776618==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============2141776618==--
