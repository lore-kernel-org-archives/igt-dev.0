Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA2CFF8875
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 07:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B1910F231;
	Thu, 30 Apr 2026 07:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGmFgJHK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A88110F22D
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 07:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777534434; x=1809070434;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=goiYXwvkzTuLfBiDIwmk3JOJPmQZfhlZthNi4o6YVJ0=;
 b=aGmFgJHKdlac4L5LnWuXDEPaSWBEF3fzf+x9z9/L865vGJyy2iwXN6Ts
 E9fQLg5fgi23SHEhu0+fjt6mZSjhoLFsoNH1H+MdDg8JfeCzPvPzR4kGk
 EGHZQr5zn51fLNWfnjk0ZPRGEfp0NqJKlLiz8+BkbpSJJS7DMwsEX4F8c
 m/HAAe4YDdXRJ274eLnXFDexKeCZ0dUs0vCrkd0TSiHeMnoTHRxYzhx0h
 70EvQWJ17dFwmNIcQAObJXjpHJS6G9bucTmAOkyaLFOG8GSfxY8htu5uI
 Y3G0QiC2ODvW0eTheP4BL0VUYuXp0J1a/0uZR2r8M+P+dUSOK3xfaLbtz Q==;
X-CSE-ConnectionGUID: TaWS78LGRaqVsaBs4U8pHw==
X-CSE-MsgGUID: TqFv7P/NSyG7bddTN+jTRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="88789821"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="88789821"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 00:33:53 -0700
X-CSE-ConnectionGUID: lI58qEoeTbm2iXU9FiAd/w==
X-CSE-MsgGUID: I57OSsnhQty/i5wWu5GqSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="258087093"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 00:33:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t, v5 4/4] tests/intel/kms_dsc: Add force dsc and
 joiner test cases
In-Reply-To: <20260429195115.2332923-5-swati2.sharma@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260429195115.2332923-1-swati2.sharma@intel.com>
 <20260429195115.2332923-5-swati2.sharma@intel.com>
Date: Thu, 30 Apr 2026 10:33:48 +0300
Message-ID: <2ae52502a329392abcf7c1c76224e35e18335dfb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Thu, 30 Apr 2026, Swati Sharma <swati2.sharma@intel.com> wrote:
> Add test cases where we are validating force dsc and force
> joiner.
>
> v2: -fix if() for ultra/big joiner (Ankit)
> v3: -Add '-' separator in subtest names when using
>      igt_get_joined_pipes_name (Santhosh)
> v4: -Use 'enum joined_pipes force_joined_pipes' in data_t (Ankit)
>     -Use dsc-basic-%s format for subtest names (Ankit)
>     -Use igt_crtc_for_pipe() to check consecutive HW pipes,
>      handling fused pipe holes properly (Ankit)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_dsc.c | 206 +++++++++++++++++++++++++++---------------
>  1 file changed, 134 insertions(+), 72 deletions(-)
>
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 69f335da3..bfd84e59a 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -55,7 +55,27 @@
>   * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
>   * @fractional-bpp:               DSC with fractional bpp with default parameters
>   * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
> - */
> + *
> + * SUBTEST: dsc-%s-%s
> + * Description: Tests Display Stream Compression functionality if supported by a
> + *              connector by forcing %arg[1] and %arg[2] on all connectors that support it
> + *
> + * arg[1]:
> + *
> + * @basic:                        DSC with default parameters
> + * @with-bpc:                     DSC with certain input BPC for the connector
> + * @with-bpc-formats:             DSC with certain input BPC for the connector and diff formats
> + * @with-formats:                 DSC with default parameters and creating fb with diff formats
> + * @with-output-formats:          DSC with output formats
> + * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
> + * @fractional-bpp:               DSC with fractional bpp with default parameters
> + * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
> + *
> + * arg[2]:
> + *
> + * @bigjoiner:			  big joiner
> + * @ultrajoiner:		  ultra joiner
> +*/
>  
>  IGT_TEST_DESCRIPTION("Test to validate display stream compression");
>  
> @@ -81,11 +101,13 @@ typedef struct {
>  	int disp_ver;
>  	igt_crtc_t *crtc;
>  	bool limited;
> +	enum joined_pipes force_joined_pipes;
>  } data_t;
>  
>  static int output_format_list[] = {DSC_FORMAT_YCBCR420, DSC_FORMAT_YCBCR444};
>  static int format_list[] = {DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB16161616F, DRM_FORMAT_YUYV};
>  static uint32_t bpc_list[] = {8, 10, 12};
> +static enum joined_pipes joiner_tests[] = {JOINED_PIPES_DEFAULT, JOINED_PIPES_BIG_JOINER, JOINED_PIPES_ULTRA_JOINER};
>  
>  static inline void manual(const char *expected)
>  {
> @@ -135,6 +157,7 @@ static void update_display(data_t *data, uint32_t test_type)
>  	int current_bpc = 0;
>  	igt_plane_t *primary;
>  	drmModeModeInfo *mode;
> +	bool status;
>  	igt_output_t *output = data->output;
>  	igt_display_t *display = &data->display;
>  	drmModeConnector *connector = output->config.connector;
> @@ -147,6 +170,11 @@ static void update_display(data_t *data, uint32_t test_type)
>  	save_force_dsc_en(data->drm_fd, data->output);
>  	force_dsc_enable(data->drm_fd, data->output);
>  
> +	if (data->force_joined_pipes == JOINED_PIPES_BIG_JOINER || data->force_joined_pipes == JOINED_PIPES_ULTRA_JOINER) {
> +		status = kmstest_force_connector_joiner(data->drm_fd, connector, data->force_joined_pipes);
> +		igt_assert_f(status, "Failed to toggle force joiner\n");
> +	}
> +
>  	if (test_type & TEST_DSC_BPC) {
>  		igt_debug("Trying to set input BPC to %d\n", data->input_bpc);
>  		force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
> @@ -246,25 +274,35 @@ reset:
>  
>  static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>  		     unsigned int plane_format,
> -		     enum dsc_output_format output_format)
> +		     enum dsc_output_format output_format,
> +		     enum joined_pipes joined_pipes)
>  {
>  	igt_display_t *display = &data->display;
>  	igt_output_t *output;
>  	igt_crtc_t *crtc;
> +	int n_pipes = 0;
>  	char name[3][LEN] = {
>  				{0},
>  				{0},
>  				{0},
>  			    };
>  
> +	for_each_crtc(display, crtc)
> +		n_pipes++;

Nowadays that's just igt_display_n_crtcs().

> +
>  	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
>  
> +	if (joined_pipes != JOINED_PIPES_DEFAULT &&
> +	    !igt_is_joiner_supported_by_source(data->drm_fd, joined_pipes))
> +		return;
> +
>  	for_each_crtc_with_valid_output(display, crtc, output) {
>  		data->output_format = output_format;
>  		data->plane_format = plane_format;
>  		data->input_bpc = bpc;
>  		data->output = output;
>  		data->crtc = crtc;
> +		data->force_joined_pipes = joined_pipes;
>  
>  		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
>  		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->crtc))
> @@ -285,6 +323,26 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>  						      data->drm_fd, data->output)))
>  			continue;
>  
> +		/*
> +		 * Check joiner constraints and verify that we have
> +		 * enough consecutive HW pipes starting from this crtc.
> +		 * Use igt_crtc_for_pipe() to handle fused pipe holes.
> +		 */
> +		if (joined_pipes != JOINED_PIPES_DEFAULT &&
> +		    !check_dsc_joiner_constraints(data->drm_fd, data->output,
> +						  n_pipes, joined_pipes))
> +			continue;
> +
> +		if (joined_pipes == JOINED_PIPES_BIG_JOINER &&
> +		    !igt_crtc_for_pipe(display, crtc->pipe + 1))
> +			continue;
> +
> +		if (joined_pipes == JOINED_PIPES_ULTRA_JOINER &&
> +		    (!igt_crtc_for_pipe(display, crtc->pipe + 1) ||
> +		     !igt_crtc_for_pipe(display, crtc->pipe + 2) ||
> +		     !igt_crtc_for_pipe(display, crtc->pipe + 3)))
> +			continue;

I don't have the time to look into all of this properly, but I have a
feeling it would be worth it to add a coherent set of joiner helpers
under lib/intel, consoditating the joiner stuff from lib/igt_kms.c and
tests/intel/kms_joiner_helper.c, and possibly kms_dsc_helper.c etc.

It's just not tenable for tests to be checking the above.

That said, it takes time and effort, and I'm not insisting on it. It's
just something to think of, and maybe start moving stuff to a single
location to make it easier to re-use.

BR,
Jani.



> +
>  		if (test_type & TEST_DSC_OUTPUT_FORMAT)
>  			snprintf(&name[0][0], LEN, "-%s", kmstest_dsc_output_format_str(data->output_format));
>  		if (test_type & TEST_DSC_FORMAT)
> @@ -334,85 +392,89 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
>  		igt_require(is_dsc_supported_by_source(data.drm_fd));
>  	}
>  
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with default parameters");
> -	igt_subtest_with_dynamic("dsc-basic")
> -			test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
> -				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
> -
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with default parameters and creating fb with diff formats");
> -	igt_subtest_with_dynamic("dsc-with-formats") {
> -		for (int k = 0; k < ARRAY_SIZE(format_list); k++)
> -			test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
> -				 format_list[k], DSC_FORMAT_RGB);
> -	}
>  
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with certain input BPC for the connector");
> -	igt_subtest_with_dynamic("dsc-with-bpc") {
> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> -			test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
> -				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
> -	}
> +	for (int i = 0; i < ARRAY_SIZE(joiner_tests) ; i++) {
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC on all connectors that support it "
> +			     "with default parameters");
> +		igt_subtest_with_dynamic_f("dsc-basic%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
> +				test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
> +					 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB, joiner_tests[i]);
> +		}
>  
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with certain input BPC for the connector with diff formats");
> -	igt_subtest_with_dynamic("dsc-with-bpc-formats") {
> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
> -			for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
> -				test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT,
> -				bpc_list[j], format_list[k],
> -				DSC_FORMAT_RGB);
> -			}
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC on all connectors that support it "
> +			     "with default parameters and creating fb with diff formats");
> +		igt_subtest_with_dynamic_f("dsc-with-formats%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int k = 0; k < ARRAY_SIZE(format_list); k++)
> +				test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
> +					 format_list[k], DSC_FORMAT_RGB, joiner_tests[i]);
>  		}
> -	}
>  
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC and output format on all connectors "
> -		     "that support it");
> -	igt_subtest_with_dynamic("dsc-with-output-formats") {
> -		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
> -			test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
> -				 DRM_FORMAT_XRGB8888,
> -				 output_format_list[k]);
> -	}
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC on all connectors that support it "
> +			     "with certain input BPC for the connector");
> +		igt_subtest_with_dynamic_f("dsc-with-bpc%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> +				test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
> +					 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB, joiner_tests[i]);
> +		}
>  
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC and output format on all connectors "
> -		     "that support it with certain input BPC for the connector");
> -	igt_subtest_with_dynamic("dsc-with-output-formats-with-bpc") {
> -		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC on all connectors that support it "
> +			     "with certain input BPC for the connector with diff formats");
> +		igt_subtest_with_dynamic_f("dsc-with-bpc-formats%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
>  			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
> -				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
> -					 bpc_list[j], DRM_FORMAT_XRGB8888,
> -					 output_format_list[k]);
> +				for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
> +					test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT,
> +					bpc_list[j], format_list[k],
> +					DSC_FORMAT_RGB, joiner_tests[i]);
> +				}
>  			}
>  		}
> -	}
>  
> -	igt_describe("Tests fractional compressed bpp functionality if supported "
> -		     "by a connector by forcing fractional_bpp on all connectors that support it "
> -		     "with default parameter. While finding the optimum compressed bpp, driver will "
> -		     "skip over the compressed bpps with integer values. It will go ahead with DSC, "
> -		     "iff compressed bpp is fractional, failing in which, it will fail the commit.");
> -	igt_subtest_with_dynamic("dsc-fractional-bpp")
> -			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP,
> -				 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
> -				 DSC_FORMAT_RGB);
> -
> -	igt_describe("Tests fractional compressed bpp functionality if supported "
> -		     "by a connector by forcing fractional_bpp on all connectors that support it "
> -		     "with certain input BPC for the connector.");
> -	igt_subtest_with_dynamic("dsc-fractional-bpp-with-bpc") {
> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> -			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
> -				 bpc_list[j], DRM_FORMAT_XRGB8888,
> -				 DSC_FORMAT_RGB);
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC and output format on all connectors "
> +			     "that support it");
> +		igt_subtest_with_dynamic_f("dsc-with-output-formats%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
> +				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
> +					 DRM_FORMAT_XRGB8888,
> +					 output_format_list[k], joiner_tests[i]);
> +		}
> +
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC and output format on all connectors "
> +			     "that support it with certain input BPC for the connector");
> +		igt_subtest_with_dynamic_f("dsc-with-output-formats-with-bpc%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
> +				for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
> +					test_dsc(&data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
> +						 bpc_list[j], DRM_FORMAT_XRGB8888,
> +						 output_format_list[k], joiner_tests[i]);
> +				}
> +			}
> +		}
> +
> +		igt_describe("Tests fractional compressed bpp functionality if supported "
> +			     "by a connector by forcing fractional_bpp on all connectors that support it "
> +			     "with default parameter. While finding the optimum compressed bpp, driver will "
> +			     "skip over the compressed bpps with integer values. It will go ahead with DSC, "
> +			     "iff compressed bpp is fractional, failing in which, it will fail the commit.");
> +		igt_subtest_with_dynamic_f("dsc-fractional-bpp%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i]))
> +				test_dsc(&data, TEST_DSC_FRACTIONAL_BPP,
> +					 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
> +					 DSC_FORMAT_RGB, joiner_tests[i]);
> +
> +		igt_describe("Tests fractional compressed bpp functionality if supported "
> +			     "by a connector by forcing fractional_bpp on all connectors that support it "
> +			     "with certain input BPC for the connector.");
> +		igt_subtest_with_dynamic_f("dsc-fractional-bpp-with-bpc%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> +				test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
> +					 bpc_list[j], DRM_FORMAT_XRGB8888,
> +					 DSC_FORMAT_RGB, joiner_tests[i]);
> +			}
>  	}
>  
>  	igt_fixture() {

-- 
Jani Nikula, Intel
