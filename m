Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4759C10E3B3
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:34:12 +0000 (UTC)
Message-ID: <1d1da706-9e84-ff86-92e4-4bd241ec6e5b@intel.com>
Date: Wed, 17 May 2023 12:03:53 +0530
Content-Language: en-US
To: Arun R Murthy <arun.r.murthy@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230516062206.1064604-1-arun.r.murthy@intel.com>
 <20230517035052.1099227-1-arun.r.murthy@intel.com>
 <20230517035052.1099227-2-arun.r.murthy@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230517035052.1099227-2-arun.r.murthy@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCHv2 i-g-t 2/4] tests/kms_async_flips: Run the
 test only once per pipe
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


On 5/17/2023 9:20 AM, Arun R Murthy wrote:
> No real reason to iterate over all the outputs here. Just
> do the test once per pipe.
>
> v2: corrected commit message
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>   tests/kms_async_flips.c | 25 +++++++++----------------
>   1 file changed, 9 insertions(+), 16 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index fe27a9ec..1c036426 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -548,27 +548,20 @@ static void test_crc(data_t *data)
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
> +	for_each_valid_output_on_pipe(display, data->pipe, data->output) {
> +		igt_display_reset(display);
>   
> -			igt_output_set_pipe(output, pipe);
> -			if (!i915_pipe_output_combo_valid(display))
> -				continue;
> +		igt_output_set_pipe(data->output, data->pipe);
> +		if (!i915_pipe_output_combo_valid(display))
> +			continue;
>   
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
> -				data->output = output;
> -				data->pipe = pipe;
> -				test(data);
> -			}
> +		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name)
> +			test(data);
>   
> -			if (!data->extended)
> -				break;
> -		}
> +		if (!data->extended)
> +			break;

Hi,

Based on discussion on the previous revision, I think it would be better 
to remove this completely and run on all outputs even on regular CI runs?

Thanks,
Karthik.B.S
>   	}
>   }
>   
