Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14F910E10A
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 08:14:05 +0000 (UTC)
Message-ID: <14a0862c-a96f-4f94-a659-f75d800fe38b@intel.com>
Date: Tue, 28 Nov 2023 13:43:34 +0530
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231128023348.19418-1-nidhi1.gupta@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20231128023348.19418-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3]
 tests/intel/kms_frontbuffer_tracking: Add new subtest to test FBC on each
 pipe
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

Hi Nidhi,

On 28-11-2023 08:03 am, Nidhi Gupta wrote:
> Added a new subtest as kms_frontbuffer_tracking@pipe-fbc-rte.
> It will execute on each pipe with valid output and check if FBC is
> enabled or not.
> 
> v2: Change the test design to reuse the existing
>      rte_subtest() code for each pipe (Bhanu)
> 
> v3: Use igt_fixture to restore the default
>      parameters (Bhanu)
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 53 ++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 259dfd136..257ba4273 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -1163,6 +1163,15 @@
>    * @y:              Y tiling
>    */
>   
> +/**
> + * SUBTEST: pipe-fbc-rte
> + * Description: Sanity test to enable FBC on each pipe.
> + * Driver requirement: i915, xe
> + * Functionality: fbc
> + * Mega feature: General Display Features
> + * Test category: functionality test

Please fix the documentation according to the latest changes:
Drop 'Driver requirement', 'Mega feature' & 'Test category' as these are 
moved to TEST level.

Also, combine this documentation block to existing stuff.

> + */
> +
>   #define TIME SLOW_QUICK(1000, 10000)
>   
>   IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
> @@ -4459,11 +4468,15 @@ struct option long_options[] = {
>   igt_main_args("", long_options, help_str, opt_handler, NULL)
>   {
>   	struct test_mode t;
> +	struct modeset_params default_mode_params;
>   	int devid;
> +	enum pipe pipe;
> +	igt_output_t *output;
>   
>   	igt_fixture {
>   		setup_environment();
>   		devid = intel_get_drm_devid(drm.fd);
> +		default_mode_params = prim_mode_params;

This change is not required for other tests, so limit this to 
"pipe-fbc-rte" only.

Also, as mentioned in previous comments, we just need the pipe info from 
default params, no need to preserve full struct.

>   	}
>   
>   	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
> @@ -4500,6 +4513,46 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		plane_fbc_rte_subtest(&t);
>   	}
>   
> +	igt_subtest_with_dynamic("pipe-fbc-rte") {
> +
> +		t.pipes = PIPE_SINGLE;
> +		t.feature = FEATURE_FBC;
> +		t.screen = SCREEN_PRIM;
> +		t.fbs = FBS_INDIVIDUAL;
> +		t.format = FORMAT_DEFAULT;
> +		t.method = IGT_DRAW_BLT;
> +		/* Make sure nothing is using these values. */
> +		t.flip = -1;
> +		t.tiling = opt.tiling;
> +
> +		for_each_pipe(&drm.display, pipe) {
> +
> +			if (pipe == default_mode_params.pipe) {
> +				igt_info("pipe-%s: FBC validated in other subtest\n", kmstest_pipe_name(pipe));
> +				continue;
> +			}
> +
> +			if (!intel_fbc_supported_on_chipset(drm.fd, pipe)) {
> +				igt_info("Can't test FBC: not supported on pipe-%s\n", kmstest_pipe_name(pipe));
> +				continue;
> +			}
> +
> +			for_each_valid_output_on_pipe(&drm.display, pipe, output) {
> +				init_mode_params(&prim_mode_params, output, pipe);
> +				setup_fbc();

Add new line here.

> +				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +					      igt_output_name(output))
> +					rte_subtest(&t);

Add new line here.

> +				break; /* One output is enough. */
> +			}
> +
> +		}
> +	}
> +
> +	igt_fixture
> +		prim_mode_params = default_mode_params;

As we are using different outputs at test level, I think it not just enough.

Instead, call init_modeset_cached_params() here to restore to default.

- Bhanu

> +
> +
>   	TEST_MODE_ITER_BEGIN(t)
>   
>   		igt_subtest_f("%s-%s-%s-%s-%s-draw-%s",
