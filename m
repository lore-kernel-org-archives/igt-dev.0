Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BED6E555
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jan 2019 22:16:33 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Mon, 28 Jan 2019 22:16:31 +0000
Message-ID: <851ad1537ad97fc297badbff122e9f33682b24c0.camel@intel.com>
References: <20190128200126.1270-1-ville.syrjala@linux.intel.com>
 <20190128200126.1270-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20190128200126.1270-6-ville.syrjala@linux.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 6/6] tools/intel_watermark: Clean up the
 platform checks in the ilk+ code
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0595105715=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0595105715==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-2+k6RjhTlg/GSNA539Yq"

--=-2+k6RjhTlg/GSNA539Yq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-01-28 at 22:01 +0200, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Replace the old hand rolled platform check funcs with somehting
> more standard.

Reviewed-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>

>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_watermark.c | 42 ++++++++++++++++-----------------------
> --
>  1 file changed, 16 insertions(+), 26 deletions(-)
>=20
> diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
> index 6a47b33c438c..e71c3d9cff6d 100644
> --- a/tools/intel_watermark.c
> +++ b/tools/intel_watermark.c
> @@ -125,16 +125,6 @@ static char endis_ast(bool enabled)
>  	return enabled ? '*' : ' ';
>  }
> =20
> -static int is_gen7_plus(uint32_t d)
> -{
> -	return !(IS_GEN5(d) || IS_GEN6(d));
> -}
> -
> -static int is_hsw_plus(uint32_t d)
> -{
> -	return !(IS_GEN5(d) || IS_GEN6(d) || IS_IVYBRIDGE(d));
> -}
> -
>  static int skl_num_planes(uint32_t d, int pipe)
>  {
>  	if (IS_GEN11(d))
> @@ -476,14 +466,14 @@ static void ilk_wm_dump(void)
>  	uint32_t wm_lp[3];
>  	uint32_t wm_lp_spr[3];
>  	uint32_t arb_ctl, arb_ctl2, wm_misc =3D 0;
> -	int num_pipes =3D is_gen7_plus(devid) ? 3 : 2;
> +	int num_pipes =3D intel_gen(devid) >=3D 7 ? 3 : 2;
>  	struct ilk_wm wm =3D {};
> =20
>  	intel_register_access_init(intel_get_pci_device(), 0, -1);
> =20
>  	for (i =3D 0; i < num_pipes; i++) {
>  		dspcntr[i] =3D read_reg(0x70180 + i * 0x1000);
> -		if (is_gen7_plus(devid))
> +		if (intel_gen(devid) >=3D 7)
>  			spcntr[i] =3D read_reg(0x70280 + i * 0x1000);
>  		else
>  			spcntr[i] =3D read_reg(0x72180 + i * 0x1000);
> @@ -494,7 +484,7 @@ static void ilk_wm_dump(void)
>  	if (num_pipes =3D=3D 3)
>  		wm_pipe[2] =3D read_reg(0x45200);
> =20
> -	if (is_hsw_plus(devid)) {
> +	if (IS_BROADWELL(devid) || IS_HASWELL(devid)) {
>  		wm_linetime[0] =3D read_reg(0x45270);
>  		wm_linetime[1] =3D read_reg(0x45274);
>  		wm_linetime[2] =3D read_reg(0x45278);
> @@ -505,21 +495,21 @@ static void ilk_wm_dump(void)
>  	wm_lp[2] =3D read_reg(0x45110);
> =20
>  	wm_lp_spr[0] =3D read_reg(0x45120);
> -	if (is_gen7_plus(devid)) {
> +	if (intel_gen(devid) >=3D 7) {
>  		wm_lp_spr[1] =3D read_reg(0x45124);
>  		wm_lp_spr[2] =3D read_reg(0x45128);
>  	}
> =20
>  	arb_ctl =3D read_reg(0x45000);
>  	arb_ctl2 =3D read_reg(0x45004);
> -	if (is_hsw_plus(devid))
> +	if (IS_BROADWELL(devid) || IS_HASWELL(devid))
>  		wm_misc =3D read_reg(0x45260);
> =20
>  	intel_register_access_fini();
> =20
>  	for (i =3D 0; i < num_pipes; i++)
>  		printf("    WM_PIPE_%c =3D 0x%08x\n", pipe_name(i),
> wm_pipe[i]);
> -	if (is_hsw_plus(devid)) {
> +	if (IS_BROADWELL(devid) || IS_HASWELL(devid)) {
>  		for (i =3D 0; i < num_pipes; i++)
>  			printf("WM_LINETIME_%c =3D 0x%08x\n",
> pipe_name(i), wm_linetime[i]);
>  	}
> @@ -527,13 +517,13 @@ static void ilk_wm_dump(void)
>  	printf("       WM_LP2 =3D 0x%08x\n", wm_lp[1]);
>  	printf("       WM_LP3 =3D 0x%08x\n", wm_lp[2]);
>  	printf("   WM_LP1_SPR =3D 0x%08x\n", wm_lp_spr[0]);
> -	if (is_gen7_plus(devid)) {
> +	if (intel_gen(devid) >=3D 7) {
>  		printf("   WM_LP2_SPR =3D 0x%08x\n", wm_lp_spr[1]);
>  		printf("   WM_LP3_SPR =3D 0x%08x\n", wm_lp_spr[2]);
>  	}
>  	printf("      ARB_CTL =3D 0x%08x\n", arb_ctl);
>  	printf("     ARB_CTL2 =3D 0x%08x\n", arb_ctl2);
> -	if (is_hsw_plus(devid))
> +	if (IS_BROADWELL(devid) || IS_HASWELL(devid))
>  		printf("      WM_MISC =3D 0x%08x\n", wm_misc);
> =20
>  	for (i =3D 0 ; i < num_pipes; i++) {
> @@ -541,7 +531,7 @@ static void ilk_wm_dump(void)
>  		wm.pipe[i].sprite =3D REG_DECODE1(wm_pipe[i], 8, 8);
>  		wm.pipe[i].cursor =3D REG_DECODE1(wm_pipe[i], 0, 6);
> =20
> -		if (is_hsw_plus(devid)) {
> +		if (IS_BROADWELL(devid) || IS_HASWELL(devid)) {
>  			wm.linetime[i].linetime =3D
> REG_DECODE1(wm_linetime[i], 0, 9);
>  			wm.linetime[i].ips =3D
> REG_DECODE1(wm_linetime[i], 16, 9);
>  		}
> @@ -556,15 +546,15 @@ static void ilk_wm_dump(void)
>  	for (i =3D 0; i < 3; i++) {
>  		wm.lp[i].enabled =3D REG_DECODE1(wm_lp[i], 31, 1);
>  		wm.lp[i].latency =3D REG_DECODE1(wm_lp[i], 24, 7);
> -		if (IS_GEN8(devid))
> +		if (IS_BROADWELL(devid))
>  			wm.lp[i].fbc =3D REG_DECODE1(wm_lp[i], 19, 5);
>  		else
>  			wm.lp[i].fbc =3D REG_DECODE1(wm_lp[i], 20, 4);
>  		wm.lp[i].primary =3D REG_DECODE1(wm_lp[i], 8, 11);
>  		wm.lp[i].cursor =3D REG_DECODE1(wm_lp[i], 0, 8);
> =20
> -		if (i =3D=3D 0 || is_gen7_plus(devid)) {
> -			if (!is_gen7_plus(devid))
> +		if (i =3D=3D 0 || intel_gen(devid) >=3D 7) {
> +			if (intel_gen(devid) < 7)
>  				wm.lp[i].sprite_enabled =3D
> REG_DECODE1(wm_lp_spr[i], 31, 1);
>  			wm.lp[i].sprite =3D REG_DECODE1(wm_lp_spr[i], 0,
> 11);
>  		}
> @@ -574,7 +564,7 @@ static void ilk_wm_dump(void)
>  		printf("WM_PIPE_%c: primary=3D%d, cursor=3D%d,
> sprite=3D%d\n",
>  		       pipe_name(i), wm.pipe[i].primary,
> wm.pipe[i].cursor, wm.pipe[i].sprite);
>  	}
> -	if (is_hsw_plus(devid)) {
> +	if (IS_BROADWELL(devid) || IS_HASWELL(devid)) {
>  		for (i =3D 0; i < num_pipes; i++) {
>  			printf("WM_LINETIME_%c: line time=3D%d (%.3f
> usec), ips line time=3D%d (%.3f usec)\n",
>  			       pipe_name(i),
> @@ -582,7 +572,7 @@ static void ilk_wm_dump(void)
>  			       wm.linetime[i].ips, wm.linetime[i].ips *
> 0.125f);
>  		}
>  	}
> -	if (is_gen7_plus(devid)) {
> +	if (intel_gen(devid) >=3D 7) {
>  		for (i =3D 0; i < 3; i++) {
>  			printf("WM_LP%d: %s, latency=3D%d, fbc=3D%d,
> primary=3D%d, cursor=3D%d, sprite=3D%d\n",
>  			       i + 1, endis(wm.lp[i].enabled),
> wm.lp[i].latency, wm.lp[i].fbc,
> @@ -607,10 +597,10 @@ static void ilk_wm_dump(void)
>  			printf("Sprite %c trickle feed =3D %s\n",
>  			       pipe_name(i),
> endis(!wm.pipe[i].sprite_trickle_feed_dis));
>  	}
> -	if (is_hsw_plus(devid)) {
> +	if (IS_BROADWELL(devid) || IS_HASWELL(devid)) {
>  		printf("DDB partitioning =3D %s\n",
>  		       REG_DECODE1(wm_misc, 0, 1) ? "5/6" : "1/2");
> -	} else if (is_gen7_plus(devid)) {
> +	} else if (intel_gen(devid) >=3D 7) {
>  		printf("DDB partitioning =3D %s\n",
>  		       REG_DECODE1(arb_ctl2, 6, 1) ? "5/6" : "1/2");
>  	}

--=-2+k6RjhTlg/GSNA539Yq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxPfz0ACgkQVenbO/mO
WknPmwgAqRmNi8qi5+EC/UO5IAU7nw2yuS7qs5s1+SIF6VX0yQX8kkYWG/90BVtq
xxDu+HgDTiDz02o/px0TZ4dnzvWwHi97sqrKVstQ+UnUpwl9bDabH03gN/xoWt77
ESewzZaMHKlRXPHvT7YjptyagEV9E8ak+JnEvaAHdqSCsSekgAaA9YyLXABfCegj
PPgUUR7ZiAfl+ct1n2taTkVT5yn2mrlZ1VN7OQb9EtcoVSSZFX5uGl+GUl+jUwxx
5Tft+hPsPkEg1Al8i4Q8kc6LbcraBP6sZxOehS6/wQ1eODiUOJWefE9WLgh5KSl4
ExnqbyqzUVbuZ7t9xdkHrMYvcIWPKw==
=k/vh
-----END PGP SIGNATURE-----

--=-2+k6RjhTlg/GSNA539Yq--

--===============0595105715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0595105715==--
