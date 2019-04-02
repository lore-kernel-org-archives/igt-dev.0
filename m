Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6B16E7E5
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2019 20:42:57 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Tue, 2 Apr 2019 20:42:55 +0000
Message-ID: <07ec8a1e0346dd5cf0683e8e592e380b32566154.camel@intel.com>
References: <20190401112305.6832-1-stanislav.lisovskiy@intel.com>
 <20190401112305.6832-3-stanislav.lisovskiy@intel.com>
In-Reply-To: <20190401112305.6832-3-stanislav.lisovskiy@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/3] igt/tests/kms_atomic_transition:
 Tolerate if can't have all planes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1277998117=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Cc: "Syrjala, Ville" <ville.syrjala@intel.com>, "Peres,
 Martin" <martin.peres@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1277998117==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-iG1rsgTNsidTItwvg6Ml"

--=-iG1rsgTNsidTItwvg6Ml
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-04-01 at 14:23 +0300, Stanislav Lisovskiy wrote:
> With some upcoming changes i915 might not allow
> all sprite planes enabled, depending on available
> bandwidth limitation. Thus the test need to decrement
> amount of planes and try again, instead of panicking.
>=20
> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> ---
>  tests/kms_atomic_transition.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
>=20
> diff --git a/tests/kms_atomic_transition.c
> b/tests/kms_atomic_transition.c
> index 638fe17e..e4dee7e2 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -214,7 +214,8 @@ static void setup_parms(igt_display_t *display,
> enum pipe pipe,
>  	uint32_t n_planes =3D display->pipes[pipe].n_planes;
>  	uint32_t n_overlays =3D 0, overlays[n_planes];

Nitpick: you don't need to initialize n_overlays here as you do right
after the retry label.

>  	igt_plane_t *plane;
> -	uint32_t iter_mask =3D 3;
> +	uint32_t iter_mask;
> +	int retries =3D n_planes - 1;
> =20
>  	do_or_die(drmGetCap(display->drm_fd, DRM_CAP_CURSOR_WIDTH,
> &cursor_width));
>  	if (cursor_width >=3D mode->hdisplay)
> @@ -224,6 +225,10 @@ static void setup_parms(igt_display_t *display,
> enum pipe pipe,
>  	if (cursor_height >=3D mode->vdisplay)
>  		cursor_height =3D mode->vdisplay;
> =20
> +retry:
> +	n_overlays =3D 0;
> +	iter_mask =3D 3;
> +
>  	for_each_plane_on_pipe(display, pipe, plane) {
>  		int i =3D plane->index;
> =20
> @@ -278,7 +283,6 @@ static void setup_parms(igt_display_t *display,
> enum pipe pipe,
>  	 * Pre gen9 not all sizes are supported, find the biggest
> possible
>  	 * size that can be enabled on all sprite planes.
>  	 */
> -retry:
>  	prev_w =3D sprite_width =3D cursor_width;
>  	prev_h =3D sprite_height =3D cursor_height;
> =20
> @@ -298,12 +302,22 @@ retry:
>  		if (is_atomic_check_plane_size_errno(ret)) {
>  			if (cursor_width =3D=3D sprite_width &&
>  			    cursor_height =3D=3D sprite_height) {
> -				igt_assert_f(alpha,
> -					      "Cannot configure the
> test with all sprite planes enabled\n");
> -
> -				/* retry once with XRGB format. */
> -				alpha =3D false;
> -				goto retry;
> +				if (--retries >=3D 0) {

The 7 first loops it is going to this, on the 8 it will try for the
first time to reduce the number of planes.
Also this way we will only test without alpha in platforms with a high
number of planes.

> +					/* retry once with XRGB format.
> */
> +					if (alpha) {
> +						alpha =3D false;
> +					}
> +					else if (display-
> >pipes[pipe].n_planes > 0) {
> +						display-
> >pipes[pipe].n_planes--;

When you do this wm_setup_plane() will iterate in one less plane, and
not removing framebuffer from that plane, this is probably why you
needed the first patch.

> +						igt_warn("Reduced
> available planes to %d\n",
> +							    display-
> >pipes[pipe].n_planes);
> +					}
> +					n_planes =3D display-
> >pipes[pipe].n_planes;
> +					igt_assert_f(n_planes > 0, "No
> planes left to proceed with!");
> +					goto retry;
> +				}
> +				igt_assert_f(retries > 0,
> +				      "Cannot configure the test with
> all sprite planes enabled\n");
>  			}
> =20
>  			sprite_width =3D prev_w;


My suggestion:

Right after "max_sprite_height =3D (sprite_height =3D=3D mode->vdisplay);"
test if all planes support alpha by using:
igt_plane_has_format_mod(plane, plane_format, plane_modifier).

Then write a new loop testing the maximum number of planes supported
and remember to remove the framebuffer from planes.

And finally run this final loop that will find the max size for sprite
planes.



--=-iG1rsgTNsidTItwvg6Ml
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyjyU4ACgkQVenbO/mO
WkmFMAf/TKWbPoFMCYI3GMglrz9u7cV3nQMmoSGmcyFUQ/xhHWI4HXnPExQXKfa2
8eN19m/lQ12bsCsruVMHymfOllDTuY6CMXgdLyGJM9z3os38G9AUvCpasG7TTL4T
Smi6k22BMIcNQ8AikahE95YxoUy9K+WsMoXuKBilGQzXIqq0NNDFrxb1WiRjWkCf
KDdISq5Tq6eBvPgZgAYrsYo49qea3Pk268sZUezDqO3mLOvVECSRYVVvoVR9CoFw
Q1iPVs5BA7hNipNwKjXS+m4hQSpFVEtvOreTLEcgoUePlKW35GW3l/77MhCtihEC
bgzW8PEgg0+6u40qu+tskNLE4x9hXg==
=mnmd
-----END PGP SIGNATURE-----

--=-iG1rsgTNsidTItwvg6Ml--

--===============1277998117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1277998117==--
