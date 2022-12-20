Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6008110E0A9
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Dec 2022 11:56:39 +0000 (UTC)
Date: Tue, 20 Dec 2022 10:55:44 -0100
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>
Message-ID: <20221220115544.ytkcz3jyfobkg3rm@mail.igalia.com>
References: <20221219192150.1497674-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6npe3frr3fcvjw7i"
Content-Disposition: inline
In-Reply-To: <20221219192150.1497674-1-alex.hung@amd.com>
Subject: Re: [igt-dev] [PATCH] tests/kms_color: Reduce skips on some ctm-*
 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--6npe3frr3fcvjw7i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 12/19, Alex Hung wrote:
> 64d0ff72 introduced a workaround for ctm-max but the condition caused
> other ctm tests to skip unintentionally on some platforms.

Hi Alex,

Can't we just drop this gamma/degamma setup for CTM tests?

I remember thinking about removing this setup before... From DRM docs,
"Each of the properties are optional." so I don't see an explicity
reason for degamma/gamma dependencies. I think we should only test the
CTM property here, or change the name of the subtest to describe a full
color mgmt testing.

I took a look at previous discussions on having or not degamma/gamma
here and if it's an intel limitation, than I prefer to explicitly
restrict it for i915 HW. What do you think?

Best regards,

Melissa

>=20
> The patch improves the condition by keeping the original condition
> for i915 and checking degamma and gamma props for others. The
> following subtests will be executed instead of skipped.
>=20
>   kms_color@ctm-0-25@*
>   kms_color@ctm-0-50@*
>   kms_color@ctm-0-75@*
>   kms_color@ctm-red-to-blue@*
>   kms_color@ctm-negative@*
>=20
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/kms_color.c | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)
>=20
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index d016cefb..450bf7ca 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -446,6 +446,26 @@ end:
>  	return ret;
>  }
> =20
> +static bool is_gamma_degamma_supported(data_t *data,
> +				       igt_plane_t *primary,
> +				       color_t *before,
> +				       color_t *after)
> +{
> +	/*
> +	 * Don't program LUT's for max CTM cases, as limitation of
> +	 * representing intermediate values between 0 and 1.0 causes
> +	 * rounding issues and inaccuracies leading to crc mismatch.
> +	 */
> +	if (is_i915_device(data->drm_fd) && memcmp(before, after, sizeof(color_=
t)))
> +		return true;
> +
> +	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT) &&
> +	    igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT))
> +		return true;
> +
> +	return false;
> +}
> +
>  /*
>   * Draw 3 rectangles using before colors with the ctm matrix apply and v=
erify
>   * the CRC is equal to using after colors with an identify ctm matrix.
> @@ -493,14 +513,7 @@ static bool test_pipe_ctm(data_t *data,
>  	igt_assert(fb_modeset_id);
>  	igt_plane_set_fb(primary, &fb_modeset);
> =20
> -	/*
> -	 * Don't program LUT's for max CTM cases, as limitation of
> -	 * representing intermediate values between 0 and 1.0 causes
> -	 * rounding issues and inaccuracies leading to crc mismatch.
> -	 */
> -	if (memcmp(before, after, sizeof(color_t))) {
> -		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT)=
);
> -		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
> +	if (is_gamma_degamma_supported(data, primary, before, after)) {
> =20
>  		degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
>  		gamma_linear =3D generate_table(data->gamma_lut_size, 1.0);
> @@ -508,7 +521,6 @@ static bool test_pipe_ctm(data_t *data,
>  		set_degamma(data, primary->pipe, degamma_linear);
>  		set_gamma(data, primary->pipe, gamma_linear);
>  	} else {
> -		/* Disable Degamma and Gamma for ctm max test */
>  		disable_degamma(primary->pipe);
>  		disable_gamma(primary->pipe);
>  	}
> --=20
> 2.25.1
>=20

--6npe3frr3fcvjw7i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmOhorsACgkQwqF3j0dL
ehwxHg/+J0fbxHCKiWMVT8TVBbaypwBcbg9HcdzuaVl6dXFtUPVTeqXtgoahoGBO
R2NGbu7BGTzXW0jaScI1AuLehkNbyMrBkJ3gsBYVix4R0d5RxUm7zLe1evFcTUov
EDc8N8v8/0Zk7Sp5Y+V0wNpq2v4baEhzqhTlskPPL7T7DHJmqXZTQXUrPzl+bs+8
8asor/iy9f6Sbq9g4uUAhw1QpfkgLMrDHTRjMpQFq6VJ6mch2fDDg2SkgeFMJZZi
66mqHZREtID5F6Clp3KxlZrZ8Wf6+8Fem0s9CEcfLbVlQc6ZK2LhtbkvIy/3vciR
2CxePJFObWhW32Ni9o5S3U5OP0U9EYYOW+wD3Z/QfmuaR9NyxikJrBxsUKDtHWYi
3GjzsSeIhE024M8KbFA2NIohDYWJtHcyg2z+bAGlNslobauFDKAC3fuDqV2cPtDk
fHHFDtIG1yMKGrDOMfiBaV3xJOSiPOb/bL7LldS87cHZVFabu9WZ2scZlWLmLCiD
cA1LE9yl8Ot7omF6bRc4DMdWnpWUwGQESR75oFqR6JzuPvAcAqNyK8AdxwXUa6PI
sVDYvbwwKoylE35QETPt0MojFhUAmGbKhmPTO/Fg2rWpUWQGeG2bNfN353C7A/Qg
XWeqnbw4806qJmuNqqeX/nt30O7LxgJ//DugjV06mkzloa8gweQ=
=nzct
-----END PGP SIGNATURE-----

--6npe3frr3fcvjw7i--
