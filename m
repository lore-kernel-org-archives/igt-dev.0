Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0696E9AF
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Nov 2021 05:25:19 +0000 (UTC)
From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
Date: Tue, 16 Nov 2021 05:25:14 +0000
Message-ID: <20581fa387a74359aa871f6a2eacb90d@intel.com>
References: <20211112122752.29241-1-venkata.sai.patnana@intel.com>
 <20211115152938.21269-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20211115152938.21269-1-venkata.sai.patnana@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 i-g-t] tests/i915/kms_dsc: To test modeset
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
> Sent: Monday, November 15, 2021 9:00 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Patnana, Venkata Sai <venkata.sai.patnana@intel.com>; Kulkarni,
> Vandita <vandita.kulkarni@intel.com>; B S, Karthik <karthik.b.s@intel.com=
>;
> Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Sharma,
> Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH v2 i-g-t] tests/i915/kms_dsc: To test modeset on dsc with
> highest mode
>=20
> From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
>=20
> Force dsc enable supports resolutions above 5K in DP.
> Bigjoiner does not support force bpp also due to bigjoiner limitation pip=
e D
> we are skipping. In this patch, changes are done to pick the highest mode
> rather the default mode.

This patch seems to be doing more than what it is saying.
I see that there are new test names being added.

Please split the patch.
Let this patch just do the testing of dsc on modes greater than 5k,
 inline with the current driver design.

Thanks,
Vandita
>=20
> v2: Updated indentation
>=20
> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
>=20
> Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> ---
>  tests/i915/kms_dsc.c | 149 +++++++++++++++++++++++++++++-------------
> -
>  1 file changed, 102 insertions(+), 47 deletions(-)
>=20
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c index
> dcfe8b9669..dff5ce29d2 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -63,8 +63,8 @@ typedef struct {
>  	drmModeEncoder *encoder;
>  	int crtc;
>  	int compression_bpp;
> +	int n_pipes;
>  	enum pipe pipe;
> -	char conn_name[128];
>  } data_t;
>=20
>  bool force_dsc_en_orig;
> @@ -79,7 +79,7 @@ static void force_dsc_enable(data_t *data)  {
>  	int ret;
>=20
> -	igt_debug ("Forcing DSC enable on %s\n", data->conn_name);
> +	igt_debug ("Forcing DSC enable on %s\n", data->output->name);
>  	ret =3D igt_force_dsc_enable(data->drm_fd,
>  				      data->output->config.connector);
>  	igt_assert_f(ret > 0, "debugfs_write failed"); @@ -90,7 +90,7 @@
> static void force_dsc_enable_bpp(data_t *data)
>  	int ret;
>=20
>  	igt_debug("Forcing DSC BPP to %d on %s\n",
> -		  data->compression_bpp, data->conn_name);
> +		  data->compression_bpp, data->output->name);
>  	ret =3D igt_force_dsc_enable_bpp(data->drm_fd,
>  					  data->output->config.connector,
>  					  data->compression_bpp);
> @@ -151,41 +151,55 @@ static bool is_external_panel(drmModeConnector
> *connector)
>  	}
>  }
>=20
> -static bool check_dsc_on_connector(data_t *data, uint32_t drmConnector)
> +static int sort_drm_modes(const void *a, const void *b) {
> +	const drmModeModeInfo *mode1 =3D a, *mode2 =3D b;
> +
> +	return (mode1->clock < mode2->clock) - (mode2->clock < mode1-
> >clock);
> +}
> +
> +static igt_output_t *check_dsc_on_connector(data_t *data, uint32_t
> +drmConnector)
>  {
>  	drmModeConnector *connector;
>  	igt_output_t *output;
> -
>  	connector =3D drmModeGetConnectorCurrent(data->drm_fd,
>  					       drmConnector);
>  	if (connector->connection !=3D DRM_MODE_CONNECTED)
> -		return false;
> +		return NULL;
>=20
>  	output =3D igt_output_from_connector(&data->display, connector);
> -	sprintf(data->conn_name, "%s-%d",
> -		kmstest_connector_type_str(connector->connector_type),
> -		connector->connector_type_id);
> +
> +        /* As dsc supports >=3D 5k modes, we need to supress lower
> +         * resolutions.
> +	 */
> +	qsort(output->config.connector->modes,
> +	      output->config.connector->count_modes,
> +	      sizeof(drmModeModeInfo),
> +	      sort_drm_modes);
> +	if (output->config.connector->connector_type =3D=3D
> DRM_MODE_CONNECTOR_DisplayPort &&
> +	    output->config.connector->modes[0].hdisplay < 5120)
> +		return NULL;
>=20
>  	if (!igt_is_dsc_supported(data->drm_fd, connector)) {
>  		igt_debug("DSC not supported on connector %s\n",
> -			  data->conn_name);
> -		return false;
> +			  output->name);
> +		return NULL;
>  	}
>  	if (is_external_panel(connector) &&
>  	    !igt_is_fec_supported(data->drm_fd, connector)) {
>  		igt_debug("DSC cannot be enabled without FEC on %s\n",
> -			  data->conn_name);
> -		return false;
> +			  output->name);
> +		return NULL;
>  	}
> -	data->output =3D output;
> -	return true;
> +	return output;
>  }
>=20
>  /*
>   * Re-probe connectors and do a modeset with DSC
>   *
>   */
> -static void update_display(data_t *data, enum dsc_test_type test_type)
> +static void update_display(data_t *data, enum dsc_test_type test_type,
> +			   unsigned int drm_format)
>  {
>  	bool enabled;
>  	igt_plane_t *primary;
> @@ -194,7 +208,7 @@ static void update_display(data_t *data, enum
> dsc_test_type test_type)
>  	igt_output_set_pipe(data->output, PIPE_NONE);
>  	igt_display_commit(&data->display);
>=20
> -	igt_debug("DSC is supported on %s\n", data->conn_name);
> +	igt_debug("DSC is supported on %s\n", data->output->name);
>  	save_force_dsc_en(data);
>  	force_dsc_enable(data);
>  	if (test_type =3D=3D test_dsc_compression_bpp) { @@ -203,8 +217,15
> @@ static void update_display(data_t *data, enum dsc_test_type
> test_type)
>  	}
>=20
>  	igt_output_set_pipe(data->output, data->pipe);
> +	qsort(data->output->config.connector->modes,
> +	      data->output->config.connector->count_modes,
> +	      sizeof(drmModeModeInfo),
> +	      sort_drm_modes);
> +	igt_output_override_mode(data->output,
> +&data->output->config.connector->modes[0]);
>  	primary =3D igt_output_get_plane_type(data->output,
>  					    DRM_PLANE_TYPE_PRIMARY);
> +	igt_skip_on_f(!igt_plane_has_format_mod(primary, drm_format,
> DRM_FORMAT_MOD_LINEAR),
> +		      "plane %s format does not have support \n",
> +igt_format_str(drm_format));
>=20
>  	/* Now set the output to the desired mode */
>  	igt_plane_set_fb(primary, &data->fb_test_pattern); @@ -217,29
> +238,33 @@ static void update_display(data_t *data, enum dsc_test_type
> test_type)
>  	manual("RGB test pattern without corruption");
>=20
>  	enabled =3D igt_is_dsc_enabled(data->drm_fd,
> -					data->output->config.connector);
> +				     data->output->config.connector);
>  	restore_force_dsc_en();
> -	if (test_type =3D=3D test_dsc_compression_bpp) {
> -		igt_debug("Rest compression BPP \n");
> -		data->compression_bpp =3D 0;
> -		force_dsc_enable_bpp(data);
> -	}
> +
> +	igt_debug("Reset compression BPP \n");
> +	data->compression_bpp =3D 0;
> +	force_dsc_enable_bpp(data);
>=20
>  	igt_assert_f(enabled,
>  		     "Default DSC enable failed on Connector: %s Pipe: %s\n",
> -		     data->conn_name,
> +		     data->output->name,
>  		     kmstest_pipe_name(data->pipe));
>  }
>=20
> -static void run_test(data_t *data, enum dsc_test_type test_type)
> +static void run_test(data_t *data, enum dsc_test_type test_type,
> +		     unsigned int drm_format)
>  {
>  	enum pipe pipe;
>  	char test_name[10];
> -	drmModeModeInfo *mode =3D igt_output_get_mode(data->output);
>=20
> -	igt_create_pattern_fb(data->drm_fd, mode->hdisplay,
> -			      mode->vdisplay,
> -			      DRM_FORMAT_XRGB8888,
> +	igt_skip_on_f (test_type =3D=3D test_dsc_compression_bpp &&
> +		       data->output->config.connector->modes[0].hdisplay >=3D
> 5120,
> +		       "Bigjoiner does not support force bpp\n");
> +
> +	igt_create_pattern_fb(data->drm_fd,
> +			      data->output->config.connector-
> >modes[0].hdisplay,
> +			      data->output->config.connector-
> >modes[0].vdisplay,
> +			      drm_format,
>  			      DRM_FORMAT_MOD_LINEAR,
>  			      &data->fb_test_pattern);
>=20
> @@ -253,14 +278,19 @@ static void run_test(data_t *data, enum
> dsc_test_type test_type)
>  		}
>=20
>  		snprintf(test_name, sizeof(test_name), "-%dbpp", data-
> >compression_bpp);
> -		if (igt_pipe_connector_valid(pipe, data->output)) {
> -			data->pipe =3D pipe;
> +		if (!igt_pipe_connector_valid(pipe, data->output))
> +			continue;
>=20
> -			igt_dynamic_f("%s-pipe-%s%s", data->output-
> >name,
> -					kmstest_pipe_name(pipe),
> -					(test_type =3D=3D
> test_dsc_compression_bpp) ?
> -					 test_name : "")
> -				update_display(data, test_type);
> +		igt_dynamic_f("%s-pipe-%s%s", data->output->name,
> +			      kmstest_pipe_name(pipe),
> +			      (test_type =3D=3D test_dsc_compression_bpp) ?
> +			      test_name : "") {
> +			igt_require_f((data->output->config.connector-
> >modes[0].hdisplay >=3D 5120) &&
> +				      (pipe < (data->n_pipes - 1)),
> +				      "pipe-%s not supported due to bigjoiner
> limitation\n",
> +				      kmstest_pipe_name(pipe));
> +			data->pipe =3D pipe;
> +			update_display(data, test_type, drm_format);
>  		}
>=20
>  		if (test_type =3D=3D test_dsc_compression_bpp) @@ -275,7
> +305,17 @@ igt_main
>  	data_t data =3D {};
>  	drmModeRes *res;
>  	drmModeConnector *connector =3D NULL;
> -	int i, j;
> +	igt_output_t *outputs[IGT_MAX_PIPES] =3D {};
> +	igt_output_t *output;
> +	int i, j, supported_connectors =3D 0;
> +	struct {
> +		unsigned int bpc;
> +		int format;
> +		char format_str[20];
> +	} test_list[] =3D {
> +		{8, DRM_FORMAT_XRGB8888, "XRGB8888"},
> +		{10, DRM_FORMAT_XRGB2101010, "XRGB2101010"},
> +	};
>  	igt_fixture {
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
>  		data.devid =3D intel_get_drm_devid(data.drm_fd); @@ -
> 283,14 +323,30 @@ igt_main
>  		igt_install_exit_handler(kms_dsc_exit_handler);
>  		igt_display_require(&data.display, data.drm_fd);
>  		igt_require(res =3D drmModeGetResources(data.drm_fd));
> -	}
> -	igt_subtest_with_dynamic("basic-dsc-enable") {
>  		for (j =3D 0; j < res->count_connectors; j++) {
> -			if (!check_dsc_on_connector(&data, res-
> >connectors[j]))
> -				continue;
> -			run_test(&data, test_basic_dsc_enable);
> +			output =3D check_dsc_on_connector(&data, res-
> >connectors[j]);
> +
> +			if (output)
> +				outputs[supported_connectors++] =3D output;
>  		}
> +		igt_require_f(supported_connectors, "No DSC supported
> panel connected.\n");
> +		data.n_pipes =3D 0;
> +		for_each_pipe(&data.display, i)
> +			data.n_pipes++;
> +
>  	}
> +
> +	for (i=3D0; i < ARRAY_SIZE(test_list); i++) {
> +		igt_subtest_with_dynamic_f("basic-dsc-enable-%s",
> +					   test_list[i].format_str) {
> +			for (j =3D 0; j < supported_connectors; j++) {
> +				data.output =3D outputs[j];
> +				run_test(&data, test_basic_dsc_enable,
> +					 test_list[i].format);
> +			}
> +		}
> +	}
> +
>  	/* currently we are validating compression bpp on XRGB8888 format
> only */
>  	igt_subtest_with_dynamic("XRGB8888-dsc-compression") {
>  		uint32_t bpp_list[] =3D {
> @@ -302,13 +358,12 @@ igt_main
>=20
>  		igt_require(intel_display_ver(data.devid) >=3D 13);
>=20
> -		for (j =3D 0; j < res->count_connectors; j++) {
> -			if (!check_dsc_on_connector(&data, res-
> >connectors[j]))
> -				continue;
> -
> +		for (j =3D 0; j < supported_connectors; j++) {
> +			data.output =3D outputs[j];
>  			for (i =3D 0; i < ARRAY_SIZE(bpp_list); i++) {
>  				data.compression_bpp =3D bpp_list[i];
> -				run_test(&data,
> test_dsc_compression_bpp);
> +				run_test(&data, test_dsc_compression_bpp,
> +					 DRM_FORMAT_XRGB8888);
>  			}
>  		}
>  	}
> --
> 2.25.1
