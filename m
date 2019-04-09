Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1538915E
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2019 01:29:49 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Tue, 9 Apr 2019 01:29:48 +0000
Message-ID: <6525db62bc81dd968bb17da7106354545d3429af.camel@intel.com>
References: <1554476159-25312-1-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1554476159-25312-1-git-send-email-juhapekka.heikkila@gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_multiple: before going
 testing check how many planes are allowed
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0467488941=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0467488941==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-zdHHJGC6hZ00U7zw/0LC"

--=-zdHHJGC6hZ00U7zw/0LC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-04-05 at 17:55 +0300, Juha-Pekka Heikkila wrote:
> before start testing try out how many planes kernel will
> allow simultaneously to be used.
>=20
> v2 (Jose Souza, Daniel Vetter): Fix resource leaks. Randomize
> used planes.
>=20
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_plane_multiple.c | 88
> +++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 71 insertions(+), 17 deletions(-)
>=20
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index bfaeede..f2707dc 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -80,16 +80,6 @@ static void test_fini(data_t *data, igt_output_t
> *output, int n_planes)
>  {
>  	igt_pipe_crc_stop(data->pipe_crc);
> =20
> -	for (int i =3D 0; i < n_planes; i++) {
> -		igt_plane_t *plane =3D data->plane[i];
> -		if (!plane)
> -			continue;
> -		if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> -			continue;
> -		igt_plane_set_fb(plane, NULL);
> -		data->plane[i] =3D NULL;
> -	}
> -
>  	/* reset the constraint on the pipe */
>  	igt_output_set_pipe(output, PIPE_ANY);
> =20
> @@ -99,7 +89,8 @@ static void test_fini(data_t *data, igt_output_t
> *output, int n_planes)
>  	free(data->plane);
>  	data->plane =3D NULL;
> =20
> -	igt_remove_fb(data->drm_fd, data->fb);
> +	free(data->fb);
> +	data->fb =3D NULL;
> =20
>  	igt_display_reset(&data->display);
>  }
> @@ -195,6 +186,7 @@ prepare_planes(data_t *data, enum pipe pipe_id,
> color_t *color,
>  	int *y;
>  	int *size;
>  	int i;
> +	int* suffle;
> =20
>  	igt_output_set_pipe(output, pipe_id);
>  	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> @@ -206,6 +198,34 @@ prepare_planes(data_t *data, enum pipe pipe_id,
> color_t *color,
>  	igt_assert_f(y, "Failed to allocate %ld bytes for variable
> y\n", (long int) (pipe->n_planes * sizeof(*y)));
>  	size =3D malloc(pipe->n_planes * sizeof(*size));
>  	igt_assert_f(size, "Failed to allocate %ld bytes for variable
> size\n", (long int) (pipe->n_planes * sizeof(*size)));
> +	suffle =3D malloc(pipe->n_planes * sizeof(*suffle));
> +	igt_assert_f(suffle, "Failed to allocate %ld bytes for variable
> size\n", (long int) (pipe->n_planes * sizeof(*suffle)));
> +
> +	for (i =3D 0; i < pipe->n_planes; i++)
> +		suffle[i] =3D i;
> +
> +	/*
> +	 * suffle table for planes. using rand() should keep it
> +	 * 'randomized in expected way'
> +	 */
> +	for (i =3D 0; i < 256; i++) {

Not beautiful at all

> +		int n, m;
> +		int a, b;
> +
> +		n =3D rand() % (pipe->n_planes-1);
> +		m =3D rand() % (pipe->n_planes-1);
> +
> +		/*
> +		 * keep primary plane at its place for test's sake.
> +		 */
> +		if(n =3D=3D primary->index || m =3D=3D primary->index)
> +			continue;
> +
> +		a =3D suffle[n];
> +		b =3D suffle[m];
> +		suffle[n] =3D b;
> +		suffle[m] =3D a;
> +	}
> =20
>  	mode =3D igt_output_get_mode(output);
> =20
> @@ -213,7 +233,11 @@ prepare_planes(data_t *data, enum pipe pipe_id,
> color_t *color,
>  	x[primary->index] =3D 0;
>  	y[primary->index] =3D 0;
>  	for (i =3D 0; i < max_planes; i++) {
> -		igt_plane_t *plane =3D igt_output_get_plane(output, i);
> +		/*
> +		 * Here is made assumption primary plane will have
> +		 * index zero.
> +		 */
> +		igt_plane_t *plane =3D igt_output_get_plane(output,
> suffle[i]);
>  		uint32_t plane_format;
>  		uint64_t plane_tiling;
> =20
> @@ -251,6 +275,10 @@ prepare_planes(data_t *data, enum pipe pipe_id,
> color_t *color,
>  	create_fb_for_mode_position(data, output, mode, color, x, y,
>  				    size, size, tiling, max_planes);
>  	igt_plane_set_fb(data->plane[primary->index], &data-
> >fb[primary->index]);
> +	free((void*)x);
> +	free((void*)y);
> +	free((void*)size);
> +	free((void*)suffle);
>  }
> =20
>  static void
> @@ -260,7 +288,9 @@ test_plane_position_with_output(data_t *data,
> enum pipe pipe,
>  {
>  	color_t blue  =3D { 0.0f, 0.0f, 1.0f };
>  	igt_crc_t crc;
> +	igt_plane_t *plane;
>  	int i;
> +	int err, c =3D 0;
>  	int iterations =3D opt.iterations < 1 ? 1 : opt.iterations;
>  	bool loop_forever;
>  	char info[256];
> @@ -274,22 +304,46 @@ test_plane_position_with_output(data_t *data,
> enum pipe pipe,
>  			iterations, iterations > 1 ? "iterations" :
> "iteration");
>  	}
> =20
> -	igt_info("Testing connector %s using pipe %s with %d planes %s
> with seed %d\n",
> -		 igt_output_name(output), kmstest_pipe_name(pipe),
> n_planes,
> -		 info, opt.seed);
> -
>  	test_init(data, pipe, n_planes);
> =20
>  	test_grab_crc(data, output, pipe, &blue, tiling);
> =20
> +	/*
> +	 * Find out how many planes are allowed simultaneously
> +	 */
> +	do {
> +		c++;

Adding one plane at time is a waste of CI time in platforms without a
high number of planes(anything besides ICL), better start with max and
decreasing until commit is accepted.

> +		prepare_planes(data, pipe, &blue, tiling, c, output);
> +		err =3D igt_display_try_commit2(&data->display,
> COMMIT_ATOMIC);

No need to do a real commit here, you can only test with:

err =3D igt_display_try_commit_atomic(&data->display,
DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);


Also if a err different than -EINVAL is returned you should handle like
a error.

> +
> +		for_each_plane_on_pipe(&data->display, pipe, plane)
> +			igt_plane_set_fb(plane, NULL);
> +
> +		for (int x =3D 0; x < c; x++)
> +			igt_remove_fb(data->drm_fd, &data->fb[x]);

This is still leaking, example:

c =3D 3
plane 0, plane 1 and plane 3 enabled

Other leak, the framebuffer created in test_grab_crc()


> +	} while (!err && c < n_planes);
> +
> +	if(err)
> +		c--;
> +
> +	igt_info("Testing connector %s using pipe %s with %d planes %s
> with seed %d\n",
> +		 igt_output_name(output), kmstest_pipe_name(pipe), c,
> +		 info, opt.seed);
> +
>  	i =3D 0;
>  	while (i < iterations || loop_forever) {
> -		prepare_planes(data, pipe, &blue, tiling, n_planes,
> output);
> +		prepare_planes(data, pipe, &blue, tiling, c, output);
> =20
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> =20
>  		igt_pipe_crc_get_current(data->display.drm_fd, data-
> >pipe_crc, &crc);
> =20
> +		for_each_plane_on_pipe(&data->display, pipe, plane)
> +			igt_plane_set_fb(plane, NULL);
> +
> +		for (int x =3D 0; x < c; x++)
> +			igt_remove_fb(data->drm_fd, &data->fb[x]);

move this cleanup to function and call it here and where you test the
number of planes that can be enabled

> +
>  		igt_assert_crc_equal(&data->ref_crc, &crc);
> =20
>  		i++;

--=-zdHHJGC6hZ00U7zw/0LC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyr9YsACgkQVenbO/mO
WknXxwgAlGY54swn2VjWPGDphDJelYAGN8KOS+YNj0sHATU9l4EydPrb0jQ3+x8H
ZzGIJQHh+iMhSalh1cBm1g0E6iZa3maF+Ugfi3AP3zGFyJtTSC7g6TCP6j+712Jf
DL5TpV2Yis1E9kwY8mLIc1GOeLbYChfjZ8pzwPoHMxUn/9ztqt+RbLutRmJgcQ/V
IP0AtQQQPkIOO7G7E90/uBmPkFY8S22ntUMADl83eIaySQjNQVJEIFoG6H++DLe4
YTBnRwkMSQ295U4eInpNKoYXnzFr9X6tRupjrv7ydG6lMNf8Gt+GtF4MAZ/jpvAO
2nzFNlD/vznG7ywbu8Jmf7NviSK47w==
=BGxj
-----END PGP SIGNATURE-----

--=-zdHHJGC6hZ00U7zw/0LC--

--===============0467488941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0467488941==--
