Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA71E6E74C
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jan 2019 22:53:35 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Mon, 28 Jan 2019 22:53:33 +0000
Message-ID: <0d643f52bd2d12fefac590bb8cf14c22889a33fd.camel@intel.com>
References: <20190128200126.1270-1-ville.syrjala@linux.intel.com>
 <20190128200126.1270-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20190128200126.1270-4-ville.syrjala@linux.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/6] tools/intel_watermark: Show whether
 each plane is enabled
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1109213289=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1109213289==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-TTHs+ZRLPw99y2riwOUn"

--=-TTHs+ZRLPw99y2riwOUn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-01-28 at 22:01 +0200, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> To make it easier to spot errors with watermarks vs. plane
> being enabled/disabled indicate which planes are actually
> enabled and which are not.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_watermark.c | 40 ++++++++++++++++++++++++++++++++++++++-
> -
>  1 file changed, 38 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
> index 97b769250927..8405d6489628 100644
> --- a/tools/intel_watermark.c
> +++ b/tools/intel_watermark.c
> @@ -180,6 +180,20 @@ static const char *skl_wm_linetime_reg_name(int
> pipe)
>  	return reg_name;
>  }
> =20
> +static const char *skl_plane_ctl_reg_name(int pipe, int plane)
> +{
> +	static char reg_name[32];
> +
> +	if (plane =3D=3D 0)
> +		snprintf(reg_name, sizeof(reg_name), "CUR_CTL_%c",
> +			 pipe_name(pipe));
> +	else
> +		snprintf(reg_name, sizeof(reg_name),
> "PLANE_CTL_%1d_%c",
> +			 plane, pipe_name(pipe));
> +
> +	return reg_name;
> +}
> +
>  static const char *skl_wm_reg_name(int pipe, int plane, int level)
>  {
>  	static char reg_name[32];
> @@ -231,6 +245,7 @@ static void skl_wm_dump(void)
>  	uint32_t wm[num_levels][num_pipes][max_planes];
>  	uint32_t wm_trans[num_pipes][max_planes];
>  	uint32_t buf_cfg[num_pipes][max_planes];
> +	uint32_t plane_ctl[num_pipes][max_planes];
>  	uint32_t wm_linetime[num_pipes];
> =20
>  	intel_register_access_init(intel_get_pci_device(), 0, -1);
> @@ -243,6 +258,7 @@ static void skl_wm_dump(void)
>  		for (plane =3D 0; plane < num_planes; plane++) {
>  			addr =3D  base_addr +  pipe * 0x1000 + plane *
> 0x100;
> =20
> +			plane_ctl[pipe][plane] =3D read_reg(addr + 0x80);
>  			wm_trans[pipe][plane] =3D read_reg(addr +
> 0x00168);
>  			buf_cfg[pipe][plane] =3D read_reg(addr +
> 0x0017C);
>  			for (level =3D 0; level < num_levels; level++) {
> @@ -259,6 +275,19 @@ static void skl_wm_dump(void)
>  	}
>  	printf("\n\n");
> =20
> +	for (plane =3D 0; plane < max_planes; plane++) {
> +		for (pipe =3D 0; pipe < num_pipes; pipe++) {
> +			if (plane >=3D skl_num_planes(devid, pipe))
> +				break;
> +
> +			printf("%18s 0x%08x\t" ,
> +			       skl_plane_ctl_reg_name(pipe, plane),
> +			       plane_ctl[pipe][plane]);
> +		}
> +		printf("\n");
> +	}
> +	printf("\n");
> +
>  	for (plane =3D 0; plane < max_planes; plane++) {
>  		for (level =3D 0; level < num_levels; level++) {
>  			for (pipe =3D 0; pipe < num_pipes; pipe++) {
> @@ -312,8 +341,15 @@ static void skl_wm_dump(void)
>  		printf("LINETIME: %d (%.3f usec)\n", linetime,
> linetime* 0.125f);
> =20
>  		printf("LEVEL");
> -		for (plane =3D 0; plane < num_planes; plane++)
> -			printf("%10s", skl_plane_name(pipe, plane));
> +		for (plane =3D 0; plane < num_planes; plane++) {
> +			if (plane =3D=3D 0)
> +				enable =3D
> REG_DECODE1(plane_ctl[pipe][plane], 0, 3) ||
> +					REG_DECODE1(plane_ctl[pipe][pla
> ne], 5, 1);

I guess we only enabled ARGB and AND/XOR cursors?! But why not keep it
simple and check for REG_DECODE1(plane_ctl[pipe][plane], 0, 5)?

Other than that LGTM:

Reviewed-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>


> +			else
> +				enable =3D
> REG_DECODE1(plane_ctl[pipe][plane], 31, 1);
> +			printf("%9s%c", skl_plane_name(pipe, plane),
> +			       endis_ast(enable));
> +		}
>  		printf("\n");
> =20
>  		for (level =3D 0; level < num_levels; level++) {

--=-TTHs+ZRLPw99y2riwOUn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxPh+oACgkQVenbO/mO
Wkke5AgAk9rqqFC25XyAnTbaUduAWCKf9Bh5hsWOKF6pWJrODnWGwXBlLzJaBFJb
mzCS0yWj3Q8DOXvwusOwVmAgoeYRwQ2hKlqj1Fyowq4tAYTanSc2d1YvM3x/Bnc6
kb/hKVvSI2NDDjT0YxF/rkto8xMqNXiqvDfceR8hcw+kJe2uECNbd3lTu14pbje+
elmkgB4JNvuTwxvIaIEdXGf3c3viiOV1NmZtctR3fIczgueqOzihMBbfnWxCPc0L
OK0SMkZeYdQ3EomQ6SaZg3Vcc5pq8WRI/uSxNW4QkYDAe+dGCIcwOkOGMws4xDqa
ioJR9Cs8/xckH/8AEf/w0ppsLpCqpw==
=rYCC
-----END PGP SIGNATURE-----

--=-TTHs+ZRLPw99y2riwOUn--

--===============1109213289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1109213289==--
