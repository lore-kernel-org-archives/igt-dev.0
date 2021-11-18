Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 18 Nov 2021 11:32:02 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
Message-ID: <20211118113202.0ff5dcae@eldfell>
In-Reply-To: <20211115094759.520955-9-bhanuprakash.modem@intel.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211115094759.520955-9-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//DM7Ix.e0MwQe2XWOMdbvF+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Subject: Re: [igt-dev] [i-g-t 08/14] tests/kms_color_chamelium: New subtests
 for Plane gamma
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kunal Joshi <kunal1.joshi@intel.com>, dri-devel@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--Sig_//DM7Ix.e0MwQe2XWOMdbvF+
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Nov 2021 15:17:53 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> To verify Plane gamma, draw 3 gradient rectangles in red, green and blue,
> with a maxed out gamma LUT and verify we have the same frame dump as
> drawing solid color rectangles.
>=20
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_color_chamelium.c | 188 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 187 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
> index 76f82d6d35..b506109271 100644
> --- a/tests/kms_color_chamelium.c
> +++ b/tests/kms_color_chamelium.c
> @@ -24,7 +24,34 @@
> =20
>  #include "kms_color_helper.h"
> =20
> -IGT_TEST_DESCRIPTION("Test Color Features at Pipe level using Chamelium =
to verify instead of CRC");
> +IGT_TEST_DESCRIPTION("Test Color Features at Pipe & Plane level using Ch=
amelium to verify instead of CRC");

Now that you actually can get a captured image of the result with
Chamelium, I think the tests should be more ambitious. Do not rely on
identity curves or matrices, nor max LUT, because now you can use a
difference threshold per pixel when comparing the result with the
reference.

Use various non-trivial curves, different for each of red, green and
blue. Use non-trivial matrices that actually compute mixtures instead
of just moving red value to the green channel. Use multiple planes
simultaneously. Use different framebuffer formats, particularly with
higher than 8 bits per channel, and check the capture has the same
precision and not truncated to 8 bit.

That kind of tests would have much more proving power, and they also
help assess the precision of the hardware. Precision is important to
userspace.

These are also tests that userspace projects cannot really execute, they
do not have labs with Chamelium boards and not all drivers/hardware
support writeback connectors.

> +
> +#define MAX_SUPPORTED_PLANES 7
> +#define SDR_PLANE_BASE 3
> +
> +typedef bool (*test_t)(data_t*, igt_plane_t*);
> +
> +static bool is_hdr_plane(const igt_plane_t *plane)
> +{
> +	return plane->index >=3D 0 && plane->index < SDR_PLANE_BASE;

This here again. I guess the previous definition of this function was
never used?

The same questions.

> +}
> +
> +static bool is_valid_plane(igt_plane_t *plane)
> +{
> +	int index =3D plane->index;
> +
> +	if (plane->type !=3D DRM_PLANE_TYPE_PRIMARY)
> +		return false;
> +
> +	/*
> +	 * Test 1 HDR plane, 1 SDR plane.
> +	 *
> +	 * 0,1,2 HDR planes
> +	 * 3,4,5,6 SDR planes
> +	 *
> +	 */
> +	return index >=3D 0 && index < MAX_SUPPORTED_PLANES;
> +}


Thanks,
pq

--Sig_//DM7Ix.e0MwQe2XWOMdbvF+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGWHZIACgkQI1/ltBGq
qqc3oA//WMsVhJnTNCInZE3ySlFI9iv64HiqC6Zgpy6UBkycCvi/Ugk9LRp9X3CW
AVAGQ3WkNMNdBCo+CxiGrp0zD8ueiKXYg2SScAm97I/YaY6Umiwu/jNJr+fbY+4a
+STLE4vJtUjcVqtpq32Nh5pUHSb/aJTy6sW3gObTHAYSLBmTa6khtTaIlDcbhPAZ
4l1Ybk8nGttlkhAwcDpRRA/nJsk72T5nMOD0wS/0Apk2tWus55Us1nhUsCvoMCkr
gmBIH88f5JsHDG1VAbvPybLu5yBaT+Fscozk0VW53kH08T/VcyvOaUzD83oRz7kT
rZKZWGeM0QARQss7du9rIKcol2RneTmAD04u5Lyq6PuXM3uiDC/jAJK5EAXJjFFv
WY4ygMNcpmg+xwc1gyAQYAz6VycqE3dVPE4QTyD5sX8AancX6SUUrlETUKu+4mQ1
YK/lPoyyBAQDUfrV8LFPmRKlIvxHSGfaA4fwFSZcqAZBNlMiqslkBC7dZaU/LN/G
Cagp4srRU9ksHJrQFEzAANKdVcmJqbYVEPQMqkptMuWIebXqhGT+y9HJm98IZMS4
+hRrr8EonyYOafbP48Q12xYARrBfXb4L3zRfvmyokuTKgMJOlm1zFlVQmcWvqqch
je+imQJh2M54UsC1jnjj6H5pE7HlXUlGkn+XGgWMtoKTAsPc2LU=
=BEwu
-----END PGP SIGNATURE-----

--Sig_//DM7Ix.e0MwQe2XWOMdbvF+--
