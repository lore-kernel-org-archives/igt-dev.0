Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5698310EA79
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 08:15:56 +0000 (UTC)
Message-ID: <5903c186-2364-b54e-2c77-e7d351f44966@intel.com>
Date: Thu, 22 Sep 2022 13:45:37 +0530
Content-Language: en-US
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220922062640.29863-1-karthik.b.s@intel.com>
 <20220922062640.29863-2-karthik.b.s@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220922062640.29863-2-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/2] tests/kms_content_protection:
 Test Cleanup
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

On Thu-22-09-2022 11:56 am, Karthik B S wrote:
> This patch includes:
>      1.Add a modeset before checking output is HDCP capable.
>        Test currently skips on multidisplay MST because we're checking
>        if output is HDCP capable before doing a modeset on the output.
>      2.Call igt_display_reset before starting the subtest.
>      3.test_fini function added to prepare test for converting to dynamic.
>      4.Remove redundant mode override.
>      5.Try other pipe/output combo for MST if failure is seen on one.
> 
> v2: -Update commit style in test_content_protection_cleanup.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_content_protection.c | 181 +++++++++++++++++----------------
>   1 file changed, 93 insertions(+), 88 deletions(-)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 3041f1cd..54288701 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -170,18 +170,15 @@ static void modeset_with_fb(const enum pipe pipe, igt_output_t *output,
>   			    enum igt_commit_style s)
>   {
>   	igt_display_t *display = &data.display;
> -	drmModeModeInfo mode;
> +	drmModeModeInfo *mode;
>   	igt_plane_t *primary;
>   
> -	igt_assert(kmstest_get_connector_default_mode(
> -			display->drm_fd, output->config.connector, &mode));
> -
> -	igt_output_override_mode(output, &mode);
> +	mode = igt_output_get_mode(output);
>   	igt_output_set_pipe(output, pipe);
>   
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   	igt_plane_set_fb(primary, &data.red);
> -	igt_fb_set_size(&data.red, primary, mode.hdisplay, mode.vdisplay);
> +	igt_fb_set_size(&data.red, primary, mode->hdisplay, mode->vdisplay);
>   
>   	igt_display_commit2(display, s);
>   
> @@ -317,90 +314,61 @@ static bool write_srm_as_fw(const __u8 *srm, int len)
>   }
>   
>   static void test_content_protection_on_output(igt_output_t *output,
> +					      enum pipe pipe,
>   					      enum igt_commit_style s,
>   					      int content_type)
>   {
>   	igt_display_t *display = &data.display;
> -	igt_plane_t *primary;
> -	enum pipe pipe;
>   	bool ret;
>   
> -	for_each_pipe(display, pipe) {
> -		if (!igt_pipe_connector_valid(pipe, output))
> -			continue;
> -
> -		/*
> -		 * If previous subtest of connector failed, pipe
> -		 * attached to that connector is not released.
> -		 * Because of that we have to choose the non
> -		 * attached pipe for this subtest.
> -		 */
> -		if (!igt_pipe_is_free(display, pipe))
> -			continue;
> -
> -		modeset_with_fb(pipe, output, s);
> -		test_cp_enable_with_retry(output, s, 3, content_type, false,
> -					  false);
> -
> -		if (data.cp_tests & CP_TYPE_CHANGE) {
> -			/* Type 1 -> Type 0 */
> -			test_cp_enable_with_retry(output, s, 3,
> -						  HDCP_CONTENT_TYPE_0, false,
> -						  true);
> -			/* Type 0 -> Type 1 */
> -			test_cp_enable_with_retry(output, s, 3,
> -						  content_type, false,
> -						  true);
> -		}
> -
> -		if (data.cp_tests & CP_MEI_RELOAD) {
> -			igt_assert_f(!igt_kmod_unload("mei_hdcp", 0),
> -				     "mei_hdcp unload failed");
> +	test_cp_enable_with_retry(output, s, 3, content_type, false,
> +				  false);
> +
> +	if (data.cp_tests & CP_TYPE_CHANGE) {
> +		/* Type 1 -> Type 0 */
> +		test_cp_enable_with_retry(output, s, 3,
> +					  HDCP_CONTENT_TYPE_0, false,
> +					  true);
> +		/* Type 0 -> Type 1 */
> +		test_cp_enable_with_retry(output, s, 3,
> +					  content_type, false,
> +					  true);
> +	}
>   
> -			/* Expected to fail */
> -			test_cp_enable_with_retry(output, s, 3,
> -						  content_type, true, false);
> +	if (data.cp_tests & CP_MEI_RELOAD) {
> +		igt_assert_f(!igt_kmod_unload("mei_hdcp", 0),
> +			     "mei_hdcp unload failed");
>   
> -			igt_assert_f(!igt_kmod_load("mei_hdcp", NULL),
> -				     "mei_hdcp load failed");
> +		/* Expected to fail */
> +		test_cp_enable_with_retry(output, s, 3,
> +					  content_type, true, false);
>   
> -			/* Expected to pass */
> -			test_cp_enable_with_retry(output, s, 3,
> -						  content_type, false, false);
> -		}
> +		igt_assert_f(!igt_kmod_load("mei_hdcp", NULL),
> +			     "mei_hdcp load failed");
>   
> -		if (data.cp_tests & CP_LIC)
> -			test_cp_lic(output);
> +		/* Expected to pass */
> +		test_cp_enable_with_retry(output, s, 3,
> +					  content_type, false, false);
> +	}
>   
> -		if (data.cp_tests & CP_DPMS) {
> -			igt_pipe_set_prop_value(display, pipe,
> -						IGT_CRTC_ACTIVE, 0);
> -			igt_display_commit2(display, s);
> +	if (data.cp_tests & CP_LIC)
> +		test_cp_lic(output);
>   
> -			igt_pipe_set_prop_value(display, pipe,
> -						IGT_CRTC_ACTIVE, 1);
> -			igt_display_commit2(display, s);
> +	if (data.cp_tests & CP_DPMS) {
> +		igt_pipe_set_prop_value(display, pipe,
> +					IGT_CRTC_ACTIVE, 0);
> +		igt_display_commit2(display, s);
>   
> -			ret = wait_for_prop_value(output, CP_ENABLED,
> -						  KERNEL_AUTH_TIME_ALLOWED_MSEC);
> -			if (!ret)
> -				test_cp_enable_with_retry(output, s, 2,
> -							  content_type, false,
> -							  false);
> -		}
> +		igt_pipe_set_prop_value(display, pipe,
> +					IGT_CRTC_ACTIVE, 1);
> +		igt_display_commit2(display, s);
>   
> -		test_cp_disable(output, s);
> -		primary = igt_output_get_plane_type(output,
> -						    DRM_PLANE_TYPE_PRIMARY);
> -		igt_plane_set_fb(primary, NULL);
> -		igt_output_set_pipe(output, PIPE_NONE);
> -
> -		/*
> -		 * Testing a output with a pipe is enough for HDCP
> -		 * testing. No ROI in testing the connector with other
> -		 * pipes. So Break the loop on pipe.
> -		 */
> -		break;
> +		ret = wait_for_prop_value(output, CP_ENABLED,
> +					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
> +		if (!ret)
> +			test_cp_enable_with_retry(output, s, 2,
> +						  content_type, false,
> +						  false);
>   	}
>   }
>   
> @@ -458,7 +426,8 @@ static bool sink_hdcp2_capable(igt_output_t *output)
>   	return strstr(buf, "HDCP2.2");
>   }
>   
> -static void prepare_modeset_on_mst_output(igt_output_t *output)
> +static void
> +prepare_modeset_on_mst_output(igt_output_t *output)
>   {
>   	drmModeModeInfo *mode;
>   	igt_plane_t *primary;
> @@ -477,7 +446,8 @@ static void prepare_modeset_on_mst_output(igt_output_t *output)
>   	igt_plane_set_size(primary, width, height);
>   }
>   
> -static bool output_hdcp_capable(igt_output_t *output, int content_type)
> +static bool
> +output_hdcp_capable(igt_output_t *output, int content_type)
>   {
>   		if (!output->props[IGT_CONNECTOR_CONTENT_PROTECTION])
>   			return false;
> @@ -499,6 +469,19 @@ static bool output_hdcp_capable(igt_output_t *output, int content_type)
>   		return true;
>   }
>   
> +static void
> +test_fini(igt_output_t *output, enum igt_commit_style s)
> +{
> +	igt_plane_t *primary;
> +
> +	test_cp_disable(output, s);
> +	primary = igt_output_get_plane_type(output,
> +					    DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(&data.display, s);
> +}
> +
>   static void
>   test_content_protection(enum igt_commit_style s, int content_type)
>   {
> @@ -511,10 +494,27 @@ test_content_protection(enum igt_commit_style s, int content_type)
>   			      "mei_hdcp module is not loaded\n");
>   
>   	for_each_connected_output(display, output) {
> -		if (!output_hdcp_capable(output, content_type))
> -			continue;
> +		for_each_pipe(display, pipe) {
> +			if (!igt_pipe_connector_valid(pipe, output))
> +				continue;
> +
> +			igt_display_reset(display);
> +			modeset_with_fb(pipe, output, s);
> +
> +			if (!output_hdcp_capable(output, content_type))
> +				continue;
> +
> +			test_content_protection_on_output(output, pipe, s, content_type);
> +			test_fini(output, s);
> +
> +			/*
> +			 * Testing a output with a pipe is enough for HDCP
> +			 * testing. No ROI in testing the connector with other
> +			 * pipes. So Break the loop on pipe.
> +			 */
> +			break;
> +		}
>   
> -		test_content_protection_on_output(output, s, content_type);
>   		valid_tests++;
>   	}
>   
> @@ -596,6 +596,7 @@ test_content_protection_mst(int content_type)
>   	igt_output_t *output;
>   	int valid_outputs = 0, dp_mst_outputs = 0, ret, count, max_pipe = 0, i;
>   	enum pipe pipe;
> +	bool pipe_found;
>   	igt_output_t *mst_output[IGT_MAX_PIPES], *hdcp_mst_output[IGT_MAX_PIPES];
>   
>   	for_each_pipe(display, pipe)
> @@ -607,16 +608,20 @@ test_content_protection_mst(int content_type)
>   		if (!output_is_dp_mst(output, dp_mst_outputs))
>   			continue;
>   
> -		igt_assert_f(igt_pipe_connector_valid(pipe, output), "Output-pipe combination invalid\n");
> +		pipe_found = false;
> +		for_each_pipe(display, pipe) {
> +			if (igt_pipe_is_free(display, pipe) &&
> +			    igt_pipe_connector_valid(pipe, output)) {
> +				pipe_found = true;
> +				break;
> +			}
> +		}
> +
> +		igt_assert_f(pipe_found, "No valid pipe found for %s\n", output->name);
>   
>   		igt_output_set_pipe(output, pipe);
>   		prepare_modeset_on_mst_output(output);
>   		mst_output[dp_mst_outputs++] = output;
> -
> -		pipe++;
> -
> -		if (pipe > max_pipe)
> -			break;
>   	}
>   
>   	igt_require_f(dp_mst_outputs > 1, "No DP MST set up with >= 2 outputs found in a single topology\n");
> @@ -694,7 +699,7 @@ static void test_content_protection_cleanup(void)
>   			continue;
>   
>   		igt_info("CP Prop being UNDESIRED on %s\n", output->name);
> -		test_cp_disable(output, COMMIT_ATOMIC);
> +		test_cp_disable(output, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

>   	}
>   
>   	igt_remove_fb(data.drm_fd, &data.red);
