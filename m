Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407B36E2A3
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Apr 2019 23:04:21 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Mon, 1 Apr 2019 23:04:18 +0000
Message-ID: <1bfa445cb5c65076f2070d53248a412ee7f4108d.camel@intel.com>
References: <20190401112305.6832-1-stanislav.lisovskiy@intel.com>
 <20190401112305.6832-2-stanislav.lisovskiy@intel.com>
In-Reply-To: <20190401112305.6832-2-stanislav.lisovskiy@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/3] igt/tests/kms_atomic_transition:
 Skip transition, if no changes done
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0715240789=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Cc: "Syrjala, Ville" <ville.syrjala@intel.com>, "Peres,
 Martin" <martin.peres@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0715240789==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-A9d7MjSHrE45a30LJvK4"

--=-A9d7MjSHrE45a30LJvK4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-04-01 at 14:23 +0300, Stanislav Lisovskiy wrote:
> While fixing used amount of planes, discovered that if
> wm_setup_plane is called with 0 planes(might happen during
> main testing cycle, as parms[i].mask can be 0 due to randomization)

I can't see how parms[i].mask can be 0, it always be one of: 1 << (0,
1, 2 or 3).

> then subsequent wait_transition fails in assertion on fd_completed.
> So added return value to wm_setup_plane, which would allow to
> determine, if we need to skip this step.
>=20
> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> ---
>  tests/kms_atomic_transition.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/kms_atomic_transition.c
> b/tests/kms_atomic_transition.c
> index 18f73317..638fe17e 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -118,11 +118,12 @@ static void configure_fencing(igt_plane_t
> *plane)
>  	igt_assert_eq(ret, 0);
>  }
> =20
> -static void
> +static int
>  wm_setup_plane(igt_display_t *display, enum pipe pipe,
>  	       uint32_t mask, struct plane_parms *parms, bool fencing)
>  {
>  	igt_plane_t *plane;
> +	int planes_set_up =3D 0;
> =20
>  	/*
>  	* Make sure these buffers are suited for display use
> @@ -133,8 +134,10 @@ wm_setup_plane(igt_display_t *display, enum pipe
> pipe,
>  		int i =3D plane->index;
> =20
>  		if (!mask || !(parms[i].mask & mask)) {
> -			if (plane->values[IGT_PLANE_FB_ID])
> +			if (plane->values[IGT_PLANE_FB_ID]) {
>  				igt_plane_set_fb(plane, NULL);
> +				planes_set_up++;
> +			}
>  			continue;
>  		}
> =20
> @@ -144,7 +147,10 @@ wm_setup_plane(igt_display_t *display, enum pipe
> pipe,
>  		igt_plane_set_fb(plane, parms[i].fb);
>  		igt_fb_set_size(parms[i].fb, plane, parms[i].width,
> parms[i].height);
>  		igt_plane_set_size(plane, parms[i].width,
> parms[i].height);
> +
> +		planes_set_up++;
>  	}
> +	return planes_set_up;
>  }
> =20
>  static void ev_page_flip(int fd, unsigned seq, unsigned tv_sec,
> unsigned tv_usec, void *user_data)
> @@ -544,7 +550,8 @@ run_transition_test(igt_display_t *display, enum
> pipe pipe, igt_output_t *output
> =20
>  		igt_output_set_pipe(output, pipe);
> =20
> -		wm_setup_plane(display, pipe, i, parms, fencing);
> +		if (!wm_setup_plane(display, pipe, i, parms, fencing))
> +			continue;
> =20
>  		atomic_commit(display, pipe, flags, (void *)(unsigned
> long)i, fencing);
>  		wait_for_transition(display, pipe, nonblocking,
> fencing);
> @@ -552,7 +559,8 @@ run_transition_test(igt_display_t *display, enum
> pipe pipe, igt_output_t *output
>  		if (type =3D=3D TRANSITION_MODESET_DISABLE) {
>  			igt_output_set_pipe(output, PIPE_NONE);
> =20
> -			wm_setup_plane(display, pipe, 0, parms,
> fencing);
> +			if (!wm_setup_plane(display, pipe, 0, parms,
> fencing))
> +				continue;
> =20
>  			atomic_commit(display, pipe, flags, (void *)
> 0UL, fencing);
>  			wait_for_transition(display, pipe, nonblocking,
> fencing);
> @@ -568,7 +576,8 @@ run_transition_test(igt_display_t *display, enum
> pipe pipe, igt_output_t *output
>  				    n_enable_planes < pipe_obj-
> >n_planes)
>  					continue;
> =20
> -				wm_setup_plane(display, pipe, j, parms,
> fencing);
> +				if (!wm_setup_plane(display, pipe, j,
> parms, fencing))
> +					continue;
> =20
>  				if (type >=3D TRANSITION_MODESET)
>  					igt_output_override_mode(output
> , &override_mode);
> @@ -576,7 +585,9 @@ run_transition_test(igt_display_t *display, enum
> pipe pipe, igt_output_t *output
>  				atomic_commit(display, pipe, flags,
> (void *)(unsigned long) j, fencing);
>  				wait_for_transition(display, pipe,
> nonblocking, fencing);
> =20
> -				wm_setup_plane(display, pipe, i, parms,
> fencing);
> +				if (!wm_setup_plane(display, pipe, i,
> parms, fencing))
> +					continue;
> +
>  				if (type >=3D TRANSITION_MODESET)
>  					igt_output_override_mode(output
> , NULL);
> =20

--=-A9d7MjSHrE45a30LJvK4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyimPAACgkQVenbO/mO
WknQnwf9HpZ1Btg97UReLoo0TdUBh2WE/dX8rrAtpCrfGJ3sb0baVPmrgRrpoQ4C
qOFaS8xDX4veRFqZqYlSMnGFrryW47rgxI1gpVpbBIs+HQSDC4oDSl+PiJAijZFo
FU7JQgG1UozCUfT3FiZcUFsfy5S9sfetPWx61o18vaTPeHM3lJ6ASufTMjDhbWsx
+D9z4GXDykRBWlGGdbqv523gRFnQLsffrHCujTF0qT8zunLtQrQ0xF326Jkc/eaw
4qS+qeMrajykLcha6u6BGdQQL/oYVjP/AjKFP1iwcXCbxrD/F7VXdu8wDz63GhV8
coRtY7+6qondtp5QSCwmVOXl8SfYKQ==
=BtfA
-----END PGP SIGNATURE-----

--=-A9d7MjSHrE45a30LJvK4--

--===============0715240789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0715240789==--
