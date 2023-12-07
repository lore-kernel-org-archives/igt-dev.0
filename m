Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F2E10E8B1
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 14:42:44 +0000 (UTC)
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t V6 06/10] tests/kms_vrr: Add a helper to get the low
 refresh mode
Date: Thu, 7 Dec 2023 14:42:39 +0000
Message-ID: <IA1PR11MB6348EB14C7EEE74A00F03C94B28BA@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20231207064900.3328723-1-bhanuprakash.modem@intel.com>
 <20231207064900.3328723-7-bhanuprakash.modem@intel.com>
In-Reply-To: <20231207064900.3328723-7-bhanuprakash.modem@intel.com>
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
> Subject: [i-g-t V6 06/10] tests/kms_vrr: Add a helper to get the low refr=
esh
> mode
>=20
> To switch the refresh rate seamlessly, add a new helper to identify the m=
ode
> with the same resolution but low vrefresh and clock.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vrr.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index db82cd008..f3cd18dcd
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -166,6 +166,24 @@ output_mode_with_maxrate(igt_output_t *output,
> unsigned int vrr_max)
>  	return mode;
>  }
>=20
> +static drmModeModeInfo
> +low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min) {
> +	int i;
> +	drmModeConnectorPtr connector =3D output->config.connector;
> +	drmModeModeInfo mode =3D *igt_output_get_mode(output);
> +
> +	for (i =3D 0; i < connector->count_modes; i++)
> +		if (connector->modes[i].hdisplay =3D=3D mode.hdisplay &&
> +		    connector->modes[i].vdisplay =3D=3D mode.vdisplay &&
> +		    connector->modes[i].clock < mode.clock &&
> +		    connector->modes[i].vrefresh < mode.vrefresh &&
> +		    connector->modes[i].vrefresh >=3D vrr_min)
> +			mode =3D connector->modes[i];
> +
> +	return mode;
> +}
> +
Please add this function in the patch where it is being called.

- Mitul

>  /* Read min and max vrr range from the connector debugfs. */  static
> range_t  get_vrr_range(data_t *data, igt_output_t *output)
> --
> 2.40.0
