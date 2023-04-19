Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079B210E38E
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Apr 2023 07:18:00 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 19 Apr 2023 07:17:51 +0000
Message-ID: <DM4PR11MB63129D14EEFCB967CAB7E16D90629@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230418090122.8209-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230418090122.8209-1-mohammed.thasleem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_display_modes: Add negative
 test for extended display
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
> Mohammed Thasleem
> Sent: Tuesday, April 18, 2023 2:31 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t] tests/kms_display_modes: Add negative te=
st for
> extended display
>=20
> Added negative test to validte ENOSPC when two 2k-4k or 4k-4k moniters
> connected through MST.
> This test added to prvode bandwidth issue in MST config.
>=20
> Example:
>   When two monitors connected through MST, the second monitor
>   also tries to use the same mode. So two such modes may not
>   fit into the link bandwidth. So, iterate through connected
>   outputs & modes and find a combination of modes those fit
>   into the link BW.
>=20
> v2: Rebased on tip.
> v3: -Code cleanup and updated description.
>     -Free path_blob before call return. (Kamil)
> v4: Updated code formatting and function description. (Jeevan)
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
LGTM
Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_display_modes.c | 161
> ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 161 insertions(+)
>=20
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c index
> d69c7b931..e9b2b22bf 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -26,14 +26,107 @@
>=20
>  #include "igt.h"
>=20
> +#define HDISPLAY_2K	2560
> +#define VDISPLAY_2K	1440
> +
> +#define HDISPLAY_4K	3840
> +#define VDISPLAY_4K	2160
> +
>  IGT_TEST_DESCRIPTION("Test Display Modes");
>=20
>  typedef struct {
>  	int drm_fd;
>  	igt_display_t display;
> +	drmModeModeInfo mode_mst[2];
> +	igt_output_t *mst_output[2];
>  	int n_pipes;
>  } data_t;
>=20
> +/*Get higher mode supported by panel*/
> +static drmModeModeInfo *get_highres_mode(igt_output_t *output) {
> +	drmModeConnector *connector =3D output->config.connector;
> +	drmModeModeInfo *highest_mode =3D NULL;
> +
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> +	highest_mode =3D &connector->modes[0];
> +
> +	return highest_mode;
> +}
> +
> +/*Get the 4k or less then 4k mode of connected panel*/ static
> +drmModeModeInfo *get_mode(igt_output_t *output) {
> +	int j;
> +	drmModeModeInfo *required_mode =3D NULL;
> +	drmModeConnector *connector =3D output->config.connector;
> +
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> +	for (j =3D 0; j < connector->count_modes; j++) {
> +		if (connector->modes[j].vdisplay <=3D VDISPLAY_4K &&
> +		    connector->modes[j].hdisplay <=3D HDISPLAY_4K) {
> +			required_mode =3D &connector->modes[j];
> +			break;
> +		}
> +	}
> +
> +	return required_mode;
> +}
> +
> +static int parse_path_blob(char *blob_data) {
> +	int connector_id;
> +	char *encoder;
> +
> +	encoder =3D strtok(blob_data, ":");
> +	igt_assert_f(!strcmp(encoder, "mst"), "PATH connector property
> +expected to have 'mst'\n");
> +
> +	connector_id =3D atoi(strtok(NULL, "-"));
> +
> +	return connector_id;
> +}
> +
> +static bool output_is_dp_mst(data_t *data, igt_output_t *output, int i)
> +{
> +	drmModePropertyBlobPtr path_blob =3D NULL;
> +	uint64_t path_blob_id;
> +	drmModeConnector *connector =3D output->config.connector;
> +	struct kmstest_connector_config config;
> +	const char *encoder;
> +	int connector_id;
> +	static int prev_connector_id;
> +
> +	kmstest_get_connector_config(data->drm_fd, output-
> >config.connector->connector_id,
> +				     -1, &config);
> +	encoder =3D kmstest_encoder_type_str(config.encoder->encoder_type);
> +
> +	if (strcmp(encoder, "DP MST"))
> +		return false;
> +
> +	igt_assert(kmstest_get_property(data->drm_fd, connector-
> >connector_id,
> +		   DRM_MODE_OBJECT_CONNECTOR, "PATH", NULL,
> +		   &path_blob_id, NULL));
> +
> +	igt_assert(path_blob =3D drmModeGetPropertyBlob(data->drm_fd,
> +path_blob_id));
> +
> +	connector_id =3D parse_path_blob((char *) path_blob->data);
> +
> +	drmModeFreePropertyBlob(path_blob);
> +
> +	/*
> +	 * Discarding outputs of other DP MST topology.
> +	 * Testing only on outputs on the topology we got previously
> +	 */
> +	if (i =3D=3D 0) {
> +		prev_connector_id =3D connector_id;
> +	} else {
> +		if (connector_id !=3D prev_connector_id)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>  static void run_extendedmode_basic(data_t *data,
>  				   enum pipe pipe1, igt_output_t *output1,
>  				   enum pipe pipe2, igt_output_t *output2) @@
> -173,8 +266,46 @@ static void run_extendedmode_test(data_t *data) {
>  	}
>  }
>=20
> +static void run_extendedmode_negative(data_t *data, int pipe1, int
> +pipe2) {
> +	struct igt_fb fbs[2];
> +	igt_display_t *display =3D &data->display;
> +	igt_plane_t *plane[2];
> +	int ret;
> +
> +	igt_display_reset(display);
> +
> +	igt_output_set_pipe(data->mst_output[0], pipe1);
> +	igt_output_set_pipe(data->mst_output[1], pipe2);
> +
> +	igt_create_color_fb(data->drm_fd, data->mode_mst[0].hdisplay, data-
> >mode_mst[0].vdisplay,
> +			    DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR, 1, 0, 0, &fbs[0]);
> +	igt_create_color_fb(data->drm_fd, data->mode_mst[1].hdisplay, data-
> >mode_mst[1].vdisplay,
> +			    DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR, 0, 0, 1, &fbs[1]);
> +
> +	plane[0] =3D igt_pipe_get_plane_type(&display->pipes[pipe1],
> DRM_PLANE_TYPE_PRIMARY);
> +	plane[1] =3D igt_pipe_get_plane_type(&display->pipes[pipe2],
> +DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_plane_set_fb(plane[0], &fbs[0]);
> +	igt_fb_set_size(&fbs[0], plane[0], data->mode_mst[0].hdisplay, data-
> >mode_mst[0].vdisplay);
> +	igt_plane_set_size(plane[0], data->mode_mst[0].hdisplay,
> +data->mode_mst[0].vdisplay);
> +
> +	igt_plane_set_fb(plane[1], &fbs[1]);
> +	igt_fb_set_size(&fbs[1], plane[1], data->mode_mst[1].hdisplay, data-
> >mode_mst[1].vdisplay);
> +	igt_plane_set_size(plane[1], data->mode_mst[1].hdisplay,
> +data->mode_mst[1].vdisplay);
> +
> +	igt_output_override_mode(data->mst_output[0], &data-
> >mode_mst[0]);
> +	igt_output_override_mode(data->mst_output[1], &data-
> >mode_mst[1]);
> +
> +	ret =3D igt_display_try_commit2(display, COMMIT_ATOMIC);
> +	igt_assert(ret !=3D 0 && errno =3D=3D ENOSPC); }
> +
>  igt_main
>  {
> +	int dp_mst_outputs =3D 0, count =3D 0;
> +	enum pipe pipe1, pipe2;
> +	igt_output_t *output;
>  	data_t data;
>=20
>  	igt_fixture {
> @@ -182,12 +313,42 @@ igt_main
>  		kmstest_set_vt_graphics_mode();
>  		igt_display_require(&data.display, data.drm_fd);
>  		igt_display_require_output(&data.display);
> +
> +		for_each_connected_output(&data.display, output) {
> +			data.mst_output[count++] =3D output;
> +			if (output_is_dp_mst(&data, output, dp_mst_outputs))
> +				dp_mst_outputs++;
> +		}
>  	}
>=20
>  	igt_describe("Test for validating display extended mode with a pair of
> connected displays");
>  	igt_subtest_with_dynamic("extended-mode-basic")
>  		run_extendedmode_test(&data);
>=20
> +	igt_describe("Negative test for validating display extended mode with a
> pair of connected "
> +		     "2k-4k or 4k-4k displays");
> +	igt_subtest_with_dynamic("mst-extended-mode-negative") {
> +		igt_require_f(dp_mst_outputs > 1, "MST not found more then
> one\n");
> +
> +		 memcpy(&data.mode_mst[0], get_mode(data.mst_output[0]),
> sizeof(drmModeModeInfo));
> +		 memcpy(&data.mode_mst[1],
> get_highres_mode(data.mst_output[1]),
> +				 sizeof(drmModeModeInfo));
> +
> +		igt_require_f((data.mode_mst[1].hdisplay >=3D HDISPLAY_4K &&
> +			       data.mode_mst[1].vdisplay >=3D VDISPLAY_4K), "4k
> panel not
> +found\n");
> +
> +		for_each_pipe(&data.display, pipe1) {
> +			for_each_pipe(&data.display, pipe2) {
> +				if (pipe1 =3D=3D pipe2)
> +					continue;
> +
> +				igt_dynamic_f("pipe-%s-%s",
> kmstest_pipe_name(pipe1),
> +					      kmstest_pipe_name(pipe2))
> +					run_extendedmode_negative(&data,
> pipe1, pipe2);
> +			}
> +		}
> +	}
> +
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  	}
> --
> 2.25.1
