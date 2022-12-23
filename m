Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B824810E1AF
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Dec 2022 08:27:59 +0000 (UTC)
Message-ID: <f28659f5-3042-d974-9dac-dd7c6d5c3c36@intel.com>
Date: Fri, 23 Dec 2022 13:57:39 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
 <20221115170855.196572-41-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20221115170855.196572-41-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v5 40/52] tests/i915/kms_ccs: Add support for
 Bigjoiner
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


On 11/15/2022 10:38 PM, Bhanuprakash Modem wrote:
> This patch will add a check to Skip the subtest if a selected pipe/output
> combo won't support Bigjoiner or 8K mode.
>
> Example:
> * Pipe-D wont support a mode > 5K
> * To use 8K mode on a pipe then consecutive pipe must be available & free.
>
> V2: - Use updated helper name
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/i915/kms_ccs.c | 18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/tests/i915/kms_ccs.c b/tests/i915/kms_ccs.c
> index 9be3fa25..40f05278 100644
> --- a/tests/i915/kms_ccs.c
> +++ b/tests/i915/kms_ccs.c
> @@ -590,12 +590,21 @@ static int test_ccs(data_t *data)
>   static void test_output(data_t *data, const int testnum)
>   {
>   	igt_fixture {
> +		bool found = false;
> +
>   		data->flags = tests[testnum].flags;
>   
> -		data->output = igt_get_single_output_for_pipe(&data->display,
> -							      data->pipe);
> -		igt_require(data->output);
> -		igt_output_set_pipe(data->output, data->pipe);
> +		for_each_valid_output_on_pipe(&data->display, data->pipe, data->output) {
> +			igt_display_reset(&data->display);
> +
> +			igt_output_set_pipe(data->output, data->pipe);
> +			if (i915_pipe_output_combo_valid(&data->display)) {
> +				found = true;
> +				break;
> +			}
> +
> +		}
> +		igt_require_f(found, "No valid pipe/output combo found.\n");
>   	}
>   
>   	for (int i = 0; i < ARRAY_SIZE(ccs_modifiers); i++) {
> @@ -611,7 +620,6 @@ static void test_output(data_t *data, const int testnum)
>   		igt_subtest_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
>   			      tests[testnum].testname, ccs_modifiers[i].str) {
>   			int valid_tests = 0;
> -			igt_require(data->output);
>   
>   			if (data->flags == TEST_RANDOM)
>   				igt_info("Testing with seed %d\n", data->seed);
