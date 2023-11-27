Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F9510E074
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Nov 2023 05:39:58 +0000 (UTC)
Message-ID: <76fc7db5-e536-4ddf-ac67-152418ac215e@intel.com>
Date: Mon, 27 Nov 2023 11:09:31 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231123113228.30729-1-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20231123113228.30729-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2]
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

On 23-11-2023 05:02 pm, Nidhi Gupta wrote:
> Added a new subtest as kms_frontbuffer_tracking@pipe-fbc-rte.
> It will execute on each pipe with valid output and check if FBC is
> enabled or not.

Please maintain the rev history.

> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 50 ++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 213069947..bb29be831 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -53,6 +53,15 @@
>    * Test category: functionality test
>    */
>   
> +/**
> + * SUBTEST: pipe-fbc-rte
> + * Description: Sanity test to enable FBC on each pipe.
> + * Driver requirement: i915, xe
> + * Functionality: fbc
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
> +
>   #define TIME SLOW_QUICK(1000, 10000)
>   
>   IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
> @@ -5015,7 +5024,10 @@ struct option long_options[] = {
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
> @@ -5056,6 +5068,44 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
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
> +		default_mode_params = prim_mode_params;

Only prim_mode_params.pipe is enough, right?

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
> +				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +					      igt_output_name(output))
> +					rte_subtest(&t);

We must configure/set the fbc 'setup_fbc()' before starting the subtest.

> +				break; /* One output is enough. */
> +			}
> +
> +			prim_mode_params = default_mode_params;

Do we really need this step for each pipe?

Also, as we are updating 'prim_mode_params', it may effect other tests 
if this test fails.

Perhaps, you need a igt_fixture to restore 'prim_mode_params' to default.

- Bhanu

> +		}
> +	}
> +
>   	TEST_MODE_ITER_BEGIN(t)
>   
>   		igt_subtest_f("%s-%s-%s-%s-%s-draw-%s",
