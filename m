Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BF410E524
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 13:29:39 +0000 (UTC)
Message-ID: <d62e9a9c-32e8-4714-a0a8-73d1b5fffe23@intel.com>
Date: Tue, 28 Nov 2023 18:59:22 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231128100045.32687-1-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20231128100045.32687-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6]
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


On 28-11-2023 03:30 pm, Nidhi Gupta wrote:
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
> v4: fixed nitpicks (Bhanu)
> 
> v5: create igt_subtest_group and move igt_fixture
>      inside the group (Bhanu)
> 
> v6: fixed nitpicks (Bhanu)
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>

LGTM
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   tests/intel/kms_frontbuffer_tracking.c | 50 ++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 259dfd136..6cf9861d0 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -57,6 +57,10 @@
>    * Description: Sanity test to enable FBC on a plane.
>    * Functionality: fbc
>    *
> + * SUBTEST: pipe-fbc-rte
> + * Description: Sanity test to enable FBC on each pipe.
> + * Functionality: fbc
> + *
>    * SUBTEST: drrs-%dp-rte
>    * Description: Sanity test to enable DRRS with %arg[1] panels.
>    * Functionality: fbt, drrs
> @@ -4460,6 +4464,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   {
>   	struct test_mode t;
>   	int devid;
> +	enum pipe pipe;
> +	igt_output_t *output;
>   
>   	igt_fixture {
>   		setup_environment();
> @@ -4500,6 +4506,50 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		plane_fbc_rte_subtest(&t);
>   	}
>   
> +	igt_subtest_group {
> +		igt_subtest_with_dynamic("pipe-fbc-rte") {
> +
> +			enum pipe default_pipe = prim_mode_params.pipe;
> +
> +			t.pipes = PIPE_SINGLE;
> +			t.feature = FEATURE_FBC;
> +			t.screen = SCREEN_PRIM;
> +			t.fbs = FBS_INDIVIDUAL;
> +			t.format = FORMAT_DEFAULT;
> +			t.method = IGT_DRAW_BLT;
> +			/* Make sure nothing is using these values. */
> +			t.flip = -1;
> +			t.tiling = opt.tiling;
> +
> +			for_each_pipe(&drm.display, pipe) {
> +
> +				if (pipe == default_pipe) {
> +					igt_info("pipe-%s: FBC validated in other subtest\n", kmstest_pipe_name(pipe));
> +					continue;
> +				}
> +
> +				if (!intel_fbc_supported_on_chipset(drm.fd, pipe)) {
> +					igt_info("Can't test FBC: not supported on pipe-%s\n", kmstest_pipe_name(pipe));
> +					continue;
> +				}
> +
> +				for_each_valid_output_on_pipe(&drm.display, pipe, output) {
> +					init_mode_params(&prim_mode_params, output, pipe);
> +					setup_fbc();
> +
> +					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +						      igt_output_name(output))
> +						rte_subtest(&t);
> +
> +					break; /* One output is enough. */
> +				}
> +			}
> +		}
> +
> +		igt_fixture
> +			init_modeset_cached_params();
> +	}
> +
>   	TEST_MODE_ITER_BEGIN(t)
>   
>   		igt_subtest_f("%s-%s-%s-%s-%s-draw-%s",
