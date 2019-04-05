Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EED6E5C8
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2019 00:59:09 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Fri, 5 Apr 2019 00:59:07 +0000
Message-ID: <8e5938c0ef48a0a9948dcb369a82807a3b3a9440.camel@intel.com>
References: <20190404121359.3339-1-stanislav.lisovskiy@intel.com>
 <20190404121359.3339-3-stanislav.lisovskiy@intel.com>
In-Reply-To: <20190404121359.3339-3-stanislav.lisovskiy@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v5 2/2] igt/tests/kms_atomic_transition:
 Tolerate if can't have all planes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0415263563=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Cc: "Syrjala, Ville" <ville.syrjala@intel.com>, "Peres,
 Martin" <martin.peres@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0415263563==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-fuYOTPP6aYp0NWwFpZMc"

--=-fuYOTPP6aYp0NWwFpZMc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-04-04 at 15:13 +0300, Stanislav Lisovskiy wrote:
> With some upcoming changes i915 might not allow
> all sprite planes enabled, depending on available
> bandwidth limitation. Thus the test need to decrement
> amount of planes and try again, instead of panicking.
>=20
> v2: Removed excessive nested conditions, making code a bit
>     more readable(hopefully).
>=20
> v3: Stopped using global n_planes variable as it might cause
>     resources being unreleased.
>     Using now parms[i].mask as a way to determine if plane
>     has to be included into commit.
>=20
> v4: Removed unneeded n_overlays initialization.
>=20
> v5: Randomize which of sprite planes to remove if hitting
>     resource limits.
>=20
> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> ---
>  tests/kms_atomic_transition.c | 123 ++++++++++++++++++++----------
> ----
>  1 file changed, 71 insertions(+), 52 deletions(-)
>=20
> diff --git a/tests/kms_atomic_transition.c
> b/tests/kms_atomic_transition.c
> index 638fe17e..e6d55ca0 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -212,9 +212,12 @@ static void setup_parms(igt_display_t *display,
> enum pipe pipe,
>  	unsigned sprite_width, sprite_height, prev_w, prev_h;
>  	bool max_sprite_width, max_sprite_height, alpha =3D true;
>  	uint32_t n_planes =3D display->pipes[pipe].n_planes;
> -	uint32_t n_overlays =3D 0, overlays[n_planes];
> +	uint32_t n_overlays, overlays[n_planes];
>  	igt_plane_t *plane;
> -	uint32_t iter_mask =3D 3;
> +	uint32_t iter_mask;
> +	int retries =3D n_planes - 1;
> +	int ret =3D 0;
> +	uint32_t planes_to_remove;
> =20
>  	do_or_die(drmGetCap(display->drm_fd, DRM_CAP_CURSOR_WIDTH,
> &cursor_width));
>  	if (cursor_width >=3D mode->hdisplay)
> @@ -224,6 +227,11 @@ static void setup_parms(igt_display_t *display,
> enum pipe pipe,
>  	if (cursor_height >=3D mode->vdisplay)
>  		cursor_height =3D mode->vdisplay;
> =20
> +retry:
> +	n_overlays =3D 0;
> +	iter_mask =3D 3;
> +	planes_to_remove =3D display->pipes[pipe].n_planes - n_planes;
> +
>  	for_each_plane_on_pipe(display, pipe, plane) {
>  		int i =3D plane->index;
> =20
> @@ -238,12 +246,30 @@ static void setup_parms(igt_display_t *display,
> enum pipe pipe,
>  			parms[i].height =3D cursor_height;
>  			parms[i].mask =3D 1 << 1;
>  		} else {
> -			parms[i].fb =3D sprite_fb;
> -			parms[i].mask =3D 1 << 2;
> -
> -			iter_mask |=3D 1 << 2;
> -
> -			overlays[n_overlays++] =3D i;
> +			/* Randomize if we remove that sprite plane or
> not */
> +			uint32_t remove =3D
> hars_petruska_f54_1_random_unsafe_max(2);
> +			/*
> +			 * Figure out how much sprite planes left:
> +			 * planes left =3D overall amount - 1 primary - 1
> cursor - sprite planes used
> +			 */
> +			int planes_left =3D display->pipes[pipe].n_planes=20
> - 2 - n_overlays;
> +			/*
> +			 * Remove the plane if remove is set and we
> have sprite planes to remove.
> +			 * If we have left same or less amount of
> planes than we need
> +			 * to remove then no randomization, just
> remove.
> +			 */
> +			if ((remove && planes_to_remove > 0) ||
> (planes_to_remove >=3D planes_left)) {

This will not guarantee that x(planes_to_remove) planes will be
removed.

> +				parms[i].fb =3D NULL;
> +				parms[i].mask =3D 0;
> +				planes_to_remove--;
> +				igt_warn("Removed plane %d\n", i);
> +			}
> +			else {
> +				parms[i].fb =3D sprite_fb;
> +				parms[i].mask =3D 1 << 2;
> +				iter_mask |=3D 1 << 2;
> +				overlays[n_overlays++] =3D i;
> +			}
>  		}
>  	}
> =20
> @@ -278,16 +304,13 @@ static void setup_parms(igt_display_t *display,
> enum pipe pipe,
>  	 * Pre gen9 not all sizes are supported, find the biggest
> possible
>  	 * size that can be enabled on all sprite planes.
>  	 */
> -retry:
>  	prev_w =3D sprite_width =3D cursor_width;
>  	prev_h =3D sprite_height =3D cursor_height;
> =20
>  	max_sprite_width =3D (sprite_width =3D=3D mode->hdisplay);
>  	max_sprite_height =3D (sprite_height =3D=3D mode->vdisplay);
> =20
> -	while (1) {
> -		int ret;
> -
> +	while (!max_sprite_width && !max_sprite_height) {
>  		set_sprite_wh(display, pipe, parms, sprite_fb,
>  			      alpha, sprite_width, sprite_height);
> =20
> @@ -295,54 +318,49 @@ retry:
>  		ret =3D igt_display_try_commit_atomic(display,
> DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>  		igt_assert(!is_atomic_check_failure_errno(ret));
> =20
> -		if (is_atomic_check_plane_size_errno(ret)) {
> -			if (cursor_width =3D=3D sprite_width &&
> -			    cursor_height =3D=3D sprite_height) {
> -				igt_assert_f(alpha,
> -					      "Cannot configure the
> test with all sprite planes enabled\n");
> -
> -				/* retry once with XRGB format. */
> -				alpha =3D false;
> -				goto retry;
> -			}
> -
> -			sprite_width =3D prev_w;
> -			sprite_height =3D prev_h;
> -
> -			if (max_sprite_width && max_sprite_height) {
> -				set_sprite_wh(display, pipe, parms,
> sprite_fb,
> -					      alpha, sprite_width,
> sprite_height);
> -				break;
> -			}
> -
> -			if (!max_sprite_width)
> -				max_sprite_width =3D true;
> -			else
> -				max_sprite_height =3D true;
> -		} else {
> +		if (!is_atomic_check_plane_size_errno(ret)) {
>  			prev_w =3D sprite_width;
>  			prev_h =3D sprite_height;
> -		}
> -
> -		if (!max_sprite_width) {
> -			sprite_width *=3D 2;
> -
> +   =20
> +			sprite_width *=3D max_sprite_width ? 1 : 2;
>  			if (sprite_width >=3D mode->hdisplay) {
>  				max_sprite_width =3D true;
> -
>  				sprite_width =3D mode->hdisplay;
>  			}
> -		} else if (!max_sprite_height) {
> -			sprite_height *=3D 2;
> =20
> +			sprite_height *=3D max_sprite_height ? 1 : 2;
>  			if (sprite_height >=3D mode->vdisplay) {
>  				max_sprite_height =3D true;
> -
>  				sprite_height =3D mode->vdisplay;
>  			}
> -		} else
> -			/* Max sized sprites for all! */
> -			break;
> +			continue;
> +		}
> +
> +		if (cursor_width =3D=3D sprite_width &&
> +		    cursor_height =3D=3D sprite_height) {
> +			igt_assert_f(retries > 0,
> +				      "Cannot configure the test with
> all sprite planes enabled\n");
> +			--retries;
> +			/* retry once with XRGB format. */
> +			if (alpha) {
> +				alpha =3D false;
> +				igt_warn("Removed alpha\n");
> +			}
> +			else {
> +				igt_assert_f(n_planes > 1, "No planes
> left to proceed with!");
> +				n_planes--;
> +				igt_warn("Reduced available planes to
> %d\n", n_planes);
> +			}
> +			goto retry;
> +		}
> +
> +		sprite_width =3D prev_w;
> +		sprite_height =3D prev_h;
> +
> +		if (!max_sprite_width)
> +			max_sprite_width =3D true;
> +		else
> +			max_sprite_height =3D true;
>  	}
> =20
>  	igt_info("Running test on pipe %s with resolution %dx%d and
> sprite size %dx%d alpha %i\n",
> @@ -463,7 +481,6 @@ run_transition_test(igt_display_t *display, enum
> pipe pipe, igt_output_t *output
> =20
>  	if (flags & DRM_MODE_ATOMIC_ALLOW_MODESET) {
>  		igt_output_set_pipe(output, PIPE_NONE);
> -
>  		igt_display_commit2(display, COMMIT_ATOMIC);
> =20
>  		igt_output_set_pipe(output, pipe);
> @@ -525,8 +542,10 @@ run_transition_test(igt_display_t *display, enum
> pipe pipe, igt_output_t *output
>  		}
> =20
>  		/* force planes to be part of commit */
> -		for_each_plane_on_pipe(display, pipe, plane)
> -			igt_plane_set_position(plane, 0, 0);
> +		for_each_plane_on_pipe(display, pipe, plane) {
> +			if (parms[plane->index].mask)
> +				igt_plane_set_position(plane, 0, 0);
> +		}
> =20
>  		igt_display_commit2(display, COMMIT_ATOMIC);
> =20

--=-fuYOTPP6aYp0NWwFpZMc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlymqFkACgkQVenbO/mO
Wkk7Wgf7BOu4sxPMXdJfiLVMneItVfFCGwFo56Wa/n/AtzCcIPph4ooB/0J4B4Tl
TX8iXuqdDs2JCbLKY63rTaeREpqr9FWqhAuAcNDomAHyKR4L0s2pipxYKl/lnxUs
66O+gT26mPY5xIJLs65vhHcW66KF3H5+WcQPkLWjlMAHzSHR2SAW3T9/+35q49hi
pHjmB4QLlQ07PuKEEegKPiJ+VrlA+QvWRQWaIamLKdc1n78+frAMB847txwydyEJ
8TUu2nRIPgGQ8U+5d8pmQGu+umZWKnRVHmDHrqUgFmHALZOdKlwXr1iwDLLEzkU2
/p1CSgbJmasKlt0lBYxQcK9Y6hCVEA==
=LJIt
-----END PGP SIGNATURE-----

--=-fuYOTPP6aYp0NWwFpZMc--

--===============0415263563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0415263563==--
