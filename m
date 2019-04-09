Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801098916D
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2019 01:51:55 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Tue, 9 Apr 2019 01:51:53 +0000
Message-ID: <8a87fd06b19a6dd64f3f642c8c06f175a0fa0874.camel@intel.com>
References: <20190405233118.23045-1-jose.souza@intel.com>
 <3e9a1daf60c3db34d9b6f02e6c884491a8646de6.camel@intel.com>
In-Reply-To: <3e9a1daf60c3db34d9b6f02e6c884491a8646de6.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] HAX: tests/kms_atomic_transition:
 Don't test more planes than memory bandwidth can support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1732768797=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1732768797==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-VVFaIg3qsphOndBEO2rd"

--=-VVFaIg3qsphOndBEO2rd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-04-08 at 10:47 +0100, Lisovskiy, Stanislav wrote:
> On Fri, 2019-04-05 at 16:31 -0700, Jos=C3=A9 Roberto de Souza wrote:
> > Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  tests/kms_atomic_transition.c | 217 ++++++++++++++++++++----------
> > ----
> >  1 file changed, 130 insertions(+), 87 deletions(-)
> >=20
> > diff --git a/tests/kms_atomic_transition.c
> > b/tests/kms_atomic_transition.c
> > index 18f73317..9988f303 100644
> > --- a/tests/kms_atomic_transition.c
> > +++ b/tests/kms_atomic_transition.c
> > @@ -40,9 +40,18 @@
> >  #define DRM_CAP_CURSOR_HEIGHT 0x9
> >  #endif
> > =20
>=20
> Also take a look here:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_2807/
>=20
> This code has just broken all kms_atomic_transition test
> cases for some platforms.=20
> You told that my patch has flaws, didn't explain which and then
> sent a patch which has more code, conditions, cycles and introducing
> problems... So why is it better?

I did not properly tested this it was more like a proof of concept,
that is why the "HAX" in the commit message.

It was more to show that we don't that first patch from your series at
all, we should not just skip the whole test iteration because because
wm_setup_plane() =3D=3D 0.

Fell free to take some ideas from this patch or not.

Anyways I found the problem and now it is passing:=20
https://patchwork.freedesktop.org/series/59191/

>=20
> > +enum group_type {
> > +	GROUP_TYPE_NONE =3D 0,
> > +	GROUP_TYPE_PRIMARY =3D 1 << 0,
> > +	GROUP_TYPE_CURSOR =3D 1 << 1,
> > +	GROUP_TYPE_OVERLAY =3D 1 << 2,
> > +	GROUP_TYPE_OVERLAY2 =3D 1 << 3
> > +};
> > +
> >  struct plane_parms {
> >  	struct igt_fb *fb;
> > -	uint32_t width, height, mask;
> > +	uint32_t width, height;
> > +	enum group_type mask;
> >  };
> > =20
> >  /* globals for fence support */
> > @@ -203,12 +212,11 @@ static void setup_parms(igt_display_t
> > *display,
> > enum pipe pipe,
> >  			unsigned *iter_max)
> >  {
> >  	uint64_t cursor_width, cursor_height;
> > -	unsigned sprite_width, sprite_height, prev_w, prev_h;
> > -	bool max_sprite_width, max_sprite_height, alpha =3D true;
> > -	uint32_t n_planes =3D display->pipes[pipe].n_planes;
> > -	uint32_t n_overlays =3D 0, overlays[n_planes];
> > +	uint32_t sprite_width, sprite_height, prev_w, prev_h;
> >  	igt_plane_t *plane;
> > -	uint32_t iter_mask =3D 3;
> > +	uint32_t iter_mask =3D 0, max_overlays, n_overlays =3D 0;
> > +	bool alpha =3D true;
> > +	int ret;
> > =20
> >  	do_or_die(drmGetCap(display->drm_fd, DRM_CAP_CURSOR_WIDTH,
> > &cursor_width));
> >  	if (cursor_width >=3D mode->hdisplay)
> > @@ -225,123 +233,156 @@ static void setup_parms(igt_display_t
> > *display, enum pipe pipe,
> >  			parms[i].fb =3D primary_fb;
> >  			parms[i].width =3D mode->hdisplay;
> >  			parms[i].height =3D mode->vdisplay;
> > -			parms[i].mask =3D 1 << 0;
> > +			parms[i].mask =3D GROUP_TYPE_PRIMARY;
> > +			iter_mask |=3D GROUP_TYPE_PRIMARY;
> >  		} else if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR) {
> >  			parms[i].fb =3D argb_fb;
> >  			parms[i].width =3D cursor_width;
> >  			parms[i].height =3D cursor_height;
> > -			parms[i].mask =3D 1 << 1;
> > +			parms[i].mask =3D GROUP_TYPE_CURSOR;
> > +			iter_mask |=3D GROUP_TYPE_CURSOR;
> >  		} else {
> >  			parms[i].fb =3D sprite_fb;
> > -			parms[i].mask =3D 1 << 2;
> > -
> > -			iter_mask |=3D 1 << 2;
> > -
> > -			overlays[n_overlays++] =3D i;
> > +			parms[i].mask =3D GROUP_TYPE_OVERLAY;
> > +			iter_mask |=3D GROUP_TYPE_OVERLAY;
> > +			n_overlays++;
> > +			if (alpha)
> > +				alpha =3D igt_plane_has_format_mod(plane,
> > +								 DRM_FO
> > RMAT_ARGB8888,
> > +								 LOCAL_
> > DRM_FORMAT_MOD_NONE);
> >  		}
> >  	}
> > =20
> > -	if (n_overlays >=3D 2) {
> > -		uint32_t i;
> > +	prev_w =3D sprite_width =3D cursor_width;
> > +	prev_h =3D sprite_height =3D cursor_height;
> > +
> > +	igt_create_fb(display->drm_fd, cursor_width, cursor_height,
> > +		      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
> > argb_fb);
> > +
> > +	igt_create_fb(display->drm_fd, sprite_width, sprite_height,
> > +		      alpha ? DRM_FORMAT_ARGB8888 :
> > DRM_FORMAT_XRGB8888,
> > +		      LOCAL_DRM_FORMAT_MOD_NONE, sprite_fb);
> > +
> > +	max_overlays =3D n_overlays;
> > +retry_bw:
> > +	/* Limit the number of planes */
> > +	while (max_overlays < n_overlays) {
> > +		int i =3D hars_petruska_f54_1_random_unsafe_max(display-
> > > pipes[pipe].n_planes);
> > =20
> >  		/*
> > -		 * Create 2 groups for overlays, make sure 1 plane is
> > put
> > -		 * in each then spread the rest out.
> > +		 * Always keep primary and cursor and discard already
> > +		 * removed planes
> >  		 */
> > -		iter_mask |=3D 1 << 3;
> > -		parms[overlays[n_overlays - 1]].mask =3D 1 << 3;
> > +		if (parms[i].mask !=3D GROUP_TYPE_OVERLAY)
> > +			continue;
> > =20
> > -		for (i =3D 1; i < n_overlays - 1; i++) {
> > -			int val =3D
> > hars_petruska_f54_1_random_unsafe_max(2);
> > +		parms[i].mask =3D GROUP_TYPE_NONE;
> > +		n_overlays--;
> > +	}
> > =20
> > -			parms[overlays[i]].mask =3D 1 << (2 + val);
> > -		}
> > +	/*
> > +	 * Check if there is enough bandwidth for the current number of
> > planes.
> > +	 * As the plane size and position is not taken into account we
> > can do
> > +	 * this earlier.
> > +	 */
> > +	set_sprite_wh(display, pipe, parms, sprite_fb, alpha,
> > sprite_width,
> > +		      sprite_height);
> > +	wm_setup_plane(display, pipe, iter_mask, parms, false);
> > +
> > +	/* It should be able to handle at least primary and cursor */
> > +	if (!max_overlays) {
> > +		iter_mask &=3D ~GROUP_TYPE_OVERLAY;
> > +		*iter_max =3D iter_mask + 1;
> > +		return;
> >  	}
> > =20
> > -	igt_create_fb(display->drm_fd, cursor_width, cursor_height,
> > -		      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
> > argb_fb);
> > +	ret =3D igt_display_try_commit_atomic(display,
> > DRM_MODE_ATOMIC_TEST_ONLY |
> > +					    DRM_MODE_ATOMIC_ALLOW_MODES
> > ET,
> > +					    NULL);
> > +	/*
> > +	 * Could mean other errors but this is also the error returned
> > when
> > +	 * there is not enough bandwidth for all the planes
> > +	 */
> > +	if (ret =3D=3D -EINVAL) {
> > +		max_overlays--;
> > +		goto retry_bw;
> > +	}
> > =20
> > -	igt_create_fb(display->drm_fd, cursor_width, cursor_height,
> > -		      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
> > sprite_fb);
> > +	igt_assert_f(!ret, "Error %i not expected by try_commit()\n",
> > ret);
> > =20
> > -	*iter_max =3D iter_mask + 1;
> > -	if (!n_overlays)
> > -		return;
> > +	/* So it have enough bandwidth for n_overlays planes */
> > =20
> >  	/*
> > -	 * Pre gen9 not all sizes are supported, find the biggest
> > possible
> > -	 * size that can be enabled on all sprite planes.
> > +	 * Create 2 groups for overlays, make sure 1 plane is put in
> > each then
> > +	 * spread the rest out.
> >  	 */
> > -retry:
> > -	prev_w =3D sprite_width =3D cursor_width;
> > -	prev_h =3D sprite_height =3D cursor_height;
> > +	iter_mask &=3D ~GROUP_TYPE_OVERLAY;
> > +	for_each_plane_on_pipe(display, pipe, plane) {
> > +		int i =3D plane->index;
> > =20
> > -	max_sprite_width =3D (sprite_width =3D=3D mode->hdisplay);
> > -	max_sprite_height =3D (sprite_height =3D=3D mode->vdisplay);
> > +		if (parms[i].mask !=3D GROUP_TYPE_OVERLAY)
> > +			continue;
> > =20
> > -	while (1) {
> > -		int ret;
> > +		/* First overlay plane will be overlay group 1 */
> > +		if (!(iter_mask & GROUP_TYPE_OVERLAY)) {
> > +			iter_mask |=3D GROUP_TYPE_OVERLAY;
> > +			continue;
> > +		}
> > =20
> > -		set_sprite_wh(display, pipe, parms, sprite_fb,
> > -			      alpha, sprite_width, sprite_height);
> > +		/* Second overlay plane will be overlay group 1 */
> > +		if (!(iter_mask & GROUP_TYPE_OVERLAY2)) {
> > +			iter_mask |=3D GROUP_TYPE_OVERLAY2;
> > +			parms[i].mask =3D GROUP_TYPE_OVERLAY2;
> > +			continue;
> > +		}
> > =20
> > -		wm_setup_plane(display, pipe, (1 << n_planes) - 1,
> > parms, false);
> > -		ret =3D igt_display_try_commit_atomic(display,
> > DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> > -		igt_assert(!is_atomic_check_failure_errno(ret));
> > +		/* Sort the group of the rest of overlay planes */
> > +		if (hars_petruska_f54_1_random_unsafe_max(2))
> > +			parms[i].mask =3D GROUP_TYPE_OVERLAY2;
> > +	}
> > =20
> > -		if (is_atomic_check_plane_size_errno(ret)) {
> > -			if (cursor_width =3D=3D sprite_width &&
> > -			    cursor_height =3D=3D sprite_height) {
> > -				igt_assert_f(alpha,
> > -					      "Cannot configure the
> > test with all sprite planes enabled\n");
> > -
> > -				/* retry once with XRGB format. */
> > -				alpha =3D false;
> > -				goto retry;
> > -			}
> > +	*iter_max =3D iter_mask + 1;
> > =20
> > +	/*
> > +	 * Pre gen9 not all sizes are supported, find the biggest
> > possible
> > +	 * size that can be enabled on all sprite planes.
> > +	 */
> > +	while (1) {
> > +		/* Size limit reached */
> > +		if (is_atomic_check_plane_size_errno(ret)) {
> >  			sprite_width =3D prev_w;
> >  			sprite_height =3D prev_h;
> > -
> > -			if (max_sprite_width && max_sprite_height) {
> > -				set_sprite_wh(display, pipe, parms,
> > sprite_fb,
> > -					      alpha, sprite_width,
> > sprite_height);
> > -				break;
> > -			}
> > -
> > -			if (!max_sprite_width)
> > -				max_sprite_width =3D true;
> > -			else
> > -				max_sprite_height =3D true;
> > -		} else {
> > -			prev_w =3D sprite_width;
> > -			prev_h =3D sprite_height;
> > +			break;
> >  		}
> > =20
> > -		if (!max_sprite_width) {
> > -			sprite_width *=3D 2;
> > +		/* Commit is valid and it reached max size, use this
> > size */
> > +		if (sprite_width =3D=3D mode->hdisplay ||
> > +		    sprite_height =3D=3D mode->vdisplay)
> > +			break;
> > =20
> > -			if (sprite_width >=3D mode->hdisplay) {
> > -				max_sprite_width =3D true;
> > +		prev_w =3D sprite_width;
> > +		prev_h =3D sprite_height;
> > =20
> > -				sprite_width =3D mode->hdisplay;
> > -			}
> > -		} else if (!max_sprite_height) {
> > -			sprite_height *=3D 2;
> > +		sprite_width *=3D 2;
> > +		if (sprite_width >=3D mode->hdisplay)
> > +			sprite_width =3D mode->hdisplay;
> > =20
> > -			if (sprite_height >=3D mode->vdisplay) {
> > -				max_sprite_height =3D true;
> > +		sprite_height *=3D 2;
> > +		if (sprite_height >=3D mode->vdisplay)
> > +			sprite_height =3D mode->vdisplay;
> > =20
> > -				sprite_height =3D mode->vdisplay;
> > -			}
> > -		} else
> > -			/* Max sized sprites for all! */
> > -			break;
> > +		set_sprite_wh(display, pipe, parms, sprite_fb,
> > sprite_width,
> > +			      sprite_height, alpha);
> > +		wm_setup_plane(display, pipe, iter_mask, parms, false);
> > +		ret =3D igt_display_try_commit_atomic(display,
> > +						    DRM_MODE_ATOMIC_TES
> > T_ONLY |
> > +						    DRM_MODE_ATOMIC_ALL
> > OW_MODESET,
> > +						    NULL);
> >  	}
> > =20
> > -	igt_info("Running test on pipe %s with resolution %dx%d and
> > sprite size %dx%d alpha %i\n",
> > +	igt_info("Running test on pipe %s with resolution %dx%d, sprite
> > size %dx%d, alpha %i and %i overlay planes\n",
> >  		 kmstest_pipe_name(pipe), mode->hdisplay, mode-
> > > vdisplay,
> > -		 sprite_width, sprite_height, alpha);
> > +		 sprite_width, sprite_height, alpha, n_overlays);
> >  }
> > =20
> >  static void prepare_fencing(igt_display_t *display, enum pipe
> > pipe)
> > @@ -519,8 +560,10 @@ run_transition_test(igt_display_t *display,
> > enum
> > pipe pipe, igt_output_t *output
> >  		}
> > =20
> >  		/* force planes to be part of commit */
> > -		for_each_plane_on_pipe(display, pipe, plane)
> > -			igt_plane_set_position(plane, 0, 0);
> > +		for_each_plane_on_pipe(display, pipe, plane) {
> > +			if (parms[plane->index].mask !=3D
> > GROUP_TYPE_NONE)
> > +				igt_plane_set_position(plane, 0, 0);
> > +		}
> > =20
> >  		igt_display_commit2(display, COMMIT_ATOMIC);
> > =20

--=-VVFaIg3qsphOndBEO2rd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyr+rgACgkQVenbO/mO
Wkns9AgAgXk8beUjfloNXPrWeKaj/lbyK1VLnL6SXhWQIAqk1D8NTEVyATh9JbkZ
q0QQlQK7AgK2TC6kuqPv1jekQ7z6yNK7OZQVSEA2GTjveG9tJDZwFlXcRC4fwCxL
UOUGYND9u93d8kr5sGrQr9TyuFS+GjqySYz1wdGs5+VlT94XI60QygmO9q32NVTc
n+PqYdqx4vT8criI6xf6fvAbLyCn5YRxrxvFk8uoDcZsuG7tfTatBzFNRGaQCPSb
1tbeB7DY3JUdRxq+ckhLIBsEwWPTzdtN5sjZvUBHBBD4B0veyCEkyClKbtyuGu9r
woJWLcqWWus8ri2mpiMz+8w9wdfJXg==
=DrOh
-----END PGP SIGNATURE-----

--=-VVFaIg3qsphOndBEO2rd--

--===============1732768797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1732768797==--
