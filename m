Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BDD10E2B8
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jun 2023 15:08:48 +0000 (UTC)
Date: Mon, 5 Jun 2023 17:08:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230605150815.ssnxrz6ddf3d7kyc@kamilkon-desk1>
References: <20230507193943.57877-1-mohammed.thasleem@intel.com>
 <20230507193943.57877-2-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230507193943.57877-2-mohammed.thasleem@intel.com>
Subject: Re: [igt-dev] [PATCH v3 1/2] tests/kms_display_modes: Add negative
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

Hi Mohammed,

On 2023-05-08 at 01:09:42 +0530, Mohammed Thasleem wrote:
> Added negative test to validte ENOSPC when two 2k-4k or 4k-4k
> moniters connected through MST.
> This test added to provide bandwidth issue in MST config.
> 
> Example:
>   When two monitors connected through MST, the second monitor
>   also tries to use the same mode. So two such modes may not
>   fit into the link bandwidth. So, iterate through connected
>   outputs & modes and find a invalid combination.
> 
> v2: Rebased on tip.
> v3: -Code cleanup and updated description.
>     -Free path_blob before call return. (Kamil)
> v4: Updated code formatting and function description. (Jeevan)
> v5: Updated commit description and minor changes.
> v6: Added bigjoiner check and updated comments. (Bhanu)
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_display_modes.c | 165 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 165 insertions(+)
> 
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index d69c7b931..892f39b20 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -26,14 +26,111 @@
>  
>  #include "igt.h"
>  
> +#define HDISPLAY_4K	3840
> +#define VDISPLAY_4K	2160
> +
>  IGT_TEST_DESCRIPTION("Test Display Modes");
>  
>  typedef struct {
>  	int drm_fd;
>  	igt_display_t display;
> +	drmModeModeInfo mode_mst[2];
> +	igt_output_t *mst_output[2];
>  	int n_pipes;
>  } data_t;
>  
> +/* Get higher mode supported by panel. */
> +static drmModeModeInfo *get_highres_mode(igt_output_t *output)
> +{
> +	drmModeConnector *connector = output->config.connector;
> +	drmModeModeInfo *highest_mode = NULL;
> +
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> +	highest_mode = &connector->modes[0];
> +
> +	return highest_mode;
> +}
> +
> +/* Get the 4k or less then 4k mode of connected panel. */
> +static drmModeModeInfo *get_mode(igt_output_t *output)
> +{
> +	int j;
> +	drmModeModeInfo *required_mode = NULL;
> +	drmModeConnector *connector = output->config.connector;
> +
> +	required_mode = igt_output_get_mode(output);
> +	if (required_mode->vdisplay <= VDISPLAY_4K &&
> +	    required_mode->hdisplay <= HDISPLAY_4K) {
> +		return required_mode;
> +	}
> +
> +	/* If default mode not 4k or less than 4k mode, then sort modes and check for it. */
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> +	for (j = 0; j < connector->count_modes; j++) {
> +		if (connector->modes[j].vdisplay <= VDISPLAY_4K &&
> +		    connector->modes[j].hdisplay <= HDISPLAY_4K) {
> +			required_mode = &connector->modes[j];
> +			break;
> +		}
> +	}
> +
> +	return required_mode;
> +}
> +
> +static int parse_path_blob(char *blob_data)
> +{
> +	int connector_id;
> +	char *encoder;
> +
> +	encoder = strtok(blob_data, ":");
> +	igt_assert_f(!strcmp(encoder, "mst"), "PATH connector property expected to have 'mst'\n");
> +
> +	connector_id = atoi(strtok(NULL, "-"));
> +
> +	return connector_id;
> +}
> +
> +static bool output_is_dp_mst(data_t *data, igt_output_t *output, int i)
> +{
> +	drmModePropertyBlobPtr path_blob = NULL;
> +	uint64_t path_blob_id;
> +	drmModeConnector *connector = output->config.connector;
> +	struct kmstest_connector_config config;
> +	const char *encoder;
> +	int connector_id;
> +	static int prev_connector_id;
> +
> +	kmstest_get_connector_config(data->drm_fd, output->config.connector->connector_id,
> +				     -1, &config);
> +	encoder = kmstest_encoder_type_str(config.encoder->encoder_type);
> +
> +	if (strcmp(encoder, "DP MST"))
> +		return false;
> +
> +	igt_assert(kmstest_get_property(data->drm_fd, connector->connector_id,
> +		   DRM_MODE_OBJECT_CONNECTOR, "PATH", NULL,
> +		   &path_blob_id, NULL));
> +
> +	igt_assert(path_blob = drmModeGetPropertyBlob(data->drm_fd, path_blob_id));
> +
> +	connector_id = parse_path_blob((char *) path_blob->data);
> +
> +	drmModeFreePropertyBlob(path_blob);
> +
> +	/*
> +	 * Discarding outputs of other DP MST topology.
> +	 * Testing only on outputs on the topology we got previously
> +	 */
> +	if (i == 0) {
> +		prev_connector_id = connector_id;
> +	} else {
> +		if (connector_id != prev_connector_id)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>  static void run_extendedmode_basic(data_t *data,
>  				   enum pipe pipe1, igt_output_t *output1,
>  				   enum pipe pipe2, igt_output_t *output2)
> @@ -173,8 +270,47 @@ static void run_extendedmode_test(data_t *data) {
>  	}
>  }
>  
> +static void run_extendedmode_negative(data_t *data, int pipe1, int pipe2)
> +{
> +	struct igt_fb fbs[2];
> +	igt_display_t *display = &data->display;
> +	igt_plane_t *plane[2];
> +	int ret;
> +
> +	igt_display_reset(display);
> +
> +	igt_output_set_pipe(data->mst_output[0], pipe1);
> +	igt_output_set_pipe(data->mst_output[1], pipe2);
> +
> +	igt_create_color_fb(data->drm_fd, data->mode_mst[0].hdisplay, data->mode_mst[0].vdisplay,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 1, 0, 0, &fbs[0]);
> +	igt_create_color_fb(data->drm_fd, data->mode_mst[1].hdisplay, data->mode_mst[1].vdisplay,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, 0, 1, &fbs[1]);
> +
> +	plane[0] = igt_pipe_get_plane_type(&display->pipes[pipe1], DRM_PLANE_TYPE_PRIMARY);
> +	plane[1] = igt_pipe_get_plane_type(&display->pipes[pipe2], DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_plane_set_fb(plane[0], &fbs[0]);
> +	igt_fb_set_size(&fbs[0], plane[0], data->mode_mst[0].hdisplay, data->mode_mst[0].vdisplay);
> +	igt_plane_set_size(plane[0], data->mode_mst[0].hdisplay, data->mode_mst[0].vdisplay);
> +
> +	igt_plane_set_fb(plane[1], &fbs[1]);
> +	igt_fb_set_size(&fbs[1], plane[1], data->mode_mst[1].hdisplay, data->mode_mst[1].vdisplay);
> +	igt_plane_set_size(plane[1], data->mode_mst[1].hdisplay, data->mode_mst[1].vdisplay);
> +
> +	igt_output_override_mode(data->mst_output[0], &data->mode_mst[0]);
> +	igt_output_override_mode(data->mst_output[1], &data->mode_mst[1]);
> +
> +	igt_require(i915_pipe_output_combo_valid(display));
> +	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> +	igt_assert(ret != 0 && errno == ENOSPC);
> +}
> +
>  igt_main
>  {
> +	int dp_mst_outputs = 0, count = 0;
> +	enum pipe pipe1, pipe2;
> +	igt_output_t *output;
>  	data_t data;
>  
>  	igt_fixture {
> @@ -182,12 +318,41 @@ igt_main
>  		kmstest_set_vt_graphics_mode();
>  		igt_display_require(&data.display, data.drm_fd);
>  		igt_display_require_output(&data.display);
> +
> +		for_each_connected_output(&data.display, output) {
> +			data.mst_output[count++] = output;
> +			if (output_is_dp_mst(&data, output, dp_mst_outputs))
> +				dp_mst_outputs++;
> +		}
>  	}
>  
>  	igt_describe("Test for validating display extended mode with a pair of connected displays");
>  	igt_subtest_with_dynamic("extended-mode-basic")
>  		run_extendedmode_test(&data);
>  
> +	igt_describe("Negative test for validating display extended mode with a pair of connected "
> +		     "2k-4k or 4k-4k displays");
> +	igt_subtest_with_dynamic("mst-extended-mode-negative") {
> +		igt_require_f(dp_mst_outputs > 1, "MST not found more then one\n");
> +
> +		memcpy(&data.mode_mst[0], get_mode(data.mst_output[0]), sizeof(drmModeModeInfo));
> +		memcpy(&data.mode_mst[1], get_highres_mode(data.mst_output[1]),
> +				sizeof(drmModeModeInfo));
> +		igt_require_f((data.mode_mst[1].hdisplay >= HDISPLAY_4K &&
> +			       data.mode_mst[1].vdisplay >= VDISPLAY_4K), "4k panel not found\n");

I just realised that you sorted that so no need for [0] checks.
I merged your series after correcting some misspellings.

Regards,
Kamil

> +
> +		for_each_pipe(&data.display, pipe1) {
> +			for_each_pipe(&data.display, pipe2) {
> +				if (pipe1 == pipe2)
> +					continue;
> +
> +				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe1),
> +					      kmstest_pipe_name(pipe2))
> +					run_extendedmode_negative(&data, pipe1, pipe2);
> +			}
> +		}
> +	}
> +
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  	}
> -- 
> 2.25.1
> 
