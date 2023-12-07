Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1F310E1C4
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 14:09:03 +0000 (UTC)
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t V6 01/10] tests/kms_vrr: Use lib helper to print connector
 modes
Date: Thu, 7 Dec 2023 14:08:58 +0000
Message-ID: <IA1PR11MB6348E752960E35737E86403BB28BA@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20231207064900.3328723-1-bhanuprakash.modem@intel.com>
 <20231207064900.3328723-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20231207064900.3328723-2-bhanuprakash.modem@intel.com>
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
> Subject: [i-g-t V6 01/10] tests/kms_vrr: Use lib helper to print connecto=
r
> modes
>=20
> Instead of writing a new logic at test level, use library helper to print
> connector modes.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vrr.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 5c190cd8c..bbdb54682
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -65,13 +65,6 @@
>   */
>  #define TEST_DURATION_NS (5000000000ull)
>=20
> -#define DRM_MODE_FMT    "\"%s\": %d %d %d %d %d %d %d %d %d %d
> 0x%x 0x%x"
> -#define DRM_MODE_ARG(m) \
> -	(m)->name, (m)->vrefresh, (m)->clock, \
> -	(m)->hdisplay, (m)->hsync_start, (m)->hsync_end, (m)->htotal, \
> -	(m)->vdisplay, (m)->vsync_start, (m)->vsync_end, (m)->vtotal, \
> -	(m)->type, (m)->flags
> -
>  enum {
>  	TEST_BASIC =3D 1 << 0,
>  	TEST_DPMS =3D 1 << 1,
> @@ -162,14 +155,16 @@ output_mode_with_maxrate(igt_output_t
> *output, unsigned int vrr_max)
>  	drmModeConnectorPtr connector =3D output->config.connector;
>  	drmModeModeInfo mode =3D *igt_output_get_mode(output);
>=20
> -	igt_debug("Default Mode " DRM_MODE_FMT "\n",
> DRM_MODE_ARG(&mode));
> +	igt_info("Default Mode: ");
> +	kmstest_dump_mode(&mode);
>=20
>  	for (i =3D 0; i < connector->count_modes; i++)
>  		if (connector->modes[i].vrefresh > mode.vrefresh &&
>  		    connector->modes[i].vrefresh <=3D vrr_max)
>  			mode =3D connector->modes[i];
>=20
> -	igt_debug("Override Mode " DRM_MODE_FMT "\n",
> DRM_MODE_ARG(&mode));
> +	igt_info("Override Mode: ");
> +	kmstest_dump_mode(&mode);

Change LGTM. Thanks

Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>=20
>  	return mode;
>  }
> --
> 2.40.0
