Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE7710E17E
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Dec 2022 08:12:00 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 23 Dec 2022 08:11:57 +0000
Message-ID: <DM4PR11MB6312A09D39D5029BD829DADA90E99@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
 <20221115170855.196572-46-bhanuprakash.modem@intel.com>
In-Reply-To: <20221115170855.196572-46-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v5 45/52] tests/i915/kms_flip_tiling: Add
 support for Bigjoiner
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Tuesday, November 15, 2022 10:39 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [i-g-t v5 45/52] tests/i915/kms_flip_tiling: Add suppo=
rt for
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
>  tests/i915/kms_flip_tiling.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c =
index
> 1183feb6..2e2b9511 100644
> --- a/tests/i915/kms_flip_tiling.c
> +++ b/tests/i915/kms_flip_tiling.c
> @@ -79,6 +79,9 @@ test_flip_tiling(data_t *data, enum pipe pipe,
> igt_output_t *output, uint64_t mo
>  	igt_crc_t reference_crc, crc;
>  	int fb_id, ret;
>=20
> +	igt_info("Using (pipe %s + %s) to run the subtest.\n",
> +		 kmstest_pipe_name(pipe), igt_output_name(output));
> +

Is igt_info required here ??=20
igt_dynamic_f has the info already.=20
=20
>  	memcpy(&data->old_fb, &data->fb, sizeof(data->fb));
>=20
>  	mode =3D igt_output_get_mode(output);
> @@ -195,8 +198,12 @@ igt_main
>  		for_each_pipe_with_valid_output(&data.display, pipe,
> output) {
>  			igt_plane_t *plane;
>=20
> +			igt_display_reset(&data.display);
>  			pipe_crc_free(&data);
> +
>  			igt_output_set_pipe(output, pipe);
> +			if (!i915_pipe_output_combo_valid(&data.display))
> +				continue;
>=20
>  			plane =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
>=20
> --
> 2.38.0
