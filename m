Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3014110E16A
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Dec 2022 08:05:25 +0000 (UTC)
Message-ID: <9a6e5940-9685-37cc-00df-4c7cb2db7fa5@intel.com>
Date: Fri, 23 Dec 2022 13:35:12 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20221115170855.196572-4-bhanuprakash.modem@intel.com>
 <20221223062955.2526525-1-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20221223062955.2526525-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v6 03/52] tests/kms_async_flips: Add support
 for Bigjoiner
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


On 12/23/2022 11:59 AM, Bhanuprakash Modem wrote:
> This patch will add a check to Skip the subtest if a selected pipe/output
> combo won't support Bigjoiner or 8K mode.
>
> Example:
> * Pipe-D wont support a mode > 5K
> * To use 8K mode on a pipe then consecutive pipe must be available & free.
>
> V2: - Use updated helper name
> V3: - Drop unrelated changes
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_async_flips.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 7cb71f6b..e32ae914 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -542,9 +542,16 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   {
>   	igt_output_t *output;
>   	enum pipe pipe;
> +	igt_display_t *display = &data->display;
> +
> +	for_each_pipe(display, pipe) {
> +		for_each_valid_output_on_pipe(display, pipe, output) {
> +			igt_display_reset(display);
> +
> +			igt_output_set_pipe(output, pipe);
> +			if (!i915_pipe_output_combo_valid(display))
> +				continue;
>   
> -	for_each_pipe(&data->display, pipe) {
> -		for_each_valid_output_on_pipe(&data->display, pipe, output) {
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
>   				data->output = output;
>   				data->pipe = pipe;
