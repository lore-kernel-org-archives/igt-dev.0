Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB676EB25
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2020 12:46:12 +0000 (UTC)
Date: Fri, 20 Mar 2020 18:16:15 +0530
From: Ramalingam C <ramalingam.c@intel.com>
Message-ID: <20200320124615.GA22075@intel.com>
References: <20200320090340.27836-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320090340.27836-1-ankit.k.nautiyal@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_content_protection: Bifurcate
 tests into HDCP1.4 & 2.2
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
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-03-20 at 14:33:40 +0530, Ankit Nautiyal wrote:
> Currently, the test kms_content_protection does not distinguish
> between HDCP1.4 and HDCP2.2 tests. Since the driver by default
> always chooses HDCP2.2 protocol if the panel supports HDCP1.4 &
> HDCP2.2, HDCP1.4 does not get tested.
> 
> This patch makes two versions of the existing subtests for testing
> HDCP1.4 and HDCP2.2. For forcing the driver to use HDCP1.4, the
> kernel module 'mei_hdcp' responsible for HDCP2.2 authentication,
> is unloaded before HDCP1.4 tests. Once the HDCP1.4 tests are
> completed, the module is re-loaded.
> 
> This patch also makes the existing subtests as dynamic sub-subtests
> based on all outputs supporting the protocol under test.
> This helps in running together all HDCP1.4 tests for all outputs
> that support HDCP1.4, avoiding the need of loading and unloading
> of 'mei_hdcp' module for each test.

Thanks for taking this up. Long pending item in to-do list.

> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  tests/kms_content_protection.c | 185 ++++++++++++++++++++-------------
>  1 file changed, 113 insertions(+), 72 deletions(-)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 3b9cedcb..1472e987 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -59,6 +59,9 @@ struct data {
>  #define HDCP_CONTENT_TYPE_0				0
>  #define HDCP_CONTENT_TYPE_1				1
>  
> +#define HDCP_14						0
#define HDCP14 HDCP_CONTENT_TYPE_0 ?
> +#define HDCP_22						1
> +
>  #define LIC_PERIOD_MSEC				(4 * 1000)
>  /* Kernel retry count=3, Max time per authentication allowed = 6Sec */
>  #define KERNEL_AUTH_TIME_ALLOWED_MSEC		(3 *  6 * 1000)
> @@ -593,44 +596,6 @@ static bool sink_hdcp2_capable(igt_output_t *output)
>  	return strstr(buf, "HDCP2.2");
>  }
>  
> -static void
> -test_content_protection(enum igt_commit_style s, int content_type)
> -{
> -	igt_display_t *display = &data.display;
> -	igt_output_t *output;
> -	int valid_tests = 0;
> -
> -	if (data.cp_tests & CP_MEI_RELOAD)
> -		igt_require_f(igt_kmod_is_loaded("mei_hdcp"),
> -			      "mei_hdcp module is not loaded\n");
> -
> -	for_each_connected_output(display, output) {
> -		if (!output->props[IGT_CONNECTOR_CONTENT_PROTECTION])
> -			continue;
> -
> -		if (!output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE] &&
> -		    content_type)
> -			continue;
> -
> -		igt_info("CP Test execution on %s\n", output->name);
> -
> -		if (content_type && !sink_hdcp2_capable(output)) {
> -			igt_info("\tSkip %s (Sink has no HDCP2.2 support)\n",
> -				 output->name);
> -			continue;
> -		} else if (!sink_hdcp_capable(output)) {
> -			igt_info("\tSkip %s (Sink has no HDCP support)\n",
> -				 output->name);
> -			continue;
> -		}
> -
> -		test_content_protection_on_output(output, s, content_type);
> -		valid_tests++;
> -	}
> -
> -	igt_require_f(valid_tests, "No connector found with HDCP capability\n");
> -}
> -
>  static void test_content_protection_cleanup(void)
>  {
>  	igt_display_t *display = &data.display;
> @@ -651,58 +616,63 @@ static void test_content_protection_cleanup(void)
>  	}
>  }
>  
> -igt_main
> -{
> -	igt_fixture {
> -		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +static bool
> +is_valid_output(igt_output_t *output, int content_type) {
> +	if (!output->props[IGT_CONNECTOR_CONTENT_PROTECTION])
> +		return false;
>  
> -		igt_display_require(&data.display, data.drm_fd);
> +	if (!output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE] && content_type)
> +		return false;
> +
> +	if (content_type && !sink_hdcp2_capable(output)) {
> +		igt_info("\tSkip %s (Sink has no HDCP2.2 support)\n",
> +			 output->name);
> +		return false;
> +
> +	} else if (!sink_hdcp_capable(output)) {
> +		igt_info("\tSkip %s (Sink has no HDCP support)\n",
> +			 output->name);
> +		return false;
>  	}
> +	return true;
> +}
>  
> -	igt_subtest("legacy") {
> +static void
> +test_content_protection_dynamic(igt_output_t *output, int content_type)
> +{
> +
> +	igt_dynamic_f("legacy-%s", output->name) {
>  		data.cp_tests = 0;
> -		test_content_protection(COMMIT_LEGACY, HDCP_CONTENT_TYPE_0);
> +		test_content_protection_on_output(output, COMMIT_LEGACY,
> +						  content_type);
>  	}
>  
> -	igt_subtest("atomic") {
> +	igt_dynamic_f("atomic-%s", output->name) {
>  		igt_require(data.display.is_atomic);
>  		data.cp_tests = 0;
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
> +		test_content_protection_on_output(output, COMMIT_ATOMIC,
> +						  content_type);
>  	}
>  
> -	igt_subtest("atomic-dpms") {
> +	igt_dynamic_f("atomic-dpms-%s", output->name) {
>  		igt_require(data.display.is_atomic);
>  		data.cp_tests = CP_DPMS;
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
> +		test_content_protection_on_output(output, COMMIT_ATOMIC,
> +						  content_type);
>  	}
>  
> -	igt_subtest("LIC") {
> +	igt_dynamic_f("LIC-%s", output->name) {
>  		igt_require(data.display.is_atomic);
>  		data.cp_tests = CP_LIC;
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
> +		test_content_protection_on_output(output, COMMIT_ATOMIC,
> +						  content_type);
>  	}
>  
> -	igt_subtest("type1") {
> -		igt_require(data.display.is_atomic);
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
> -	}
> -
> -	igt_subtest("mei_interface") {
> -		igt_require(data.display.is_atomic);
> -		data.cp_tests = CP_MEI_RELOAD;
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
> -	}
> -
> -	igt_subtest("content_type_change") {
> -		igt_require(data.display.is_atomic);
> -		data.cp_tests = CP_TYPE_CHANGE;
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
> -	}
> -
> -	igt_subtest("uevent") {
> +	igt_dynamic_f("uevent-%s", output->name) {
>  		igt_require(data.display.is_atomic);
>  		data.cp_tests = CP_UEVENT;
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
> +		test_content_protection_on_output(output, COMMIT_ATOMIC,
> +						  content_type);
>  	}
>  
>  	/*
> @@ -713,7 +683,7 @@ igt_main
>  	 *  either of these options, we test SRM writing from userspace and
>  	 *  validation of the same at kernel. Something is better than nothing.
>  	 */
> -	igt_subtest("srm") {
> +	igt_dynamic_f("srm-%s", output->name) {
>  		bool ret;
>  
>  		igt_require(data.display.is_atomic);
> @@ -721,7 +691,78 @@ igt_main
>  		ret = write_srm_as_fw((const __u8 *)facsimile_srm,
>  				      sizeof(facsimile_srm));
>  		igt_assert_f(ret, "SRM update failed");
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
> +		test_content_protection_on_output(output, COMMIT_ATOMIC,
> +						  content_type);
> +	}
> +
> +	/*
> +	 * The tests mei_interface and content_type_change are meant only
> +	 * for HDCP2.2 protocol, hence ignore for HDCP1.4.
> +	 */
> +	if (content_type != HDCP_CONTENT_TYPE_1)
We can move this as igt_require into the subtests of mei and type
change.
> +		return;
> +
> +	igt_dynamic_f("mei_interface-%s", output->name) {
> +		igt_require(data.display.is_atomic);
> +		data.cp_tests = CP_MEI_RELOAD;
> +		test_content_protection_on_output(output, COMMIT_ATOMIC,
> +						  content_type);
> +	}
> +
> +	igt_dynamic_f("content_type_change-%s", output->name) {
> +		igt_require(data.display.is_atomic);
> +		data.cp_tests = CP_TYPE_CHANGE;
> +		test_content_protection_on_output(output, COMMIT_ATOMIC,
> +						  content_type);
> +	}
> +}
> +
> +igt_main
> +{
> +	int i;
> +	struct cp_protocol {
> +		const char *name;
> +		int content_type;
> +	} protocol[] = {
Could we name it as hdcp_version ? Will be easily giving the purpose...
> +		{ "hdcp-1_4", HDCP_CONTENT_TYPE_0 },
> +		{ "hdcp-2_2", HDCP_CONTENT_TYPE_1 } };
> +
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +	}
> +
> +	for (i = 0; i < 2; i++) {
Could we use the array_size of protocol/hdcp_spec_ver
> +		bool force_mei_hdcp_off = false;
> +
> +		/* In case a panel supports both HDCP2.2 and HDCP1.4 protocols,
> +		 * HDCP2.2 is always chosen as default by the driver, even for
> +		 * the TYPE 0 content.
> +		 *
> +		 * To forcefully test HDCP1.4, mei_hdcp module needs to be
> +		 * unloaded. This takes away the HDCP2.2 support from the
> +		 * platform, and HDCP1.4 can be tested. After the test the
> +		 * module is loaded again and HDCP2.2 support gets re-enabled.
> +		 */
> +		if (i == HDCP_14 && igt_kmod_is_loaded("mei_hdcp")) {
> +			igt_kmod_unload("mei_hdcp", 0);
As petri mentioned, we need to assert on unload and load also.
With that this might need to be moved into subtest. Not sure whether
this can be kept out of output loop. Please check.

-Ram
> +			force_mei_hdcp_off = true;
> +		}
> +
> +		igt_subtest_with_dynamic_f("%s", protocol[i].name) {
> +			igt_output_t *output;
> +			int content_type = protocol[i].content_type;
> +
> +			for_each_connected_output(&data.display, output) {
> +				if (!is_valid_output(output, content_type))
> +					continue;
> +				test_content_protection_dynamic(output,
> +								content_type);
> +			}
> +		}
> +		if (force_mei_hdcp_off)
> +			igt_kmod_load("mei_hdcp", NULL);
>  	}
>  
>  	igt_fixture {
> -- 
> 2.17.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
