Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34C010E70D
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jan 2023 11:24:15 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 11 Jan 2023 11:24:07 +0000
Message-ID: <DM4PR11MB636034EC67055BFBE5DBC95DF4FC9@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230110170132.13192-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230110170132.13192-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: stop crc
 generation before asserting
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Juha-P=
ekka
> Heikkila
> Sent: Tuesday, January 10, 2023 10:32 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: stop crc ge=
neration
> before asserting
>=20
> Stop crc generation on basic alpha test before asserting to avoid message=
s about crc
> buffer overflow.

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_plane_alpha_blend.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.=
c index
> ccf1d6579..38272ccb3 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -263,19 +263,23 @@ static void basic_alpha(data_t *data, enum pipe pip=
e,
> igt_plane_t *plane)
>  		igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, i | (i << 8));
>  		igt_display_commit2(display, COMMIT_ATOMIC);
>=20
>  		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
> -		igt_assert_crc_equal(&ref_crc, &crc);
> +		if (!igt_check_crc_equal(&ref_crc, &crc) && !igt_skip_crc_compare)
> {
> +			igt_pipe_crc_stop(data->pipe_crc);
> +
> +			igt_assert_f(false, "crc mismatch with plane alpha value
> %d\n",
> +				     i | (i << 8));
> +		}
>  	}
>=20
>  	/* And test alpha =3D 0, should give same CRC, but doesn't on some i915
> platforms. */
>  	igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>=20
>  	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
> -	igt_assert_crc_equal(&ref_crc, &crc);
> -
>  	igt_pipe_crc_stop(data->pipe_crc);
> +	igt_assert_crc_equal(&ref_crc, &crc);
>  }
>=20
>  static void argb_opaque(data_t *data, enum pipe pipe, igt_plane_t *plane=
)  {
> --
> 2.39.0
