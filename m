Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E522E8997E
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2020 09:55:22 +0000 (UTC)
Date: Tue, 10 Nov 2020 15:11:07 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <20201110094106.GA3420@intel.com>
References: <20201103082628.9287-1-karthik.b.s@intel.com>
 <20201103082628.9287-2-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103082628.9287-2-karthik.b.s@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/2] tests/kms_content_protection:
 Add MST subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-11-03 at 13:56:27 +0530, Karthik B S wrote:
> Add subtests to verify content protection simultaneously on
> multiple outputs on the same MST topology.
> 
> v3: -Remove the logging which are no longer required. (Anshuman)
>     -Add logic to verify that CP is still enabled on other connectors
>      while disabling it on one of the connectors. (Anshuman)
overall test content looks good to me, there are some comments below,
> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_content_protection.c | 234 ++++++++++++++++++++++++++++++++-
>  1 file changed, 233 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 303ed418..cb895a72 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -42,6 +42,12 @@ struct data {
>  	struct udev_monitor *uevent_monitor;
>  } data;
>  
> +typedef struct {
> +	float red;
> +	float green;
> +	float blue;
> +} color_t;
> +
>  /* Test flags */
>  #define CP_DPMS					(1 << 0)
>  #define CP_LIC					(1 << 1)
> @@ -457,6 +463,54 @@ static bool sink_hdcp2_capable(igt_output_t *output)
>  
>  	return strstr(buf, "HDCP2.2");
>  }
> +color_t red  = { 1.0f, 0.0f, 0.0f };
> +color_t green  = { 0.0f, 0.1f, 0.0f };
> +
> +static void prepare_modeset_on_mst_output(igt_output_t *output, enum pipe pipe)
> +{
> +	drmModeConnectorPtr c = output->config.connector;
> +	igt_display_t *display = &data.display;
> +	drmModeModeInfo *mode;
> +	igt_plane_t *primary;
> +	int i;
> +
> +	mode = igt_output_get_mode(output);
> +
> +	/*
> +	 * TODO: Add logic to use the highest possible modes on each output.
> +	 * Currently using 2k modes by default on all the outputs.
> +	 */
> +	igt_debug("Before mode override: Output %s Mode hdisplay %d Mode vdisplay %d\n",
> +		   output->name, mode->hdisplay, mode->vdisplay);
> +
> +	if (mode->hdisplay > 1920 && mode->vdisplay > 1080) {
> +		for (i = 0; i < c->count_modes; i++) {
> +			if (c->modes[i].hdisplay <= 1920 && c->modes[i].vdisplay <= 1080) {
> +				mode = &c->modes[i];
> +				igt_output_override_mode(output, mode);
> +				break;
> +			}
> +		}
> +	}
> +
> +	igt_debug("After mode overide: Output %s Mode hdisplay %d Mode vdisplay %d\n",
> +		   output->name, mode->hdisplay, mode->vdisplay);
> +
> +	if (pipe % 2) {
> +		igt_create_color_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
> +				    red.red, red.blue, red.green, &data.red);
> +	} else {
> +		igt_create_color_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
> +				    green.red, green.blue, green.green, &data.green);
> +	}
> +
> +	igt_output_set_pipe(output, pipe);
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, NULL);
> +	igt_plane_set_fb(primary, pipe % 2 ? &data.red : &data.green);
> +}
>  
>  static void
>  test_content_protection(enum igt_commit_style s, int content_type)
> @@ -496,6 +550,162 @@ test_content_protection(enum igt_commit_style s, int content_type)
>  	igt_require_f(valid_tests, "No connector found with HDCP capability\n");
>  }
>  
> +static bool is_output_support_cp_capable(igt_output_t *output, int content_type)
is_output_support_hdcp_capable suits more.
could please avoid code duplication of is_output_support_cp_capable() in test_content_protection().
> +{
> +		if (!output->props[IGT_CONNECTOR_CONTENT_PROTECTION])
> +			return false;
> +
> +		if (!output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE] &&
> +		    content_type)
> +			return false;
> +
> +		if (content_type && !sink_hdcp2_capable(output)) {
> +			igt_info("\tSkip %s (Sink has no HDCP2.2 support)\n",
> +				 output->name);
> +			return false;
> +		} else if (!sink_hdcp_capable(output)) {
> +			igt_info("\tSkip %s (Sink has no HDCP support)\n",
> +				 output->name);
> +			return false;
> +		}
> +
> +		return true;
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
> +static bool is_dp_mst_output(igt_output_t *output, int i)
> +{
> +	drmModePropertyBlobPtr path_blob = NULL;
> +	uint64_t path_blob_id;
> +	drmModeConnector *connector = output->config.connector;
> +	struct kmstest_connector_config config;
> +	const char *encoder;
> +	int connector_id;
> +	static int prev_connector_id;
> +
> +	kmstest_get_connector_config(data.drm_fd, output->config.connector->connector_id, -1, &config);
> +	encoder = kmstest_encoder_type_str(config.encoder->encoder_type);
> +
> +	if (strcmp(encoder, "DP MST"))
> +		return false;
> +
> +	igt_assert(kmstest_get_property(data.drm_fd, connector->connector_id,
> +		   DRM_MODE_OBJECT_CONNECTOR, "PATH", NULL,
> +		   &path_blob_id, NULL));
> +
> +	igt_assert(path_blob = drmModeGetPropertyBlob(data.drm_fd, path_blob_id));
> +
> +	connector_id = parse_path_blob((char *) path_blob->data);
> +
> +	/* Check if all the MST outputs are in the same topology */
Add some comment like, we are discarding outputs of other DP MST topology.
We are testing only on outputs which topology we found out first.
> +	if (i == 0) {
> +		prev_connector_id = connector_id;
> +	} else {
> +		if (connector_id != prev_connector_id)
> +			return false;
> +	}
> +
> +	drmModeFreePropertyBlob(path_blob);
> +
> +	return true;
> +}
> +
> +static void
> +test_content_protection_mst(int content_type)
> +{
> +	igt_display_t *display = &data.display;
> +	igt_output_t *output;
> +	int valid_outputs = 0, ret, count, max_pipe = 0, i;
> +	enum pipe pipe;
> +	igt_output_t *mst_output[IGT_MAX_PIPES];
> +
> +	for_each_connected_output(display, output) {
> +		if (!is_dp_mst_output(output, valid_outputs))
> +			continue;
> +
> +		if (!is_output_support_cp_capable(output, content_type))
> +			continue;
> +
> +		mst_output[valid_outputs] = output;
> +		valid_outputs++;
> +	}
> +
> +	igt_require_f(valid_outputs > 1, "No DP MST set up with >= 2 outputs found in a single topology\n");
> +
> +	for_each_pipe(display, pipe)
> +		max_pipe++;
> +
> +	if (valid_outputs > max_pipe)
> +		valid_outputs = max_pipe;
> +
> +	pipe = PIPE_A;
> +
> +	for (count = 0; count < valid_outputs; count++) {
> +		igt_assert_f(igt_pipe_connector_valid(pipe, mst_output[count]), "Output-pipe combination invalid\n");
> +
> +		prepare_modeset_on_mst_output(mst_output[count], pipe);
> +		pipe++;
> +	}
> +
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	for (count = 0; count < valid_outputs; count++) {
> +		igt_output_set_prop_value(mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
> +
> +		if (output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
> +			igt_output_set_prop_value(mst_output[count], IGT_CONNECTOR_HDCP_CONTENT_TYPE, content_type);
> +	}
> +
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	for (count = 0; count < valid_outputs; count++) {
> +		igt_debug("Test CP Prop to be ENABLED %s\n", mst_output[count]->name);
> +		ret = wait_for_prop_value(mst_output[count], CP_ENABLED, KERNEL_AUTH_TIME_ALLOWED_MSEC);
> +		igt_assert_f(ret, "Content Protection not enabled output %s\n", mst_output[count]->name);
> +
> +		if (data.cp_tests & CP_LIC)
> +			test_cp_lic(mst_output[count]);
> +	}
> +
> +	for (count = 0; count < valid_outputs; count++) {
> +		igt_debug("Test CP Prop to be ENABLED %s\n", mst_output[count]->name);
> +		ret = wait_for_prop_value(mst_output[count], CP_ENABLED, KERNEL_AUTH_TIME_ALLOWED_MSEC);
> +		igt_assert_f(ret, "Content Protection not enabled output %s\n", mst_output[count]->name);
		I belive we don't reqire above HDCP check hunk, we want to disbale the HDCP and check it on other
		DP_MST outputs.
> +
> +		igt_debug("CP Prop being UNDESIRED on %s\n", mst_output[count]->name);
> +		test_cp_disable(mst_output[count], COMMIT_ATOMIC);
> +
> +		/* CP is expected to be still enabled on other outputs*/
> +		for (i = 0; i < valid_outputs; i++) {
> +			if (i == count)
> +				continue;
> +
> +			igt_debug("Test CP Prop to be ENABLED %s\n", mst_output[i]->name);
> +			ret = wait_for_prop_value(mst_output[i], CP_ENABLED, KERNEL_AUTH_TIME_ALLOWED_MSEC);
> +			igt_assert_f(ret, "Content Protection not enabled output %s\n", mst_output[i]->name);
		Let's also check link on output on which HDCP enabled when HDCP was disabled other DP MST output
			if (data.cp_tests & CP_LIC)
				test_cp_lic(mst_output[count]);
> +		}
> +
> +		igt_output_set_prop_value(mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
> +
> +		if (output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
> +			igt_output_set_prop_value(mst_output[count], IGT_CONNECTOR_HDCP_CONTENT_TYPE, content_type);
> +
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +	}
> +}
> +
>  static void test_content_protection_cleanup(void)
>  {
>  	igt_display_t *display = &data.display;
> @@ -511,7 +721,7 @@ static void test_content_protection_cleanup(void)
>  		if (val == CP_UNDESIRED)
>  			continue;
>  
> -		igt_info("CP Prop being UNDESIRED on %s\n", output->name);
> +		igt_debug("CP Prop being UNDESIRED on %s\n", output->name);
This is unwanted change.
Thanks,
Anshuman Gupta.
>  		test_cp_disable(output, COMMIT_ATOMIC);
>  	}
>  }
> @@ -592,6 +802,28 @@ igt_main
>  		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
>  	}
>  
> +	igt_describe("Test Content protection over DP MST");
> +	igt_subtest("dp-mst-type-0") {
> +		test_content_protection_mst(HDCP_CONTENT_TYPE_0);
> +	}
> +
> +	igt_describe("Test Content protection over DP MST with LIC");
> +	igt_subtest("dp-mst-lic-type-0") {
> +		data.cp_tests = CP_LIC;
> +		test_content_protection_mst(HDCP_CONTENT_TYPE_0);
> +	}
> +
> +	igt_describe("Test Content protection over DP MST");
> +	igt_subtest("dp-mst-type-1") {
> +		test_content_protection_mst(HDCP_CONTENT_TYPE_1);
> +	}
> +
> +	igt_describe("Test Content protection over DP MST with LIC");
> +	igt_subtest("dp-mst-lic-type-1") {
> +		data.cp_tests = CP_LIC;
> +		test_content_protection_mst(HDCP_CONTENT_TYPE_1);
> +	}
> +
>  	igt_fixture {
>  		test_content_protection_cleanup();
>  		igt_display_fini(&data.display);
> -- 
> 2.22.0
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
