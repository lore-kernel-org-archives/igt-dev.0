Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2425E10E243
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Nov 2023 08:25:45 +0000 (UTC)
Message-ID: <c1a579a0-946c-5e71-dc29-9354d152731e@intel.com>
Date: Thu, 16 Nov 2023 13:55:26 +0530
Content-Language: en-US
To: Sean Paul <sean@poorly.run>, <igt-dev@lists.freedesktop.org>
References: <20231023205910.3556533-1-sean@poorly.run>
 <20231023205910.3556533-5-sean@poorly.run>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20231023205910.3556533-5-sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 4/8] tests/kms_vrr: Allow test duration to
 be specified from the command line
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
> Using --duration argument, otherwise use default.
> 
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> 
> Changes in v2:
> - Add short opt to the main callsite (Bhanu)
> ---
>   tests/kms_vrr.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 62335e9bf..af61c312e 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -109,6 +109,7 @@ typedef struct data {
>   	igt_fb_t fb[2];
>   	range_t range;
>   	vtest_ns_t vtest_ns;
> +	uint64_t duration_ns;
>   } data_t;
>   
>   typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, uint32_t);
> @@ -257,6 +258,9 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
>   		     data->vtest_ns.rate_ns >= data->vtest_ns.max,
>   		     "Invalid test rate specified!\n");
>   
> +	if (data->duration_ns == 0)
> +		data->duration_ns = TEST_DURATION_NS;
> +
>   	/* Override mode with max vrefresh.
>   	 *   - vrr_min range should be less than the override mode vrefresh.
>   	 *   - Limit the vrr_max range with the override mode vrefresh.
> @@ -453,7 +457,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   	 */
>   	if (flags & TEST_FLIPLINE) {
>   		rate = rate_from_refresh(range.max + 5);
> -		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
> +		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
>   		igt_assert_f(result > 75,
>   			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
>   			     (range.max + 5), rate, result);
> @@ -461,7 +465,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   
>   	if (flags & ~TEST_NEGATIVE) {
>   		rate = vtest_ns.rate_ns;
> -		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
> +		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
>   		igt_assert_f(result > 75,
>   			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
>   			     ((range.max + range.min) / 2), rate, result);
> @@ -469,7 +473,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   
>   	if (flags & TEST_FLIPLINE) {
>   		rate = rate_from_refresh(range.min - 5);
> -		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
> +		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
>   		igt_assert_f(result < 50,
>   			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
>   			     (range.min - 5), rate, result);
> @@ -482,7 +486,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   	 */
>   	set_vrr_on_pipe(data, pipe, (flags & TEST_NEGATIVE)? true : false);
>   	rate = vtest_ns.rate_ns;
> -	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
> +	result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
>   	igt_assert_f(result < 10,
>   		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold exceeded, result was %u%%\n",
>   		     ((range.max + range.min) / 2), rate, (flags & TEST_NEGATIVE)? "on" : "off", result);
> @@ -538,6 +542,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
>   	data_t *data = _data;
>   
>   	switch (opt) {
> +	case 'd':
> +		data->duration_ns = atoi(optarg) * NSECS_PER_SEC;
> +		break;
>   	case 'r':
>   		data->vtest_ns.rate_ns = rate_from_refresh(atoi(optarg));
>   		break;
> @@ -546,16 +553,18 @@ static int opt_handler(int opt, int opt_index, void *_data)
>   }
>   
>   static const struct option long_opts[] = {
> +	{ .name = "duration", .has_arg = true, .val = 'd', },
>   	{ .name = "refresh-rate", .has_arg = true, .val = 'r', },
>   	{}
>   };
>   
>   static const char help_str[] =
> +	"  --duration <duration-seconds>\t\tHow long to run the test for\n"
>   	"  --refresh-rate <refresh-hz>\t\tThe refresh rate to flip at\n";
>   
>   static data_t data;
>   
> -igt_main_args("r:", long_opts, help_str, opt_handler, &data)
> +igt_main_args("d:r:", long_opts, help_str, opt_handler, &data)
-------------------^
Nit: s/"d:r:"/"dr:"

- Bhanu

>   {
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
