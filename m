Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA4F10E1CC
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 19:10:40 +0000 (UTC)
Message-ID: <4d4589ef-ee8c-4528-8f85-6412e1fc5932@intel.com>
Date: Thu, 7 Sep 2023 00:37:59 +0530
Content-Language: en-US
To: Sean Paul <sean@poorly.run>, <igt-dev@lists.freedesktop.org>
References: <20230825183934.1271156-1-sean@poorly.run>
 <20230825183934.1271156-4-sean@poorly.run>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230825183934.1271156-4-sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 3/6] tests/kms_vrr: Allow test rate to be
 altered from the command line
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


On Sat-26-08-2023 12:06 am, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Instead of always using the midpoint, introduce optional argument
> --refresh-rate to allow callers to specify the target refresh rate for
> the test.
> 
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>   tests/kms_vrr.c | 44 ++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 8ef5972aa..d62ded180 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -103,7 +103,7 @@ typedef struct range {
>   
>   typedef struct vtest_ns {
>   	uint64_t min;
> -	uint64_t mid;
> +	uint64_t rate_ns;
>   	uint64_t max;
>   } vtest_ns_t;
>   
> @@ -250,10 +250,18 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
>   	data->range = get_vrr_range(data, output);
>   
>   	data->vtest_ns.min = rate_from_refresh(data->range.min);
> -	data->vtest_ns.mid = rate_from_refresh(
> -				(data->range.min + data->range.max) / 2);
>   	data->vtest_ns.max = rate_from_refresh(data->range.max);
>   
> +	/* If unspecified on the command line, default rate to the midpoint */
> +	if (data->vtest_ns.rate_ns == 0) {
> +		range_t *range = &data->range;
> +		data->vtest_ns.rate_ns = rate_from_refresh(
> +						(range->min + range->max) / 2);
> +	}
> +	igt_assert_f(data->vtest_ns.rate_ns <= data->vtest_ns.min &&
> +		     data->vtest_ns.rate_ns >= data->vtest_ns.max,
> +		     "Invalid test rate specified!\n");
> +
>   	/* Override mode with max vrefresh.
>   	 *   - vrr_min range should be less than the override mode vrefresh.
>   	 *   - Limit the vrr_max range with the override mode vrefresh.
> @@ -406,7 +414,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   	prepare_test(data, output, pipe);
>   	range = data->range;
>   	vtest_ns = data->vtest_ns;
> -	rate = vtest_ns.mid;
> +	rate = vtest_ns.rate_ns;
>   
>   	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
>   		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
> @@ -457,7 +465,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   	}
>   
>   	if (flags & ~TEST_NEGATIVE) {
> -		rate = vtest_ns.mid;
> +		rate = vtest_ns.rate_ns;
>   		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
>   		igt_assert_f(result > 75,
>   			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
> @@ -478,7 +486,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   	 * a VRR capable panel.
>   	 */
>   	set_vrr_on_pipe(data, pipe, (flags & TEST_NEGATIVE)? true : false);
> -	rate = vtest_ns.mid;
> +	rate = vtest_ns.rate_ns;
>   	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
>   	igt_assert_f(result < 10,
>   		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold exceeded, result was %u%%\n",
> @@ -530,10 +538,30 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
>   	}
>   }
>   
> -igt_main
> +static int opt_handler(int opt, int opt_index, void *_data)
>   {
> -	data_t data = {};
> +	data_t *data = _data;
> +
> +	switch (opt) {
> +	case 'r':
> +		data->vtest_ns.rate_ns = rate_from_refresh(atoi(optarg));
> +		break;
> +	}
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
>   
> +static const struct option long_opts[] = {
> +	{ .name = "refresh-rate", .has_arg = true, .val = 'r', },
> +	{}
> +};
> +
> +static const char help_str[] =
> +	"  --refresh-rate <refresh-hz>\t\tThe refresh rate to flip at\n";
> +
> +static data_t data;
> +
> +igt_main_args("", long_opts, help_str, opt_handler, &data)
-----------------^

Please mention the supported short opts. i.e "r:"

By fixing the above comment, this patch is
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

> +{
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
