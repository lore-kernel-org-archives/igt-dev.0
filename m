Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E63E10E179
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 10:41:32 +0000 (UTC)
Date: Fri, 9 Sep 2022 12:41:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YxsYV34uz+StVKJ9@kamilkon-desk1>
References: <20220909051724.23390-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220909051724.23390-1-karthik.b.s@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_content_protection:
 Convert tests to Dynamic
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

On 2022-09-09 at 10:47:24 +0530, Karthik B S wrote:
> Covert the existing subtests to dynamic subtests at pipe/output level.
> Also move the cleanup part outside the subtest so that it is run even if
> a failure is seen in the subtest.
> 
> v2: -Try other pipe/output combo for MST if failure is seen on one
>     -Remove redundant mode_override
>     -Misc cleanup
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_content_protection.c | 409 ++++++++++++++++++---------------
>  1 file changed, 221 insertions(+), 188 deletions(-)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 3041f1cd..6829343c 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -170,18 +170,15 @@ static void modeset_with_fb(const enum pipe pipe, igt_output_t *output,
>  			    enum igt_commit_style s)
>  {
>  	igt_display_t *display = &data.display;
> -	drmModeModeInfo mode;
> +	drmModeModeInfo *mode;
>  	igt_plane_t *primary;
>  
> -	igt_assert(kmstest_get_connector_default_mode(
> -			display->drm_fd, output->config.connector, &mode));
> -
> -	igt_output_override_mode(output, &mode);
> +	mode = igt_output_get_mode(output);
>  	igt_output_set_pipe(output, pipe);
>  
>  	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, &data.red);
> -	igt_fb_set_size(&data.red, primary, mode.hdisplay, mode.vdisplay);
> +	igt_fb_set_size(&data.red, primary, mode->hdisplay, mode->vdisplay);
>  
>  	igt_display_commit2(display, s);
>  
> @@ -273,17 +270,6 @@ static void test_cp_enable_with_retry(igt_output_t *output,
>  
>  }
>  
> -static bool igt_pipe_is_free(igt_display_t *display, enum pipe pipe)
> -{
> -	int i;
> -
> -	for (i = 0; i < display->n_outputs; i++)
> -		if (display->outputs[i].pending_pipe == pipe)
> -			return false;
> -
> -	return true;
> -}
> -
>  static void test_cp_lic(igt_output_t *output)
>  {
>  	bool ret;
> @@ -317,90 +303,61 @@ static bool write_srm_as_fw(const __u8 *srm, int len)
>  }
>  
>  static void test_content_protection_on_output(igt_output_t *output,
> +					      enum pipe pipe,
>  					      enum igt_commit_style s,
>  					      int content_type)
>  {
>  	igt_display_t *display = &data.display;
> -	igt_plane_t *primary;
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
>  	}
>  }
>  
> @@ -477,7 +434,8 @@ static void prepare_modeset_on_mst_output(igt_output_t *output)
>  	igt_plane_set_size(primary, width, height);
>  }
>  
> -static bool output_hdcp_capable(igt_output_t *output, int content_type)
> +static bool
> +output_hdcp_capable(igt_output_t *output, int content_type)
>  {
>  		if (!output->props[IGT_CONNECTOR_CONTENT_PROTECTION])
>  			return false;
> @@ -499,26 +457,61 @@ static bool output_hdcp_capable(igt_output_t *output, int content_type)
>  		return true;
>  }
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
>  static void
>  test_content_protection(enum igt_commit_style s, int content_type)
>  {
>  	igt_display_t *display = &data.display;
>  	igt_output_t *output;
> -	int valid_tests = 0;
> +	enum pipe pipe;
>  
>  	if (data.cp_tests & CP_MEI_RELOAD)
>  		igt_require_f(igt_kmod_is_loaded("mei_hdcp"),
>  			      "mei_hdcp module is not loaded\n");
>  
> +	if (data.cp_tests & CP_UEVENT) {
> +		data.uevent_monitor = igt_watch_uevents();
> +		igt_flush_uevents(data.uevent_monitor);
> +	}
> +
>  	for_each_connected_output(display, output) {
> -		if (!output_hdcp_capable(output, content_type))
> -			continue;
> +		for_each_pipe(display, pipe) {
> +			if (!igt_pipe_connector_valid(pipe, output))
> +				continue;
> +
> +			igt_display_reset(display);
> +			modeset_with_fb(pipe, output, s);
>  
> -		test_content_protection_on_output(output, s, content_type);
> -		valid_tests++;
> +			if (!output_hdcp_capable(output, content_type))
> +				continue;
> +
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> +				test_content_protection_on_output(output, pipe, s, content_type);
> +
> +			test_fini(output, s);
> +			/*
> +			 * Testing a output with a pipe is enough for HDCP
> +			 * testing. No ROI in testing the connector with other
> +			 * pipes. So Break the loop on pipe.
> +			 */
> +			break;
> +		}
>  	}
>  
> -	igt_require_f(valid_tests, "No connector found with HDCP capability\n");
> +	if (data.cp_tests & CP_UEVENT)
> +		igt_cleanup_uevents(data.uevent_monitor);
>  }
>  
>  static int parse_path_blob(char *blob_data)
> @@ -596,6 +589,7 @@ test_content_protection_mst(int content_type)
>  	igt_output_t *output;
>  	int valid_outputs = 0, dp_mst_outputs = 0, ret, count, max_pipe = 0, i;
>  	enum pipe pipe;
> +	bool pipe_in_use, pipe_found;
>  	igt_output_t *mst_output[IGT_MAX_PIPES], *hdcp_mst_output[IGT_MAX_PIPES];
>  
>  	for_each_pipe(display, pipe)
> @@ -607,16 +601,28 @@ test_content_protection_mst(int content_type)
>  		if (!output_is_dp_mst(output, dp_mst_outputs))
>  			continue;
>  
> -		igt_assert_f(igt_pipe_connector_valid(pipe, output), "Output-pipe combination invalid\n");
> +		pipe_found = false;
> +		for_each_pipe(display, pipe) {
> +			pipe_in_use = false;
> +
> +			for (count = 0; count < dp_mst_outputs; count++) {
> +				if (pipe == mst_output[count]->pending_pipe) {
> +					pipe_in_use = true;
> +					break;
> +				}
> +			}
> +
> +			if (!pipe_in_use && igt_pipe_connector_valid(pipe, output)) {
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
> @@ -723,6 +729,94 @@ static void create_fbs(void)
>  			    0.f, 1.f, 0.f, &data.green);
>  }
>  
> +static const struct {
> +	const char *desc;
> +	const char *name;
> +	unsigned int cp_tests;
> +	bool content_type;
> +} subtests[] = {
> +	{ .desc = "Test content protection with atomic modesetting",
> +	  .name = "atomic",
> +	  .cp_tests = 0,
> +	  .content_type = HDCP_CONTENT_TYPE_0
> +	},
> +	{ .desc = "Test content protection with DPMS ON/OFF during atomic modesetting.",
> +	  .name = "atomic-dpms",
> +	  .cp_tests = CP_DPMS,
> +	  .content_type = HDCP_CONTENT_TYPE_0
> +	},
> +	{ .desc = "Test for the integrity of link.",
> +	  .name = "LIC",
> +	  .cp_tests = CP_LIC,
> +	  .content_type = HDCP_CONTENT_TYPE_0,
> +	},
> +	{ .desc = "Test content protection with content type 1 "
> +		  "that can be handled only through HDCP2.2.",
> +	  .name = "type1",
> +	  .cp_tests = 0,
> +	  .content_type = HDCP_CONTENT_TYPE_1,
> +	},
> +	{ .desc = "Test the teardown and rebuild of the interface between "
> +		  "I915 and mei hdcp.",
> +	  .name = "mei_interface",
> +	  .cp_tests = CP_MEI_RELOAD,
> +	  .content_type = HDCP_CONTENT_TYPE_1,
> +	},
> +	{ .desc = "Test the content type change when the content protection already enabled",
> +	  .name = "content_type_change",
> +	  .cp_tests = CP_TYPE_CHANGE,
> +	  .content_type = HDCP_CONTENT_TYPE_1,
> +	},
> +	{ .desc = "Test to detect the HDCP status change when we are reading the uevent "
> +		  "sent with the corresponding connector id and property id.",
> +	  .name = "uevent",
> +	  .cp_tests = CP_UEVENT,
> +	  .content_type = HDCP_CONTENT_TYPE_0,
> +	},
> +	/*
> +	 *  Testing the revocation check through SRM needs a HDCP sink with
> +	 *  programmable Ksvs or we need a uAPI from kernel to read the
> +	 *  connected HDCP sink's Ksv. With that we would be able to add that
> +	 *  Ksv into a SRM and send in for revocation check. Since we dont have
> +	 *  either of these options, we test SRM writing from userspace and
> +	 *  validation of the same at kernel. Something is better than nothing.
> +	 */
> +	{ .desc = "This test writes the facsimile SRM into the /lib/firmware/"
---------------------------------------------------------------------------- ^
Add space after /lib/firmware/.

--
Kamil

> +		  "and check the kernel parsing of it by invoking the hdcp authentication.",
> +	  .name = "srm",
> +	  .cp_tests = 0,
> +	  .content_type = HDCP_CONTENT_TYPE_0,
> +	},
> +};
> +
> +static const struct {
> +	const char *desc;
> +	const char *name;
> +	unsigned int cp_tests;
> +	bool content_type;
> +} mst_subtests[] = {
> +	{ .desc = "Test Content protection(Type 0) over DP MST.",
> +	  .name = "dp-mst-type-0",
> +	  .cp_tests = 0,
> +	  .content_type = HDCP_CONTENT_TYPE_0
> +	},
> +	{ .desc = "Test Content protection(Type 0) over DP MST with LIC.",
> +	  .name = "dp-mst-lic-type-0",
> +	  .cp_tests = CP_LIC,
> +	  .content_type = HDCP_CONTENT_TYPE_0
> +	},
> +	{ .desc = "Test Content protection(Type 1) over DP MST.",
> +	  .name = "dp-mst-type-1",
> +	  .cp_tests = 0,
> +	  .content_type = HDCP_CONTENT_TYPE_1,
> +	},
> +	{ .desc = "Test Content protection(Type 1) over DP MST with LIC.",
> +	  .name = "dp-mst-lic-type-1",
> +	  .cp_tests = CP_LIC,
> +	  .content_type = HDCP_CONTENT_TYPE_1,
> +	},
> +};
> +
>  igt_main
>  {
>  	igt_fixture {
> @@ -733,107 +827,46 @@ igt_main
>  	}
>  
>  	igt_describe("Test content protection with legacy style commit.");
> -	igt_subtest("legacy") {
> +	igt_subtest_with_dynamic("legacy") {
>  		data.cp_tests = 0;
>  		test_content_protection(COMMIT_LEGACY, HDCP_CONTENT_TYPE_0);
>  	}
>  
> -	igt_describe("Test content protection with atomic modesetting");
> -	igt_subtest("atomic") {
> -		igt_require(data.display.is_atomic);
> -		data.cp_tests = 0;
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
> -	}
> +	igt_subtest_group {
> +		igt_fixture
> +			igt_require(data.display.is_atomic);
>  
> -	igt_describe("Test content protection with DPMS ON/OFF during atomic modesetting.");
> -	igt_subtest("atomic-dpms") {
> -		igt_require(data.display.is_atomic);
> -		data.cp_tests = CP_DPMS;
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
> -	}
> +		for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
> +			igt_describe_f("%s", subtests[i].desc);
>  
> -	igt_describe("Test for the integrity of link.");
> -	igt_subtest("LIC") {
> -		igt_require(data.display.is_atomic);
> -		data.cp_tests = CP_LIC;
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
> -	}
> +			igt_subtest_with_dynamic(subtests[i].name) {
> +				data.cp_tests = subtests[i].cp_tests;
>  
> -	igt_describe("Test content protection with content type 1 that "
> -		     "can be handled only through HDCP2.2.");
> -	igt_subtest("type1") {
> -		igt_require(data.display.is_atomic);
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
> -	}
> +				if (!strcmp(subtests[i].name, "srm")) {
> +					bool ret;
>  
> -	igt_describe("Test the teardown and rebuild of the interface between "
> -		     "I915 and mei hdcp.");
> -	igt_subtest("mei_interface") {
> -		igt_require(data.display.is_atomic);
> -		data.cp_tests = CP_MEI_RELOAD;
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
> -	}
> +					ret = write_srm_as_fw((const __u8 *)facsimile_srm,
> +							     sizeof(facsimile_srm));
> +					igt_assert_f(ret, "SRM update failed");
> +				}
>  
> -	igt_describe("Test the content type change when the content protection already "
> -		     "enabled.");
> -	igt_subtest("content_type_change") {
> -		igt_require(data.display.is_atomic);
> -		data.cp_tests = CP_TYPE_CHANGE;
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
> -	}
> -
> -	igt_describe("Test to detect the HDCP status change when we are reading the uevent "
> -		     "sent with the corresponding connector id and property id.");
> -	igt_subtest("uevent") {
> -		igt_require(data.display.is_atomic);
> -		data.cp_tests = CP_UEVENT;
> -		data.uevent_monitor = igt_watch_uevents();
> -		igt_flush_uevents(data.uevent_monitor);
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
> -		igt_cleanup_uevents(data.uevent_monitor);
> -	}
> -
> -	/*
> -	 *  Testing the revocation check through SRM needs a HDCP sink with
> -	 *  programmable Ksvs or we need a uAPI from kernel to read the
> -	 *  connected HDCP sink's Ksv. With that we would be able to add that
> -	 *  Ksv into a SRM and send in for revocation check. Since we dont have
> -	 *  either of these options, we test SRM writing from userspace and
> -	 *  validation of the same at kernel. Something is better than nothing.
> -	 */
> -	igt_describe("This test writes the facsimile SRM into the /lib/firmware/ "
> -		     "and check the kernel parsing of it by invoking the hdcp authentication.");
> -	igt_subtest("srm") {
> -		bool ret;
> -
> -		igt_require(data.display.is_atomic);
> -		data.cp_tests = 0;
> -		ret = write_srm_as_fw((const __u8 *)facsimile_srm,
> -				      sizeof(facsimile_srm));
> -		igt_assert_f(ret, "SRM update failed");
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
> -	}
> -
> -	igt_describe("Test Content protection over DP MST");
> -	igt_subtest("dp-mst-type-0") {
> -		test_content_protection_mst(HDCP_CONTENT_TYPE_0);
> +				test_content_protection(COMMIT_ATOMIC, subtests[i].content_type);
> +			}
> +		}
>  	}
>  
> -	igt_describe("Test Content protection over DP MST with LIC");
> -	igt_subtest("dp-mst-lic-type-0") {
> -		data.cp_tests = CP_LIC;
> -		test_content_protection_mst(HDCP_CONTENT_TYPE_0);
> -	}
> +	igt_subtest_group {
> +		igt_fixture
> +			igt_require(data.display.is_atomic);
>  
> -	igt_describe("Test Content protection over DP MST");
> -	igt_subtest("dp-mst-type-1") {
> -		test_content_protection_mst(HDCP_CONTENT_TYPE_1);
> -	}
> +		for (int i = 0; i < ARRAY_SIZE(mst_subtests); i++) {
> +			igt_describe_f("%s", mst_subtests[i].desc);
>  
> -	igt_describe("Test Content protection over DP MST with LIC");
> -	igt_subtest("dp-mst-lic-type-1") {
> -		data.cp_tests = CP_LIC;
> -		test_content_protection_mst(HDCP_CONTENT_TYPE_1);
> +			igt_subtest(mst_subtests[i].name) {
> +				data.cp_tests = mst_subtests[i].cp_tests;
> +				test_content_protection_mst(mst_subtests[i].content_type);
> +			}
> +		}
>  	}
>  
>  	igt_fixture {
> -- 
> 2.22.0
> 
