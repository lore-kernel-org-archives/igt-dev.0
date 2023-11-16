Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1EF10E099
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Nov 2023 08:24:46 +0000 (UTC)
Message-ID: <8c5849d7-1bfb-8152-548a-36c9a9d74ba3@intel.com>
Date: Thu, 16 Nov 2023 13:54:24 +0530
Content-Language: en-US
To: Sean Paul <sean@poorly.run>, <igt-dev@lists.freedesktop.org>
References: <20231023205910.3556533-1-sean@poorly.run>
 <20231023205910.3556533-9-sean@poorly.run>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20231023205910.3556533-9-sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 8/8] tests/kms_vrr: Add a max/min test to
 oscillate between rates
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On Tue-24-10-2023 02:26 am, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> The new MAXMIN test will oscillate between the max and min
> refresh rates every frame to stress test the panel. This is
> useful for manual profiling of flicker.
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> 
> Changes in v2:
> - Added to the set
> ---
>   tests/kms_vrr.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index b986087f0..58bed4f20 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -89,6 +89,7 @@ enum {
>   	TEST_SUSPEND = 1 << 2,
>   	TEST_FLIPLINE = 1 << 3,
>   	TEST_NEGATIVE = 1 << 4,
> +	TEST_MAXMIN = 1 << 6,
---------------------------^
Can't we use 5 here?

Also, I'll recommend always keep the TEST_NEGATIVE at the end.

>   };
>   
>   typedef struct range {
> @@ -529,6 +530,14 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   			     (range.min - 5), rate[0], result);
>   	}
>   
> +	if (flags & TEST_MAXMIN) {
> +		uint64_t maxmin_rates[] = {vtest_ns.max, vtest_ns.min};
> +		result = flip_and_measure(data, output, pipe, maxmin_rates, 2, data->duration_ns);
> +		igt_assert_f(result < 50,
> +			     "Refresh rate (%u Hz) %"PRIu64"ns/%"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
> +			     (range.min - 5), maxmin_rates[0], maxmin_rates[1], result);
> +	}
> +
>   	/*
>   	 * If we request VRR on a non-VRR panel, it is unlikely to reject the
>   	 * modeset. And the expected behavior is the same as disabling VRR on
> @@ -654,6 +663,11 @@ igt_main_args("d:r:s", long_opts, help_str, opt_handler, &data)
>   	igt_subtest_with_dynamic("negative-basic")
>   		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
>   
> +	igt_describe("Oscillates between highest and lowest refresh each frame for manual "
> +		     "flicker profiling");
> +	igt_subtest_with_dynamic("max-min")
> +		run_vrr_test(&data, test_basic, TEST_MAXMIN);

Testplan documentation is missing for this new test. Please check 
docs/test_documentation.md[1] for more details.

[1]: 
https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/docs/test_documentation.md 


Probably, we need a change as below:

+ * SUBTEST: max-min
+ * Description: Oscillates between highest and lowest refresh each 
frame for manual flicker profiling.
+ * Driver requirement: i915, xe
+ * Functionality: adaptive_sync
+ * Mega feature: VRR
+ * Test category: functionality test


- Bhanu

> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
