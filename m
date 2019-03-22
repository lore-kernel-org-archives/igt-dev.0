Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90366E3C7
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2019 21:03:16 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Fri, 22 Mar 2019 21:03:15 +0000
Message-ID: <33b4f3ac8c06196fc61ef41d8cd9f73c459f80ca.camel@intel.com>
References: <20190322203623.12663-1-anusha.srivatsa@intel.com>
In-Reply-To: <20190322203623.12663-1-anusha.srivatsa@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib: sync with the newer i915_pciids.h
 from the Kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1889969219=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1889969219==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-27Ok9VYT3VuT1hvHmzn/"

--=-27Ok9VYT3VuT1hvHmzn/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-03-22 at 13:36 -0700, Anusha wrote:
> From: Anusha Srivatsa <anusha.srivatsa@intel.com>
>=20
> Add CML IDS and additional ICL ID.
>=20
> Align with kernel commits:
>=20
> a7b4deeb02b97 ("drm/i915/cml: Add CML PCI IDS")
> 9a751b999d17a ("drm/i915: Add new ICL PCI ID")
>=20
> v2: Copy header from kernel (Jose)
> - Change commit message (Lucas)
>=20
> v3: Add corresponding kernel commit ids (Antonio)

Not sure if IGT have a commit style rule about this but in i915 we put
only 12 digits of the commit hash, other than that:

Reviewed-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>

>=20
> Cc: Antonio Argenziano <antonio.argenziano@intel.com>
> Cc: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> ---
>  lib/i915_pciids.h | 31 +++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index d2fad7b0..291b5e3f 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -373,6 +373,30 @@
>  #define INTEL_AML_CFL_GT2_IDS(info) \
>  	INTEL_VGA_DEVICE(0x87CA, info)
> =20
> +/* CML GT1 */
> +#define INTEL_CML_GT1_IDS(info)	\
> +	INTEL_VGA_DEVICE(0x9B21, info), \
> +	INTEL_VGA_DEVICE(0x9BAA, info), \
> +	INTEL_VGA_DEVICE(0x9BAB, info), \
> +	INTEL_VGA_DEVICE(0x9BAC, info), \
> +	INTEL_VGA_DEVICE(0x9BA0, info), \
> +	INTEL_VGA_DEVICE(0x9BA5, info), \
> +	INTEL_VGA_DEVICE(0x9BA8, info), \
> +	INTEL_VGA_DEVICE(0x9BA4, info), \
> +	INTEL_VGA_DEVICE(0x9BA2, info)
> +
> +/* CML GT2 */
> +#define INTEL_CML_GT2_IDS(info)	\
> +	INTEL_VGA_DEVICE(0x9B41, info), \
> +	INTEL_VGA_DEVICE(0x9BCA, info), \
> +	INTEL_VGA_DEVICE(0x9BCB, info), \
> +	INTEL_VGA_DEVICE(0x9BCC, info), \
> +	INTEL_VGA_DEVICE(0x9BC0, info), \
> +	INTEL_VGA_DEVICE(0x9BC5, info), \
> +	INTEL_VGA_DEVICE(0x9BC8, info), \
> +	INTEL_VGA_DEVICE(0x9BC4, info), \
> +	INTEL_VGA_DEVICE(0x9BC2, info)
> +
>  #define INTEL_KBL_IDS(info) \
>  	INTEL_KBL_GT1_IDS(info), \
>  	INTEL_KBL_GT2_IDS(info), \
> @@ -436,7 +460,9 @@
>  	INTEL_WHL_U_GT1_IDS(info), \
>  	INTEL_WHL_U_GT2_IDS(info), \
>  	INTEL_WHL_U_GT3_IDS(info), \
> -	INTEL_AML_CFL_GT2_IDS(info)
> +	INTEL_AML_CFL_GT2_IDS(info), \
> +	INTEL_CML_GT1_IDS(info), \
> +	INTEL_CML_GT2_IDS(info)
> =20
>  /* CNL */
>  #define INTEL_CNL_IDS(info) \
> @@ -469,6 +495,7 @@
>  	INTEL_VGA_DEVICE(0x8A57, info), \
>  	INTEL_VGA_DEVICE(0x8A56, info), \
>  	INTEL_VGA_DEVICE(0x8A71, info), \
> -	INTEL_VGA_DEVICE(0x8A70, info)
> +	INTEL_VGA_DEVICE(0x8A70, info), \
> +	INTEL_VGA_DEVICE(0x8A53, info)
> =20
>  #endif /* _I915_PCIIDS_H */

--=-27Ok9VYT3VuT1hvHmzn/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyVTZAACgkQVenbO/mO
Wkn2xQf+MQWmOH6E97rH41Mm0OZLqjImCdkg7fS6E7DCLL/UK4sxjj1zbcPxycng
EfLZfbMgdNQqEhjDrh0qp1hZC6mFI2vQ8SvVMRcJXisKoT6GmKrk697Hldv54rlq
Wt9xqgGJoiJdHUZV4EcJ4XVH2kVAcLFOE9x+YAZocTSV+KwgW38iWYb0NL68+imx
7DDWqAQU3iFG0AXbvR8SpNNdkBKIAghrSAJux6m4q5uM1WBIVkbik69WW4+/5v8D
tM3dYeG+ZH/sZFMHJ7uqA7rBpqKy9t791O7scUsY5x3Nh0yQu49X96D0/Km1f+jl
VCpSKUiL4LQ5BCUp+J1KR4bjarHufg==
=VCwd
-----END PGP SIGNATURE-----

--=-27Ok9VYT3VuT1hvHmzn/--

--===============1889969219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1889969219==--
