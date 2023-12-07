Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2616110E91D
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 16:04:43 +0000 (UTC)
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t V6 03/10] tests/kms_vrr: Move all config constaints to new
 function
Date: Thu, 7 Dec 2023 16:04:38 +0000
Message-ID: <IA1PR11MB6348264130965D2A3FBD89DCB28BA@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20231207064900.3328723-1-bhanuprakash.modem@intel.com>
 <20231207064900.3328723-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20231207064900.3328723-4-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
> Sent: Thursday, December 7, 2023 12:19 PM
> To: igt-dev@lists.freedesktop.org; ville.syrjala@linux.intel.com; Golani,
> Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [i-g-t V6 03/10] tests/kms_vrr: Move all config constaints to ne=
w
> function
>=20
> No functional change, cleanup only. Move all config checks to new functio=
n.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vrr.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 13e7f3ca6..df241aa6c
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -483,6 +483,21 @@ static void test_cleanup(data_t *data, enum pipe
> pipe, igt_output_t *output)
>  	igt_remove_fb(data->drm_fd, &data->fb0);  }
>=20
> +static bool config_constraint(igt_output_t *output, uint32_t flags) {
> +	if (!has_vrr(output))
> +		return false;
> +
> +	/* For Negative tests, panel should be non-vrr. */
> +	if ((flags & TEST_NEGATIVE) && vrr_capable(output))
> +		return false;
> +
> +	if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output))
> +		return false;
> +
> +	return true;
> +}
> +
>  /* Runs tests on outputs that are VRR capable. */  static void
> run_vrr_test(data_t *data, test_t test, uint32_t flags) @@ -492,14 +507,7
> @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
>  	for_each_connected_output(&data->display, output) {
>  		enum pipe pipe;
>=20
> -		if (!has_vrr(output))
> -			continue;
> -
> -		/* For Negative tests, panel should be non-vrr. */
> -		if ((flags & TEST_NEGATIVE) && vrr_capable(output))
> -			continue;
> -
> -		if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output))
> +		if (!config_constraint(output, flags))

Change LGTM. Thanks

Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>  			continue;
>=20
>  		for_each_pipe(&data->display, pipe) {
> --
> 2.40.0
