Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3F510E1BD
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Sep 2022 08:42:48 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 30 Sep 2022 08:42:38 +0000
Message-ID: <DM4PR11MB6312ACE23076AB4BEB4710B990569@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
 <20220922160004.2041598-18-bhanuprakash.modem@intel.com>
In-Reply-To: <20220922160004.2041598-18-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V4 17/52] tests/kms_flip_event_leak: Add
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
> Sent: Thursday, September 22, 2022 9:29 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [i-g-t V4 17/52] tests/kms_flip_event_leak: Add suppor=
t for
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
Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_flip_event_leak.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c in=
dex
> 9815f1e2..d3ddec72 100644
> --- a/tests/kms_flip_event_leak.c
> +++ b/tests/kms_flip_event_leak.c
> @@ -48,10 +48,6 @@ static void test(data_t *data, enum pipe pipe,
> igt_output_t *output)
>  	struct igt_fb fb[2];
>  	int fd, ret;
>=20
> -	igt_display_reset(&data->display);
> -	/* select the pipe we want to use */
> -	igt_output_set_pipe(output, pipe);
> -
>  	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
>  	mode =3D igt_output_get_mode(output);
>=20
> @@ -104,9 +100,14 @@ igt_main
>  		igt_display_require_output(&data.display);
>  	}
>=20
> -
>  	igt_subtest_with_dynamic("basic") {
>  		for_each_pipe_with_valid_output(&data.display, pipe,
> output) {
> +			igt_display_reset(&data.display);
> +
> +			igt_output_set_pipe(output, pipe);
> +			if (!i915_pipe_output_combo_valid(&data.display))
> +				continue;
> +
>  			igt_dynamic_f("pipe-%s-%s",
> kmstest_pipe_name(pipe), igt_output_name(output)) {
>  				test(&data, pipe, output);
>  			}
> --
> 2.37.3
