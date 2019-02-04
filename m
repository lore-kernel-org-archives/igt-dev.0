Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A4B6E5E4
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Feb 2019 18:46:49 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Mon, 4 Feb 2019 18:46:47 +0000
Message-ID: <fe7dda01ec7d99296a2796981c53116d64caf265.camel@intel.com>
References: <20190202080816.2978-1-rodrigo.vivi@intel.com>
In-Reply-To: <20190202080816.2978-1-rodrigo.vivi@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib: sync i915_pciids.h with kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0391134839=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0391134839==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-CDozugHWWUeOBfz/b5qz"

--=-CDozugHWWUeOBfz/b5qz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-02-02 at 00:08 -0800, Rodrigo Vivi wrote:
> Add more PCI Device IDs for Coffee Lake and Ice Lake.
>=20
> Align with kernel commits:
>=20
> 5e0f5a58b167 ("drm/i915/cfl: Adding another PCI Device ID.")
> 03ca3cf8e9aa ("drm/i915/icl: Adding few more device IDs for Ice
> Lake")
>=20

Reviewed-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>

> Cc: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  lib/i915_pciids.h       | 8 ++++++++
>  lib/intel_device_info.c | 1 +
>  2 files changed, 9 insertions(+)
>=20
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index 19266714..d2fad7b0 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -394,6 +394,9 @@
>  	INTEL_VGA_DEVICE(0x3E9A, info)  /* SRV GT2 */
> =20
>  /* CFL H */
> +#define INTEL_CFL_H_GT1_IDS(info) \
> +	INTEL_VGA_DEVICE(0x3E9C, info)
> +
>  #define INTEL_CFL_H_GT2_IDS(info) \
>  	INTEL_VGA_DEVICE(0x3E9B, info), /* Halo GT2 */ \
>  	INTEL_VGA_DEVICE(0x3E94, info)  /* Halo GT2 */
> @@ -426,6 +429,7 @@
>  #define INTEL_CFL_IDS(info)	   \
>  	INTEL_CFL_S_GT1_IDS(info), \
>  	INTEL_CFL_S_GT2_IDS(info), \
> +	INTEL_CFL_H_GT1_IDS(info), \
>  	INTEL_CFL_H_GT2_IDS(info), \
>  	INTEL_CFL_U_GT2_IDS(info), \
>  	INTEL_CFL_U_GT3_IDS(info), \
> @@ -457,9 +461,13 @@
>  	INTEL_VGA_DEVICE(0x8A51, info), \
>  	INTEL_VGA_DEVICE(0x8A5C, info), \
>  	INTEL_VGA_DEVICE(0x8A5D, info), \
> +	INTEL_VGA_DEVICE(0x8A59, info),	\
> +	INTEL_VGA_DEVICE(0x8A58, info),	\
>  	INTEL_VGA_DEVICE(0x8A52, info), \
>  	INTEL_VGA_DEVICE(0x8A5A, info), \
>  	INTEL_VGA_DEVICE(0x8A5B, info), \
> +	INTEL_VGA_DEVICE(0x8A57, info), \
> +	INTEL_VGA_DEVICE(0x8A56, info), \
>  	INTEL_VGA_DEVICE(0x8A71, info), \
>  	INTEL_VGA_DEVICE(0x8A70, info)
> =20
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 076168bf..2bca5183 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -351,6 +351,7 @@ static const struct pci_id_match
> intel_device_match[] =3D {
> =20
>  	INTEL_CFL_S_GT1_IDS(&intel_coffeelake_gt1_info),
>  	INTEL_CFL_S_GT2_IDS(&intel_coffeelake_gt2_info),
> +	INTEL_CFL_H_GT1_IDS(&intel_coffeelake_gt1_info),
>  	INTEL_CFL_H_GT2_IDS(&intel_coffeelake_gt2_info),
>  	INTEL_CFL_U_GT2_IDS(&intel_coffeelake_gt2_info),
>  	INTEL_CFL_U_GT3_IDS(&intel_coffeelake_gt3_info),

--=-CDozugHWWUeOBfz/b5qz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxYiJUACgkQVenbO/mO
WkmblQf+Lb+2Yvv4iSZYOLtDRSECl9u6RIaWTv07JlxVgiOxdb61miIz+g0ZPINu
xza81Dq0OGfB/V/p6m0xOmuV3w5NZbfDCobslNxCs+nb0nHN8klATSU89mCq9aiK
7dPwAFd+VaLr0c3MgeNKDG6NskIWKU2T/3alW2cWlNSSS0Bl7r5XRbVGVwsPOPak
0bRFtdGFZMw3zmdX/3fSjtsJKKUKD3OeRhdMuz2xdsN02iXkRzLYtDBgdJnRc+JX
fbqeju+nT1R0lewRwaSCuARYvXVpUbmORhs9A4jalmkLmrHCJqjKNDCdxAVK/RRh
t/L75gzCAnmgSphNQr7wZV+f6ue5KA==
=G40q
-----END PGP SIGNATURE-----

--=-CDozugHWWUeOBfz/b5qz--

--===============0391134839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0391134839==--
