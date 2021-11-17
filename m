Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C8F89FE8
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Nov 2021 04:35:31 +0000 (UTC)
From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
Date: Wed, 17 Nov 2021 04:35:26 +0000
Message-ID: <0d77074ed995449aac806ee077bc8672@intel.com>
References: <20211112122752.29241-1-venkata.sai.patnana@intel.com>
 <20211116082456.14899-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20211116082456.14899-1-venkata.sai.patnana@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 i-g-t] tests/i915/kms_dsc: To test modeset
 on dsc with highest mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Patnana, Venkata Sai" <venkata.sai.patnana@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> -----Original Message-----
> From: Patnana, Venkata Sai <venkata.sai.patnana@intel.com>
> Sent: Tuesday, November 16, 2021 1:55 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Patnana, Venkata Sai <venkata.sai.patnana@intel.com>; Kulkarni,
> Vandita <vandita.kulkarni@intel.com>; B S, Karthik <karthik.b.s@intel.com=
>;
> Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Sharma,
> Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH v4 i-g-t] tests/i915/kms_dsc: To test modeset on dsc with
> highest mode
>=20
> From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
>=20
> Force dsc enable supports resolutions above 5K in DP.
> Bigjoiner does not support dsc force bpp, also due to this bigjoiner limi=
tation
> we need to skip all subtests on pipe D.
>=20
> This patch will pick the mode with highest resolution rather the default
> mode.
It looks ok to me wrt the functionality.
Acked-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
>=20
> v2: Updated indentation.
> v3: Split the restructuring the subtests logic.
> v4: Updated igt_skip_on_f condition.
>=20
> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
>=20
> Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> ---
>  tests/i915/kms_dsc.c | 66 ++++++++++++++++++++++++++++++++++-------
> ---
>  1 file changed, 51 insertions(+), 15 deletions(-)
>=20
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c index
> dcfe8b9669..25f7676a4c 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -63,6 +63,7 @@ typedef struct {
>  	drmModeEncoder *encoder;
>  	int crtc;
>  	int compression_bpp;
> +	int n_pipes;
>  	enum pipe pipe;
>  	char conn_name[128];
>  } data_t;
> @@ -151,6 +152,13 @@ static bool is_external_panel(drmModeConnector
> *connector)
>  	}
>  }
>=20
> +static int sort_drm_modes(const void *a, const void *b) {
> +	const drmModeModeInfo *mode1 =3D a, *mode2 =3D b;
> +
> +	return (mode1->clock < mode2->clock) - (mode2->clock < mode1-
> >clock);
> +}
> +
>  static bool check_dsc_on_connector(data_t *data, uint32_t drmConnector)
> {
>  	drmModeConnector *connector;
> @@ -162,6 +170,19 @@ static bool check_dsc_on_connector(data_t *data,
> uint32_t drmConnector)
>  		return false;
>=20
>  	output =3D igt_output_from_connector(&data->display, connector);
> +
> +	/*
> +	 * As dsc supports >=3D 5k modes, we need to suppress lower
> +	 * resolutions.
> +	 */
> +	qsort(output->config.connector->modes,
> +	      output->config.connector->count_modes,
> +	      sizeof(drmModeModeInfo),
> +	      sort_drm_modes);
> +	if (output->config.connector->connector_type =3D=3D
> DRM_MODE_CONNECTOR_DisplayPort &&
> +	    output->config.connector->modes[0].hdisplay < 5120)
> +		return NULL;
> +
>  	sprintf(data->conn_name, "%s-%d",
>  		kmstest_connector_type_str(connector->connector_type),
>  		connector->connector_type_id);
> @@ -203,6 +224,11 @@ static void update_display(data_t *data, enum
> dsc_test_type test_type)
>  	}
>=20
>  	igt_output_set_pipe(data->output, data->pipe);
> +	qsort(data->output->config.connector->modes,
> +			data->output->config.connector->count_modes,
> +			sizeof(drmModeModeInfo),
> +			sort_drm_modes);
> +	igt_output_override_mode(data->output,
> +&data->output->config.connector->modes[0]);
>  	primary =3D igt_output_get_plane_type(data->output,
>  					    DRM_PLANE_TYPE_PRIMARY);
>=20
> @@ -219,11 +245,9 @@ static void update_display(data_t *data, enum
> dsc_test_type test_type)
>  	enabled =3D igt_is_dsc_enabled(data->drm_fd,
>  					data->output->config.connector);
>  	restore_force_dsc_en();
> -	if (test_type =3D=3D test_dsc_compression_bpp) {
> -		igt_debug("Rest compression BPP \n");
> -		data->compression_bpp =3D 0;
> -		force_dsc_enable_bpp(data);
> -	}
> +	igt_debug("Reset compression BPP\n");
> +	data->compression_bpp =3D 0;
> +	force_dsc_enable_bpp(data);
>=20
>  	igt_assert_f(enabled,
>  		     "Default DSC enable failed on Connector: %s Pipe: %s\n",
> @@ -235,10 +259,14 @@ static void run_test(data_t *data, enum
> dsc_test_type test_type)  {
>  	enum pipe pipe;
>  	char test_name[10];
> -	drmModeModeInfo *mode =3D igt_output_get_mode(data->output);
>=20
> -	igt_create_pattern_fb(data->drm_fd, mode->hdisplay,
> -			      mode->vdisplay,
> +	igt_skip_on_f(test_type =3D=3D test_dsc_compression_bpp &&
> +		      data->output->config.connector->modes[0].hdisplay >=3D
> 5120,
> +		      "bigjoiner does not support force bpp\n");
> +
> +	igt_create_pattern_fb(data->drm_fd,
> +			      data->output->config.connector-
> >modes[0].hdisplay,
> +			      data->output->config.connector-
> >modes[0].vdisplay,
>  			      DRM_FORMAT_XRGB8888,
>  			      DRM_FORMAT_MOD_LINEAR,
>  			      &data->fb_test_pattern);
> @@ -253,16 +281,21 @@ static void run_test(data_t *data, enum
> dsc_test_type test_type)
>  		}
>=20
>  		snprintf(test_name, sizeof(test_name), "-%dbpp", data-
> >compression_bpp);
> -		if (igt_pipe_connector_valid(pipe, data->output)) {
> +		if (!igt_pipe_connector_valid(pipe, data->output))
> +			continue;
> +
> +		igt_dynamic_f("%s-pipe-%s%s", data->output->name,
> +			      kmstest_pipe_name(pipe),
> +			      (test_type =3D=3D test_dsc_compression_bpp) ?
> +			      test_name : "") {
>  			data->pipe =3D pipe;
> +			igt_skip_on_f((data->output->config.connector-
> >modes[0].hdisplay >=3D 5120) &&
> +				      (pipe  =3D=3D (data->n_pipes - 1)),
> +				      "pipe-%s not supported due to bigjoiner
> limitation\n",
> +				      kmstest_pipe_name(pipe));
> +			update_display(data, test_type);
>=20
> -			igt_dynamic_f("%s-pipe-%s%s", data->output-
> >name,
> -					kmstest_pipe_name(pipe),
> -					(test_type =3D=3D
> test_dsc_compression_bpp) ?
> -					 test_name : "")
> -				update_display(data, test_type);
>  		}
> -
>  		if (test_type =3D=3D test_dsc_compression_bpp)
>  			break;
>  	}
> @@ -283,6 +316,9 @@ igt_main
>  		igt_install_exit_handler(kms_dsc_exit_handler);
>  		igt_display_require(&data.display, data.drm_fd);
>  		igt_require(res =3D drmModeGetResources(data.drm_fd));
> +		data.n_pipes =3D 0;
> +		for_each_pipe(&data.display, i)
> +			data.n_pipes++;
>  	}
>  	igt_subtest_with_dynamic("basic-dsc-enable") {
>  		for (j =3D 0; j < res->count_connectors; j++) {
> --
> 2.25.1
