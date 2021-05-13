Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19D96E04E
 for <igt-dev@lists.freedesktop.org>; Thu, 13 May 2021 21:17:02 +0000 (UTC)
Date: Thu, 13 May 2021 17:16:58 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210513211658.tkx23qdmqciptexx@outlook.office365.com>
References: <20210513145352.2790280-1-markyacoub@chromium.org>
In-Reply-To: <20210513145352.2790280-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_panel_fitting: Move Intel GEN check
 under a is_i915_device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0627720727=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: petri.latvala@intel.com, igt-dev@lists.freedesktop.org, seanpaul@chromium.org, hersenxs.wu@amd.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0627720727==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mnyikhpctl2rsofm"
Content-Disposition: inline

--mnyikhpctl2rsofm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/13, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
>=20
> Encapsulate intel-only operations such as intel_get_drm_devid under a is_=
i915_device check.
>=20
> This allows the subtests to run on non-i915 devices.
> ---
>  tests/kms_panel_fitting.c | 61 +++++++++++++++++++++++----------------
>  1 file changed, 36 insertions(+), 25 deletions(-)
>=20
> diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
> index 4f4c5608..0c028c69 100644
> --- a/tests/kms_panel_fitting.c
> +++ b/tests/kms_panel_fitting.c
> @@ -89,7 +89,7 @@ static void test_panel_fitting(data_t *d)
> =20
>  	for_each_pipe_with_valid_output(display, pipe, output) {
>  		drmModeModeInfo *mode, native_mode;
> -		uint32_t devid =3D intel_get_drm_devid(display->drm_fd);
> +		bool is_plane_scaling_active =3D true;
> =20
>  		/* Check that the "scaling mode" property has been set. */
>  		if (!igt_output_has_prop(output, IGT_CONNECTOR_SCALING_MODE))
> @@ -132,25 +132,26 @@ static void test_panel_fitting(data_t *d)
>  		igt_fb_set_size(&d->fb2, d->plane2, d->fb2.width-200, d->fb2.height-20=
0);
>  		igt_plane_set_position(d->plane2, 100, 100);
> =20
> -		/*
> -		 * Most of gen7 and all of gen8 doesn't support plane scaling
> -		 * at all.
> -		 *
> -		 * gen9 pipe C has only 1 scaler shared with the crtc, which
> -		 * means pipe scaling can't work simultaneously with panel
> -		 * fitting.
> -		 *
> -		 * Since this is the legacy path, userspace has to know about
> -		 * the HW limitations, whereas atomic can ask.
> -		 */
> -		if (IS_GEN8(devid) ||
> -		    (IS_GEN7(devid) && !IS_IVYBRIDGE(devid)) ||
> -		    (IS_GEN9(devid) && pipe =3D=3D PIPE_C))
> -			/* same as visible area of fb =3D> no scaling */
> -			igt_plane_set_size(d->plane2,
> -					   d->fb2.width-200,
> -					   d->fb2.height-200);
> -		else
> +		if (is_i915_device(display->drm_fd)) {
> +			uint32_t devid =3D intel_get_drm_devid(display->drm_fd);
> +			/*
> +			 * Most of gen7 and all of gen8 doesn't support plane scaling
> +			 * at all.
> +			 *
> +			 * gen9 pipe C has only 1 scaler shared with the crtc, which
> +			 * means pipe scaling can't work simultaneously with panel
> +			 * fitting.
> +			 *
> +			 * Since this is the legacy path, userspace has to know about
> +			 * the HW limitations, whereas atomic can ask.
> +			 */
> +			if (IS_GEN8(devid) ||
> +				(IS_GEN7(devid) && !IS_IVYBRIDGE(devid)) ||
> +				(IS_GEN9(devid) && pipe =3D=3D PIPE_C)) {
> +				is_plane_scaling_active =3D false;
> +			}
> +		}
> +		if (is_plane_scaling_active) {
>  			/*
>  			 * different than visible area of fb =3D> plane scaling
>  			 * active
> @@ -158,6 +159,13 @@ static void test_panel_fitting(data_t *d)
>  			igt_plane_set_size(d->plane2,
>  					   mode->hdisplay-200,
>  					   mode->vdisplay-200);
> +		}
> +		else {
> +			/* same as visible area of fb =3D> no scaling */
> +			igt_plane_set_size(d->plane2,
> +				d->fb2.width - 200,
> +				d->fb2.height - 200);
> +		}
> =20
>  		/* Plane scaling active (if possible), pfit off */
>  		igt_display_commit2(display, COMMIT_UNIVERSAL);
> @@ -229,13 +237,16 @@ static void test_atomic_fastset(data_t *data)
>  	int valid_tests =3D 0;
>  	struct stat sb;
> =20
> -	/* Until this is force enabled, force modeset evasion. */
> -	if (stat("/sys/module/i915/parameters/fastboot", &sb) =3D=3D 0)
> -		igt_set_module_param_int(data->drm_fd, "fastboot", 1);
> =20
> -	igt_require(display->is_atomic);
> -	igt_require(intel_gen(intel_get_drm_devid(display->drm_fd)) >=3D 5);
> +	if (is_i915_device(display->drm_fd)) {
> +		/* Until this is force enabled, force modeset evasion. */
> +		if (stat("/sys/module/i915/parameters/fastboot", &sb) =3D=3D 0)
> +			igt_set_module_param_int(data->drm_fd, "fastboot", 1);
> =20
> +		igt_require(intel_gen(intel_get_drm_devid(display->drm_fd)) >=3D 5);
> +	}
> +
> +	igt_require(display->is_atomic);
>  	for_each_pipe_with_valid_output(display, pipe, output) {
>  		if (!igt_output_has_prop(output, IGT_CONNECTOR_SCALING_MODE))
>  			continue;
> --=20
> 2.31.1.607.g51e8a6a459-goog
>=20

Hi Mark,

I tested it in a Raven system, and now I can see it failing in a good
way in my system. Nice patch, thanks.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

--=20
Rodrigo Siqueira
https://siqueira.tech

--mnyikhpctl2rsofm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmCdl0UACgkQWJzP/com
vP8bzQ/+Ih7mrwGmj+dm5C/UHkVEgcIxoko//9mtjYSqnXuvdPrKggc3vZ8OYw35
a3VRdO2H4DLjuQKrmQ+Z4pOrzlTaB3SGeuhi3NeBygLZdKt/X7/5PrKwd05s/mPX
GnpgOlhOGq9fDhJ2G9hJMqqSHf2szkRsWwdfxdxgzmefuln7k1CXN4Ny3fJXzJTv
IEUoegp24x/8da9xQHcdXgZ9DU+unHOn86wu8oSjZHoAgw3gnpJXdwHX+EsoZVSR
blLcg1TyhGzTHmwXVxa0b1VrGpAgX/TqO49FDz5RwdMu6j77vGd8M+fzBByJ5Ej8
FqzOomf7n3v6tcGxaBA7H6JxwFffgVymoBsPu/WXTASHpQH3ZEahmIGwTCJUsRLt
2WeRbhFvCyXFuQzRS1bfmwUFDjRzHlKHwH/X6+F9wObwQL3gwMZa9hL6m3Oh7xB6
ygY6kMyeMeNGWkClX9o/vqNfk2GQT2JDxiI0bxQP2X9RHxXt1WTXUNMAmQJwGKqa
nuvFw5vZDW79cU+3ZovTFPuR8P9lKuIe/ED++WDKPZ75onv8sUcyIbzxMj2Kc0yv
dunDSz20Uqozg6pgFnZm/Rr2aGZXbt2dFKQ5W2aEkkA2i5hR57exZegiQ1088zxX
hlcBZWnXl0YnBy3MvfUIqwY+ZJFJzvOOC1T0Y5U/rTfPlD5ymbg=
=5IIO
-----END PGP SIGNATURE-----

--mnyikhpctl2rsofm--

--===============0627720727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0627720727==--
