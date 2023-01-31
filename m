Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F4010E338
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Jan 2023 12:22:15 +0000 (UTC)
Message-ID: <61922555-cfbf-e8bb-7b70-e047e98afc25@intel.com>
Date: Tue, 31 Jan 2023 17:51:22 +0530
Content-Language: en-US
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230131120646.27434-1-ville.syrjala@linux.intel.com>
 <20230131120646.27434-5-ville.syrjala@linux.intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230131120646.27434-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/6] tests/kms_async_flips: Run the test
 only once per pipe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Ville,

On Tue-31-01-2023 05:36 pm, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> No real reason to iterate over all the outputs here. Just
> do the test once per pipe.
> 
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/kms_async_flips.c | 18 +++++-------------
>   1 file changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index f8c97e029c59..54611f66350d 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -544,20 +544,12 @@ static void test_crc(data_t *data)
>   
>   static void run_test(data_t *data, void (*test)(data_t *))
>   {
> -	igt_output_t *output;
> -	enum pipe pipe;
> +	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {

If data->extended is true, it'll iterate over all outputs. Maybe we can 
use for_each_pipe_with_single_output() to run test once per pipe.

- Bhanu

> +		igt_dynamic_f("pipe-%s", kmstest_pipe_name(data->pipe))
> +			test(data);
>   
> -	for_each_pipe(&data->display, pipe) {
> -		for_each_valid_output_on_pipe(&data->display, pipe, output) {
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
> -				data->output = output;
> -				data->pipe = pipe;
> -				test(data);
> -			}
> -
> -			if (!data->extended)
> -				break;
> -		}
> +		if (!data->extended)
> +			break;
>   	}
>   }
>   
