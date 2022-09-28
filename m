Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091C410E310
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 15:51:46 +0000 (UTC)
Date: Wed, 28 Sep 2022 17:51:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YzRtjjqkidn6DKt8@kamilkon-desk1>
References: <20220928121304.2590-1-karthik.b.s@intel.com>
 <20220928121304.2590-2-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220928121304.2590-2-karthik.b.s@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v6 1/3] tests/kms_content_protection:
 Fix MST subtests
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

Hi Karthik,

On 2022-09-28 at 17:43:02 +0530, Karthik B S wrote:
> Add a modeset before checking output is HDCP capable.
> Test currently skips on multidisplay MST config telling no HDCP capable
> output is found because we're checking if output is HDCP capable
> before doing a modeset on that output.
> 
> Try other pipe/output combo for MST if failure is seen on one, as the
> test is not dependent on the combination as long as each output has a
> valid pipe.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_content_protection.c | 154 ++++++++++++++++-----------------
>  1 file changed, 77 insertions(+), 77 deletions(-)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 3041f1cd..b284365d 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -317,91 +317,70 @@ static bool write_srm_as_fw(const __u8 *srm, int len)
>  }
>  
>  static void test_content_protection_on_output(igt_output_t *output,
> +					      enum pipe pipe,
>  					      enum igt_commit_style s,
>  					      int content_type)
>  {
>  	igt_display_t *display = &data.display;
>  	igt_plane_t *primary;
> -	enum pipe pipe;
>  	bool ret;
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
> +	if (data.cp_tests & CP_MEI_RELOAD) {
> +		igt_assert_f(!igt_kmod_unload("mei_hdcp", 0),
> +			     "mei_hdcp unload failed");
>  
> -		if (data.cp_tests & CP_MEI_RELOAD) {
> -			igt_assert_f(!igt_kmod_unload("mei_hdcp", 0),
> -				     "mei_hdcp unload failed");
> +		/* Expected to fail */
> +		test_cp_enable_with_retry(output, s, 3,
> +					  content_type, true, false);
>  
> -			/* Expected to fail */
> -			test_cp_enable_with_retry(output, s, 3,
> -						  content_type, true, false);
> +		igt_assert_f(!igt_kmod_load("mei_hdcp", NULL),
> +			     "mei_hdcp load failed");
>  
> -			igt_assert_f(!igt_kmod_load("mei_hdcp", NULL),
> -				     "mei_hdcp load failed");
> +		/* Expected to pass */
> +		test_cp_enable_with_retry(output, s, 3,
> +					  content_type, false, false);
> +	}
>  
> -			/* Expected to pass */
> -			test_cp_enable_with_retry(output, s, 3,
> -						  content_type, false, false);
> -		}
> +	if (data.cp_tests & CP_LIC)
> +		test_cp_lic(output);
>  
> -		if (data.cp_tests & CP_LIC)
> -			test_cp_lic(output);
> +	if (data.cp_tests & CP_DPMS) {
> +		igt_pipe_set_prop_value(display, pipe,
> +					IGT_CRTC_ACTIVE, 0);
> +		igt_display_commit2(display, s);
>  
> -		if (data.cp_tests & CP_DPMS) {
> -			igt_pipe_set_prop_value(display, pipe,
> -						IGT_CRTC_ACTIVE, 0);
> -			igt_display_commit2(display, s);
> +		igt_pipe_set_prop_value(display, pipe,
> +					IGT_CRTC_ACTIVE, 1);
> +		igt_display_commit2(display, s);
>  
> -			igt_pipe_set_prop_value(display, pipe,
> -						IGT_CRTC_ACTIVE, 1);
> -			igt_display_commit2(display, s);
> +		ret = wait_for_prop_value(output, CP_ENABLED,
> +					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
> +		if (!ret)
> +			test_cp_enable_with_retry(output, s, 2,
> +						  content_type, false,
> +						  false);
> +	}
>  
> -			ret = wait_for_prop_value(output, CP_ENABLED,
> -						  KERNEL_AUTH_TIME_ALLOWED_MSEC);
> -			if (!ret)
> -				test_cp_enable_with_retry(output, s, 2,
> -							  content_type, false,
> -							  false);
> -		}
> +	test_cp_disable(output, s);
> +	primary = igt_output_get_plane_type(output,
> +					    DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
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
> -	}
>  }
>  
>  static void __debugfs_read(int fd, const char *param, char *buf, int len)
> @@ -505,16 +484,32 @@ test_content_protection(enum igt_commit_style s, int content_type)
>  	igt_display_t *display = &data.display;
>  	igt_output_t *output;
>  	int valid_tests = 0;
> +	enum pipe pipe;
>  
>  	if (data.cp_tests & CP_MEI_RELOAD)
>  		igt_require_f(igt_kmod_is_loaded("mei_hdcp"),
>  			      "mei_hdcp module is not loaded\n");
>  
>  	for_each_connected_output(display, output) {
> -		if (!output_hdcp_capable(output, content_type))
> -			continue;

Consider if this check can stay here before for_each_pipe loop,
unless modeset_with_fb changes output ?
imho someone from KMS should look into it.

> +		for_each_pipe(display, pipe) {
> +			if (!igt_pipe_connector_valid(pipe, output))
> +				continue;
> +
> +			modeset_with_fb(pipe, output, s);
> +
> +			if (!output_hdcp_capable(output, content_type))
> +				continue;
> +
> +			test_content_protection_on_output(output, pipe, s, content_type);
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
>  		valid_tests++;
--------------- ^
This should be moved in this patch, please make all changes
correct in the first go.

Regards,
Kamil

>  	}
>  
> @@ -596,6 +591,7 @@ test_content_protection_mst(int content_type)
>  	igt_output_t *output;
>  	int valid_outputs = 0, dp_mst_outputs = 0, ret, count, max_pipe = 0, i;
>  	enum pipe pipe;
> +	bool pipe_found;
>  	igt_output_t *mst_output[IGT_MAX_PIPES], *hdcp_mst_output[IGT_MAX_PIPES];
>  
>  	for_each_pipe(display, pipe)
> @@ -607,16 +603,20 @@ test_content_protection_mst(int content_type)
>  		if (!output_is_dp_mst(output, dp_mst_outputs))
>  			continue;
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
>  		igt_output_set_pipe(output, pipe);
>  		prepare_modeset_on_mst_output(output);
>  		mst_output[dp_mst_outputs++] = output;
> -
> -		pipe++;
> -
> -		if (pipe > max_pipe)
> -			break;
>  	}
>  
>  	igt_require_f(dp_mst_outputs > 1, "No DP MST set up with >= 2 outputs found in a single topology\n");
> -- 
> 2.22.0
> 
