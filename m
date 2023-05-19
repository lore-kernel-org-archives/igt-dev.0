Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC5110E5C0
 for <igt-dev@lists.freedesktop.org>; Fri, 19 May 2023 05:09:06 +0000 (UTC)
Message-ID: <ea415d38-fcea-e260-700d-0e2989e28915@intel.com>
Date: Fri, 19 May 2023 10:38:51 +0530
To: Arun R Murthy <arun.r.murthy@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230518121353.1146097-1-arun.r.murthy@intel.com>
 <20230518121353.1146097-2-arun.r.murthy@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230518121353.1146097-2-arun.r.murthy@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCHv3 i-g-t 2/4] tests/kms_async_flips: Run the
 test for all outputs
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


On 5/18/2023 5:43 PM, Arun R Murthy wrote:
> Iterate all outputs, in case we have output specific stuff
> (eg. PSR) that could affect the behaviour or async flips
>
> v2: corrected commit message
> v3: run test for all outputs
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>   tests/kms_async_flips.c | 43 ++++++++---------------------------------
>   1 file changed, 8 insertions(+), 35 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index fe27a9ec..99653f1e 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -58,7 +58,6 @@ typedef struct {
>   	int flip_count;
>   	int frame_count;
>   	bool flip_pending;
> -	bool extended;
>   	enum pipe pipe;
>   	bool alternate_sync_async;
>   } data_t;
> @@ -548,49 +547,23 @@ static void test_crc(data_t *data)
>   
>   static void run_test(data_t *data, void (*test)(data_t *))
>   {
> -	igt_output_t *output;
> -	enum pipe pipe;
>   	igt_display_t *display = &data->display;
>   
> -	for_each_pipe(display, pipe) {
> -		for_each_valid_output_on_pipe(display, pipe, output) {
> -			igt_display_reset(display);
> -
> -			igt_output_set_pipe(output, pipe);
> -			if (!i915_pipe_output_combo_valid(display))
> -				continue;
> -
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
> -				data->output = output;
> -				data->pipe = pipe;
> -				test(data);
> -			}
> -
> -			if (!data->extended)
> -				break;
> -		}
> -	}
> -}
> +	for_each_valid_output_on_pipe(display, data->pipe, data->output) {

This still needs to be replaced with 'for_each_pipe_with_valid_output' 
as previously mentioned. Please update this.

Also, this line is adding a whitespace error in patch 3. I guess with 
the above fix this line will go away from patch 3, but please keep note.

> +		igt_display_reset(display);
>   
> -static int opt_handler(int opt, int opt_index, void *_data)
> -{
> -	data_t *data = _data;
> +		igt_output_set_pipe(data->output, data->pipe);
> +		if (!i915_pipe_output_combo_valid(display))
> +			continue;
>   
> -	switch (opt) {
> -	case 'e':
> -		data->extended = true;
> -		break;
> +		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name)
> +			test(data);
>   	}
> -
> -	return IGT_OPT_HANDLER_SUCCESS;
>   }
>   
> -static const char help_str[] =
> -	"  --e \t\tRun the extended tests\n";
> -
>   static data_t data;
>   
> -igt_main_args("e", NULL, help_str, opt_handler, &data)
> +igt_main_args("e", NULL, NULL, NULL, &data)

Please replace this with igt_main as we are not using any args anymore.

Thanks,
Karthik.B.S
>   {
>   	int i;
>   
