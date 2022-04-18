Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42A010F56C
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Apr 2022 10:53:56 +0000 (UTC)
Message-ID: <631db0bd-e105-847b-5e85-99dfd42cf0a8@intel.com>
Date: Mon, 18 Apr 2022 16:23:42 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220418075356.22143-1-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220418075356.22143-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms : Added dynamic test cases
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

On Mon-18-04-2022 01:23 pm, Nidhi Gupta wrote:
> Modified kms_sequence and kms_concurrent to include
> dynamic test cases.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_concurrent.c |  6 ++++--
>   tests/kms_sequence.c   | 13 ++++++++++---
>   2 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index dc1e36f2..5536a369 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -339,9 +339,11 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
>   
>   	igt_describe("Test atomic mode setting concurrently with multiple planes and screen "
>   		     "resolution.");
> -	igt_subtest_f("pipe-%s", kmstest_pipe_name(pipe))
> +	igt_subtest_with_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
>   		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			run_test(data, pipe, output);
> +			igt_dynamic_f("%s", igt_output_name(output))
> +				run_test(data, pipe, output);

You need to remove for_each_valid_output_on_pipe() logic from 
run_test(), since we already doing here the same.

> +	}
>   }
>   
>   static int opt_handler(int option, int option_index, void *input)
> diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
> index 9c287480..aeabce23 100644
> --- a/tests/kms_sequence.c
> +++ b/tests/kms_sequence.c
> @@ -253,6 +253,7 @@ static void sequence_queue(data_t *data, int fd, int nchildren)
>   igt_main
>   {
>   	int fd;
> +	igt_output_t *output;
>   	data_t data;
>   	const struct {
>   		const char *name;
> @@ -278,6 +279,7 @@ igt_main
>   		fd = drm_open_driver_master(DRIVER_ANY);
>   		kmstest_set_vt_graphics_mode();
>   		igt_display_require(&data.display, fd);
> +		igt_display_require_output(&data.display);
>   	}
>   
>   	for (f = funcs; f->name; f++) {
> @@ -287,9 +289,14 @@ igt_main
>   
>   			igt_describe("This is a test of drmCrtcGetSequence and "
>   				     "drmCrtcQueueSequence");
> -			igt_subtest_f("%s-%s", f->name, m->name) {
> -				data.flags = m->flags;
> -				run_test(&data, fd, f->func);
> +			igt_subtest_with_dynamic_f("%s-%s", f->name, m->name) {
> +				for_each_connected_output(&data.display, output) {
> +					igt_dynamic_f("%s", igt_output_name(output)) {
> +						data.output = output;

We are no where using this "data.output".

Actually, run_test() is iterating for_each_pipe_with_valid_output() to 
get valid pipe/connector combination.

If you want to create dynamic subtests with pipe/connector config, you 
need to iterate for_each_pipe_with_valid_output() before calling 
igt_dynamic() and remove the same logic from run_test().

- Bhanu

> +						data.flags = m->flags;
> +						run_test(&data, fd, f->func);
> +					}
> +				}
>   			}
>   		}
>   	}
