Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CC06E25C
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Dec 2018 23:11:41 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Tue, 4 Dec 2018 23:11:39 +0000
Message-ID: <e1f7af53fd9f62684d3c8bb66b3d1e986d6f60a0.camel@intel.com>
References: <20181204230944.7753-1-jose.souza@intel.com>
 <20181204230944.7753-3-jose.souza@intel.com>
In-Reply-To: <20181204230944.7753-3-jose.souza@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/8] lib/psr: Add support to new
 modified i915_edp_psr_status output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1363109576=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1363109576==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-h3rHXiYj6eJeiuvq5jGn"

--=-h3rHXiYj6eJeiuvq5jGn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

kernel patches changing the debugfs can be found here:

https://patchwork.freedesktop.org/series/53510/

On Tue, 2018-12-04 at 15:09 -0800, Jos=C3=A9 Roberto de Souza wrote:
> The kernel patch 'drm/i915: Refactor PSR status debugfs' changed the
> output of i915_edp_psr_status, so adding support to the new output
> here while keeping the support to the old one for a while.
>=20
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> ---
>  lib/igt_psr.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> index d68f4b49..eecee459 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -34,8 +34,10 @@ static bool psr_active(int debugfs_fd, bool
> check_active)
> =20
>  	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
>  				sizeof(buf));
> -	active =3D strstr(buf, "HW Enabled & Active bit: yes\n") &&
> -		(strstr(buf, "SRDENT") || strstr(buf, "SLEEP"));
> +
> +	active =3D strstr(buf, "HW Enabled & Active bit: yes\n") ||
> +		 strstr(buf, "Source PSR ctl: enabled");
> +	active &=3D !!(strstr(buf, "SRDENT") || strstr(buf, "SLEEP"));
>  	return check_active ? active : !active;
>  }
> =20
> @@ -138,5 +140,6 @@ bool psr_supported(int debugfs_fd)
> =20
>  	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
>  				sizeof(buf));
> -	return strstr(buf, "Sink_Support: yes\n");
> +	return strstr(buf, "Sink_Support: yes\n") ||
> +	       strstr(buf, "Sink support: yes");
>  }

--=-h3rHXiYj6eJeiuvq5jGn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlwHCakACgkQVenbO/mO
WkkSuAf/YjQF5IWY2v3mu7nkbgVN1zvZ78IjduHn77LCD9q+h4EOLV33qUteklVW
Xh0FGTPMFf6t1HDHJ1lmw0do82794OOqhUmqmEPg9ZK1kXm7k/xf7J/jUiLRil3T
wvOcQbuT+BT2hv5xMjyqnrhcAlbE8XyDnhSbodPLHeTXdHld0AvG40suL/BnfxHN
dm7436NVkJEF7R5h80b/TSyvtHaBReYd7WYN+N6y2d+6up2C9MCDgZS1GIdJW7ob
p4sKQB7zYdNZpWKUhEcaSeTtXPI2MebjqcNUBqdh2nn8S3y9Oqf7kZmwZKVf4jOZ
en9CIhaEH9mA+Frt/cVhwHbji/n2Zg==
=9i7u
-----END PGP SIGNATURE-----

--=-h3rHXiYj6eJeiuvq5jGn--

--===============1363109576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1363109576==--
