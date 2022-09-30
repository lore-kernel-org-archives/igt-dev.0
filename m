Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6925F10E14E
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Sep 2022 08:39:13 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 30 Sep 2022 08:39:10 +0000
Message-ID: <DM4PR11MB63127A110EE7FAE3053B382190569@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
 <20220922160004.2041598-49-bhanuprakash.modem@intel.com>
In-Reply-To: <20220922160004.2041598-49-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V4 48/52] tests/i915/kms_psr2_sf: Add support
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

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Thursday, September 22, 2022 9:30 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [i-g-t V4 48/52] tests/i915/kms_psr2_sf: Add support f=
or
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
>  tests/i915/kms_psr2_sf.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c index
> 6612587c..7f63b19f 100644
> --- a/tests/i915/kms_psr2_sf.c
> +++ b/tests/i915/kms_psr2_sf.c
> @@ -115,7 +115,11 @@ static void setup_output(data_t *data)
>  		if (c->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
>  			continue;
>=20
> +		igt_display_reset(display);
>  		igt_output_set_pipe(output, pipe);
> +		if (!i915_pipe_output_combo_valid(display))
> +			continue;
> +
>  		data->output =3D output;
>  		data->mode =3D igt_output_get_mode(output);
>=20
> @@ -127,6 +131,9 @@ static void display_init(data_t *data)  {
>  	igt_display_require(&data->display, data->drm_fd);
>  	setup_output(data);
> +
> +	igt_require_f(data->output, "No available output found\n");
> +	igt_require_f(data->mode, "No available mode found on %s\n",
> +data->output->name);
>  }
>=20
>  static void display_fini(data_t *data)
> --
> 2.37.3
