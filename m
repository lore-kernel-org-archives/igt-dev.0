Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58A36E4AF
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2019 18:22:35 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Tue, 2 Apr 2019 18:22:33 +0000
Message-ID: <60168d80010b68c46291d42f6cae547345dc024a.camel@intel.com>
References: <1554216150-18709-1-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1554216150-18709-1-git-send-email-juhapekka.heikkila@gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_multiple: Before going
 testing check how many planes are allowed
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1310780900=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1310780900==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-uuPIWhABmwGSFFsKRoi2"

--=-uuPIWhABmwGSFFsKRoi2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-04-02 at 17:42 +0300, Juha-Pekka Heikkila wrote:
> Before start testing try out how many planes kernel will allow
> simultaneously to be used.
>=20
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_plane_multiple.c | 32 ++++++++++++++++++++++++++------
>  1 file changed, 26 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index bfaeede..5107d9d 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -260,7 +260,9 @@ test_plane_position_with_output(data_t *data,
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
> @@ -274,17 +276,35 @@ test_plane_position_with_output(data_t *data,
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
> +		prepare_planes(data, pipe, &blue, tiling, c, output);
> +		err =3D igt_display_try_commit2(&data->display,
> COMMIT_ATOMIC);
> +	} while (!err && c < n_planes);
> +
> +	if(err)
> +		c--;

"do {} while()" does the job but "for()" would be better suitable:

for (planes_allowed =3D 0; planes_allowed < n_planes; planes_allowed++) {
	int err;

	prepare_planes(data, pipe, &blue, tiling, planes_allowed,
output);
	err =3D igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
	if (err)
		break;
}


Also you are leaking a bunch o memory here, each call to
prepare_planes() will leak max_planes framebuffers, this could cause
test to fail due no GPU memory available.

Actually this test is already leaking a bunch as test_fini() is only
freeing the first framebuffer, there is other leaks here too like:
data->fb, prepare_planes().x, prepare_planes().y and
prepare_planes().size.

Can you take care of that too?


> +
> +	/*
> +	 * clean up failed state.
> +	 */
> +	for_each_plane_on_pipe(&data->display, pipe, plane)
> +		igt_plane_set_fb(plane, NULL);
> +
> +	igt_info("Testing connector %s using pipe %s with %d planes %s
> with seed %d\n",
> +		 igt_output_name(output), kmstest_pipe_name(pipe), c,
> +		 info, opt.seed);
> +
>  	i =3D 0;
> -	while (i < iterations || loop_forever) {
> -		prepare_planes(data, pipe, &blue, tiling, n_planes,
> output);
> +	while ((i < iterations || loop_forever) && c > 0) {

We actually want to fail the test if it can not even test one plane, so
add this before this while()

igt_assert_lt(0, planes_allowed);

> +		prepare_planes(data, pipe, &blue, tiling, c, output);
> =20
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> =20

--=-uuPIWhABmwGSFFsKRoi2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyjqGgACgkQVenbO/mO
Wkl0Agf/c4dY4bGqWS/BKEfYAZqLifEJp6QEjyM+TQnQHjhiO0nMMAIbWIDZkUmJ
4rsbQOvVCo90ZNFwSvF1RX1YLjBQlLZ8ffLRuO4CqDzArO64QmVzQSLSxkkrjr7c
fhgMq4Rxc2aot/E5b5XZABxGZnC4C1obKef/p6Z58yE93aurqH0kKVbfZE3ZvlNV
8Jm+kPWlGv5MweiuLJEcT+ZrzieEgla7s6MgE9l2tAalO+ZlBpNog3ffP8l7oR/7
CeiaVlp0TgthuSUT4A83FGXjSaMEJGchlzEGLu2ywL8GEJ1A/HsK7U4j7MiODh+z
ZV9JR+rHO9l/my4hewZwfnygz1owgg==
=vHsX
-----END PGP SIGNATURE-----

--=-uuPIWhABmwGSFFsKRoi2--

--===============1310780900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1310780900==--
