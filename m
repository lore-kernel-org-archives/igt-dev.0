Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500D26E2EC
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Feb 2019 00:19:53 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 7 Feb 2019 00:19:50 +0000
Message-ID: <bc822d8d52adc6e3abed8b05a825e00a6efaca01.camel@intel.com>
References: <20190128200126.1270-1-ville.syrjala@linux.intel.com>
 <20190128200126.1270-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20190128200126.1270-5-ville.syrjala@linux.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 5/6] tools/intel_watermark: Dump
 NV12_BUF_CFG
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1086874949=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1086874949==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-JnJGNivUlUdvw9HiXHEu"

--=-JnJGNivUlUdvw9HiXHEu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-01-28 at 22:01 +0200, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> On pre-icl we have two registers for the DDB allocations
> for NV12. Dump the second set of allocations as well.

Reviewed-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>

>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_watermark.c | 56
> +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>=20
> diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
> index 8405d6489628..6a47b33c438c 100644
> --- a/tools/intel_watermark.c
> +++ b/tools/intel_watermark.c
> @@ -235,6 +235,16 @@ static const char *skl_buf_cfg_reg_name(int
> pipe, int plane)
>  	return reg_name;
>  }
> =20
> +static const char *skl_nv12_buf_cfg_reg_name(int pipe, int plane)
> +{
> +	static char reg_name[32];
> +
> +	snprintf(reg_name, sizeof(reg_name),
> "PLANE_NV12_BUF_CFG_%1d_%c",
> +		 plane, pipe_name(pipe));
> +
> +	return reg_name;
> +}
> +
>  static void skl_wm_dump(void)
>  {
>  	int pipe, plane, level;
> @@ -245,6 +255,7 @@ static void skl_wm_dump(void)
>  	uint32_t wm[num_levels][num_pipes][max_planes];
>  	uint32_t wm_trans[num_pipes][max_planes];
>  	uint32_t buf_cfg[num_pipes][max_planes];
> +	uint32_t nv12_buf_cfg[num_pipes][max_planes];
>  	uint32_t plane_ctl[num_pipes][max_planes];
>  	uint32_t wm_linetime[num_pipes];
> =20
> @@ -261,6 +272,10 @@ static void skl_wm_dump(void)
>  			plane_ctl[pipe][plane] =3D read_reg(addr + 0x80);
>  			wm_trans[pipe][plane] =3D read_reg(addr +
> 0x00168);
>  			buf_cfg[pipe][plane] =3D read_reg(addr +
> 0x0017C);
> +			if (plane !=3D 0 && intel_gen(devid) < 11)
> +				nv12_buf_cfg[pipe][plane] =3D
> read_reg(addr + 0x00178);
> +			else
> +				nv12_buf_cfg[pipe][plane] =3D 0;
>  			for (level =3D 0; level < num_levels; level++) {
>  				wm_offset =3D addr + 0x00140 + level *
> 0x4;
>  				wm[level][pipe][plane] =3D
> read_reg(wm_offset);
> @@ -326,6 +341,22 @@ static void skl_wm_dump(void)
>  			       buf_cfg[pipe][plane]);
>  		}
>  		printf("\n");
> +
> +		if (intel_gen(devid) >=3D 11)
> +			continue;
> +
> +		if (plane =3D=3D 0)
> +			continue;
> +
> +		for (pipe =3D 0; pipe < num_pipes; pipe++) {
> +			if (plane >=3D skl_num_planes(devid, pipe))
> +				break;
> +
> +			printf("%18s 0x%08x\t",
> +			       skl_nv12_buf_cfg_reg_name(pipe, plane),
> +			       nv12_buf_cfg[pipe][plane]);
> +		}
> +		printf("\n");
>  	}
>  	printf("\n");
> =20
> @@ -402,6 +433,31 @@ static void skl_wm_dump(void)
>  			size =3D end - start + 1;
>  			printf("%10d", (end =3D=3D 0 && size =3D=3D 1) ? 0 :
> size);
>  		}
> +		printf("\n");
> +
> +		if (intel_gen(devid) < 11) {
> +			printf("\nNV12 DDB allocation:");
> +
> +			printf("\nstart");
> +			for (plane =3D 0; plane < num_planes; plane++) {
> +				start =3D
> REG_DECODE1(nv12_buf_cfg[pipe][plane], 0, 11);
> +				printf("%10d", start);
> +			}
> +
> +			printf("\n  end");
> +			for (plane =3D 0; plane < num_planes; plane++) {
> +				end =3D
> REG_DECODE1(nv12_buf_cfg[pipe][plane], 16, 11);
> +				printf("%10d", end);
> +			}
> +
> +			printf("\n size");
> +			for (plane =3D 0; plane < num_planes; plane++) {
> +				start =3D
> REG_DECODE1(nv12_buf_cfg[pipe][plane], 0, 11);
> +				end
> =3D  REG_DECODE1(nv12_buf_cfg[pipe][plane], 16, 11);
> +				size =3D end - start + 1;
> +				printf("%10d", (end =3D=3D 0 && size =3D=3D 1)
> ? 0 : size);
> +			}
> +		}
> =20
>  		printf("\n\n\n");
>  	}

--=-JnJGNivUlUdvw9HiXHEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxbeaQACgkQVenbO/mO
WkkA2wf9HG4JFH21fHQrmyK5a4yLGFhJ8vpZNzeteP5Oq8BRz6M3olFE9ipsJ9Mn
yQ28QaNR3v0VHrBj00ZnhBltfqnXwWgYE4Eanb0wMappbWLC82h9JPJytvDfgyKQ
Akm3mVbjtfdTFZnuiErOLTP/fo1uypobmATKVkRON2CGWVj8TTVGxjvCYcDjl4ZZ
1xjLeJqQ/wLt878DBFXAHld6hicfbthcPkTqc7HWJHwj50iELj3YxVSE2G0gsb9T
GYJIEQOYYuWdW4QrUUeyYZ/D/6+xlik88Qpd7p331gQwsDGFP5aotXtHGD0jnf2J
Yighly7WcojtT4abvhXBhZPfky8r9w==
=OAK3
-----END PGP SIGNATURE-----

--=-JnJGNivUlUdvw9HiXHEu--

--===============1086874949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1086874949==--
