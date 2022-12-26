Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994BD10E1B6
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Dec 2022 06:09:03 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 26 Dec 2022 06:09:00 +0000
Message-ID: <DM4PR11MB631265BE51D9732C90510B2790EC9@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20221115170855.196572-46-bhanuprakash.modem@intel.com>
 <20221223084056.2541707-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20221223084056.2541707-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v6 45/52] tests/i915/kms_flip_tiling: Add
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
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Friday, December 23, 2022 2:11 PM
> To: igt-dev@lists.freedesktop.org; B, Jeevan <jeevan.b@intel.com>
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [i-g-t v6 45/52] tests/i915/kms_flip_tiling: Add support for Big=
joiner
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
> V3: - Remove unwanted prints
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
LGTM

Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/i915/kms_flip_tiling.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c =
index
> 1183feb6..4cc063f6 100644
> --- a/tests/i915/kms_flip_tiling.c
> +++ b/tests/i915/kms_flip_tiling.c
> @@ -195,8 +195,12 @@ igt_main
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
> 2.39.0
