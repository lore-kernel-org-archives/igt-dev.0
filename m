Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF1310E5C2
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Nov 2022 09:47:00 +0000 (UTC)
From: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Thu, 3 Nov 2022 09:46:57 +0000
Message-ID: <PH7PR11MB6006C393740CB6AADCA039FCC5389@PH7PR11MB6006.namprd11.prod.outlook.com>
References: <1667445898-20552-1-git-send-email-nidhi1.gupta@intel.com>
 <Y2OKTvILL2y4+lHL@intel.com>
In-Reply-To: <Y2OKTvILL2y4+lHL@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_invalid_mode: Fix the test
 for legacy platform
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Ville,

It's a small patch, just cleaning up the display state before executing the=
 subtest.

Nidhi

-----Original Message-----
From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>=20
Sent: Thursday, November 3, 2022 3:01 PM
To: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/kms_invalid_mode: Fix the test for legacy =
platform

On Thu, Nov 03, 2022 at 08:54:58AM +0530, Nidhi Gupta wrote:
> -Cleanup up the display state before starting the subtest.
> -Execute the tests only for 5 modes.
> -Use primary plane to set the framebuffer.

Again multiple patches in the guise of a single patch, with no justificatio=
n for any of them. NAK.

I think we just need to put in the revert and start from scratch.

>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>  tests/kms_invalid_mode.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c index=20
> f1c3866..492c92c 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -184,6 +184,7 @@ test_output(data_t *data)
>  	struct igt_fb fb;
>  	int ret;
>  	drmModeModeInfo *mode;
> +	igt_plane_t *primary;
> =20
>  	igt_display_reset(&data->display);
>  	igt_output_set_pipe(output, data->pipe); @@ -192,7 +193,14 @@=20
> test_output(data_t *data)
>  		      DRM_FORMAT_MOD_LINEAR,
>  		      &fb);
> =20
> +	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, &fb);
> +
>  	for_each_connector_mode(output) {
> +		igt_output_override_mode(output, NULL);
> +		igt_display_commit(&data->display);
> +		if (j__ > 5)
> +			break;
>  		mode =3D &output->config.connector->modes[j__];
>  		igt_require(data->adjust_mode(data, mode));
>  		igt_output_override_mode(output, mode); @@ -200,9 +208,11 @@=20
> test_output(data_t *data)
>  		igt_assert(ret =3D=3D -EINVAL);
>  	}
> =20
> +	/* Cleanup */
>  	igt_remove_fb(data->drm_fd, &fb);
> +	igt_plane_set_fb(primary, NULL);
>  	igt_output_override_mode(output, NULL);
> -	/*unset_all_crtcs*/
> +	igt_output_set_pipe(output, PIPE_NONE);
>  	igt_display_commit(&data->display);
>  }
> =20
> --
> 1.9.1

--
Ville Syrj=E4l=E4
Intel
