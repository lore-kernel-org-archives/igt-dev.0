Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDACE89D7D
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2019 23:46:03 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Fri, 5 Apr 2019 23:45:56 +0000
Message-ID: <41a03061ffed75fc1c9e2358e23a752452ce96ee.camel@intel.com>
References: <20190404121359.3339-1-stanislav.lisovskiy@intel.com>
 <20190404121359.3339-2-stanislav.lisovskiy@intel.com>
 <1a2d6cfe32a1b292df36b2bc1f8f7e893fac33f1.camel@intel.com>
 <596e89a28dc4640fc3840bcb91266377dd42aff1.camel@intel.com>
In-Reply-To: <596e89a28dc4640fc3840bcb91266377dd42aff1.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v5 1/2] igt/tests/kms_atomic_transition:
 Skip transition, if no changes done
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0479422841=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Cc: "Syrjala, Ville" <ville.syrjala@intel.com>, "Peres,
 Martin" <martin.peres@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0479422841==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-dbyZ9Dv74KZ9tEL6GIVn"

--=-dbyZ9Dv74KZ9tEL6GIVn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-04-05 at 07:50 +0100, Lisovskiy, Stanislav wrote:
> On Thu, 2019-04-04 at 15:55 -0700, Souza, Jose wrote:
> > On Thu, 2019-04-04 at 15:13 +0300, Stanislav Lisovskiy wrote:
> > > While fixing used amount of planes, discovered that if
> > > wm_setup_plane is called with 0 planes(might happen during
> > > main testing cycle, as parms[i].mask can be 0 due to
> > > randomization)
> >=20
> > As already said and you agreed this 'as parms[i].mask can be 0 due
> > to
> > randomization' statement is not true, even if this patch is right
> > the
> > commit message needs to be true.
> >=20
>=20
> I will fix the commit message, you are right parms[i].mask can't be
> true. But parms[i].mask & mask parameter can be easily. The function
> user should be able to check if no changes are actually done.
> Otherwise
> run_transition will timeout on fd_completed call.
>=20
> > For me this patch is only hidden the real bug.
>=20
> Sorry, what do you mean by "real bug"?=20
>=20

Take a look here: https://patchwork.freedesktop.org/series/59086/

It don't need anything like this patch and fixed the ICL BW issue,
something is wrong in the next patch and this patch was only hiding it.


> > > then subsequent wait_transition fails in assertion on
> > > fd_completed.
> > > So added return value to wm_setup_plane, which would allow to
> > > determine, if we need to skip this step.
> > >=20
> > > Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com
> > > >
> > > ---
> > >  tests/kms_atomic_transition.c | 23 +++++++++++++++++------
> > >  1 file changed, 17 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/tests/kms_atomic_transition.c
> > > b/tests/kms_atomic_transition.c
> > > index 18f73317..638fe17e 100644
> > > --- a/tests/kms_atomic_transition.c
> > > +++ b/tests/kms_atomic_transition.c
> > > @@ -118,11 +118,12 @@ static void configure_fencing(igt_plane_t
> > > *plane)
> > >  	igt_assert_eq(ret, 0);
> > >  }
> > > =20
> > > -static void
> > > +static int
> > >  wm_setup_plane(igt_display_t *display, enum pipe pipe,
> > >  	       uint32_t mask, struct plane_parms *parms, bool fencing)
> > >  {
> > >  	igt_plane_t *plane;
> > > +	int planes_set_up =3D 0;
> > > =20
> > >  	/*
> > >  	* Make sure these buffers are suited for display use
> > > @@ -133,8 +134,10 @@ wm_setup_plane(igt_display_t *display, enum
> > > pipe
> > > pipe,
> > >  		int i =3D plane->index;
> > > =20
> > >  		if (!mask || !(parms[i].mask & mask)) {
> > > -			if (plane->values[IGT_PLANE_FB_ID])
> > > +			if (plane->values[IGT_PLANE_FB_ID]) {
> > >  				igt_plane_set_fb(plane, NULL);
> > > +				planes_set_up++;
> > > +			}
> > >  			continue;
> > >  		}
> > > =20
> > > @@ -144,7 +147,10 @@ wm_setup_plane(igt_display_t *display, enum
> > > pipe
> > > pipe,
> > >  		igt_plane_set_fb(plane, parms[i].fb);
> > >  		igt_fb_set_size(parms[i].fb, plane, parms[i].width,
> > > parms[i].height);
> > >  		igt_plane_set_size(plane, parms[i].width,
> > > parms[i].height);
> > > +
> > > +		planes_set_up++;
> > >  	}
> > > +	return planes_set_up;
> > >  }
> > > =20
> > >  static void ev_page_flip(int fd, unsigned seq, unsigned tv_sec,
> > > unsigned tv_usec, void *user_data)
> > > @@ -544,7 +550,8 @@ run_transition_test(igt_display_t *display,
> > > enum
> > > pipe pipe, igt_output_t *output
> > > =20
> > >  		igt_output_set_pipe(output, pipe);
> > > =20
> > > -		wm_setup_plane(display, pipe, i, parms, fencing);
> > > +		if (!wm_setup_plane(display, pipe, i, parms, fencing))
> > > +			continue;
> > > =20
> > >  		atomic_commit(display, pipe, flags, (void *)(unsigned
> > > long)i, fencing);
> > >  		wait_for_transition(display, pipe, nonblocking,
> > > fencing);
> > > @@ -552,7 +559,8 @@ run_transition_test(igt_display_t *display,
> > > enum
> > > pipe pipe, igt_output_t *output
> > >  		if (type =3D=3D TRANSITION_MODESET_DISABLE) {
> > >  			igt_output_set_pipe(output, PIPE_NONE);
> > > =20
> > > -			wm_setup_plane(display, pipe, 0, parms,
> > > fencing);
> > > +			if (!wm_setup_plane(display, pipe, 0, parms,
> > > fencing))
> > > +				continue;
> > > =20
> > >  			atomic_commit(display, pipe, flags, (void *)
> > > 0UL, fencing);
> > >  			wait_for_transition(display, pipe, nonblocking,
> > > fencing);
> > > @@ -568,7 +576,8 @@ run_transition_test(igt_display_t *display,
> > > enum
> > > pipe pipe, igt_output_t *output
> > >  				    n_enable_planes < pipe_obj-
> > > > n_planes)
> > >=20
> > >  					continue;
> > > =20
> > > -				wm_setup_plane(display, pipe, j, parms,
> > > fencing);
> > > +				if (!wm_setup_plane(display, pipe, j,
> > > parms, fencing))
> > > +					continue;
> > > =20
> > >  				if (type >=3D TRANSITION_MODESET)
> > >  					igt_output_override_mode(output
> > > , &override_mode);
> > > @@ -576,7 +585,9 @@ run_transition_test(igt_display_t *display,
> > > enum
> > > pipe pipe, igt_output_t *output
> > >  				atomic_commit(display, pipe, flags,
> > > (void *)(unsigned long) j, fencing);
> > >  				wait_for_transition(display, pipe,
> > > nonblocking, fencing);
> > > =20
> > > -				wm_setup_plane(display, pipe, i, parms,
> > > fencing);
> > > +				if (!wm_setup_plane(display, pipe, i,
> > > parms, fencing))
> > > +					continue;
> > > +
> > >  				if (type >=3D TRANSITION_MODESET)
> > >  					igt_output_override_mode(output
> > > , NULL);
> > > =20

--=-dbyZ9Dv74KZ9tEL6GIVn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyn6LMACgkQVenbO/mO
Wkm8vAf/R7sqLcdqXCnqzub/i9FLaQ/C6OnRxu0b+iC9im0WMdhClrI6HfjZNrHl
J1W8xKXfdVxgxWmFFrKj3qdbWdF89fVmLR+bjXi25o56p2nr5zpX7LnH3s9BWDU8
QXsKB35oC+h3q9Qe9L+2pF196zmCtPxb8vaPMEJw6hDqNanB/g8yMJ7vwnIC6NB5
AJ+QE41IwMbNHFGchjYaM08KgaekgcYQqI6mE4n2ykBz5TFnY3K0QvfF5DnLqA0c
AcBJErHM7tbiOagRbZ6eDqU7c0C/MI4eyqNADMuMuRMDXcep38NhMnmsf9DbEpiL
t7bW1XMIcOK+ABWGzNYH6CtiGvck4A==
=WrFR
-----END PGP SIGNATURE-----

--=-dbyZ9Dv74KZ9tEL6GIVn--

--===============0479422841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0479422841==--
