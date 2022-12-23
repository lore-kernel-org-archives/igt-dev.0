Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B557B10E16A
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Dec 2022 08:06:30 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 23 Dec 2022 08:06:23 +0000
Message-ID: <DM4PR11MB631225692357C4D01685D1BF90E99@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
 <20221115170855.196572-38-bhanuprakash.modem@intel.com>
In-Reply-To: <20221115170855.196572-38-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v5 37/52] tests/i915/kms_big_fb: Add support
 for Bigjoiner
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

LGTM=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Tuesday, November 15, 2022 10:39 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [i-g-t v5 37/52] tests/i915/kms_big_fb: Add support fo=
r
> Bigjoiner
>=20
> This patch will add a check to Skip the subtest if a selected pipe/output
> combo won't support Bigjoiner or 8K mode.
>=20
> Example:
> * Pipe-D wont support a mode > 5K
> * To use 8K mode on a pipe then consecutive pipe must be available & free=
.
>=20
> V2: - Use updated helper name
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/i915/kms_big_fb.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c index
> 0beba0e1..a29a05a2 100644
> --- a/tests/i915/kms_big_fb.c
> +++ b/tests/i915/kms_big_fb.c
> @@ -406,6 +406,9 @@ static bool test_pipe(data_t *data)
>  	igt_plane_t *primary;
>  	bool ret =3D false;
>=20
> +	igt_info("Using (pipe %s + %s) to run the subtest.\n",
> +		 kmstest_pipe_name(data->pipe), igt_output_name(data-
> >output));
> +
>  	if (data->format =3D=3D DRM_FORMAT_C8 &&
>  	    !igt_pipe_obj_has_prop(&data->display.pipes[data->pipe],
>  				   IGT_CRTC_GAMMA_LUT))
> @@ -481,6 +484,10 @@ max_hw_stride_async_flip_test(data_t *data)
>  	igt_crc_t compare_crc, async_crc;
>=20
>  	igt_require(data->display.is_atomic);
> +
> +	igt_info("Using (pipe %s + %s) to run the subtest.\n",
> +		 kmstest_pipe_name(data->pipe), igt_output_name(data-
> >output));
> +
>  	igt_output_set_pipe(data->output, data->pipe);
>=20
>  	primary =3D igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_PRIMARY); @@ -592,6 +599,12 @@ static void
> test_scanout(data_t *data)
>  		    data->format, data->modifier);
>=20
>  	for_each_pipe_with_valid_output(&data->display, data->pipe, data-
> >output) {
> +		igt_display_reset(&data->display);
> +
> +		igt_output_set_pipe(data->output, data->pipe);
> +		if (!i915_pipe_output_combo_valid(&data->display))
> +			continue;
> +
>  		if (data->async_flip_test) {
>  			if (max_hw_stride_async_flip_test(data))
>  				return;
> --
> 2.38.0
