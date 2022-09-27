Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0322F10E3E8
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 10:23:26 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 27 Sep 2022 10:23:19 +0000
Message-ID: <DM4PR11MB6312CE27AE2B5628FC65FD7F90559@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
 <20220922160004.2041598-51-bhanuprakash.modem@intel.com>
In-Reply-To: <20220922160004.2041598-51-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V4 50/52] tests/i915/kms_psr: Add support for
 Bigjoiner
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
> Subject: [igt-dev] [i-g-t V4 50/52] tests/i915/kms_psr: Add support for
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
>  tests/i915/kms_psr.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/tests/i915/kms_psr.c b/tests/i915/kms_psr.c index
> 480e2cc7..97b4f0f3 100644
> --- a/tests/i915/kms_psr.c
> +++ b/tests/i915/kms_psr.c
> @@ -102,7 +102,11 @@ static void setup_output(data_t *data)
>  		if (c->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
>  			continue;
>=20
> +		igt_display_reset(display);
>  		igt_output_set_pipe(output, pipe);
> +		if (!i915_pipe_output_combo_valid(display))
> +			continue;
> +
>  		data->crtc_id =3D output->config.crtc->crtc_id;
>  		data->output =3D output;
>  		data->mode =3D igt_output_get_mode(output);
> --
> 2.37.3
