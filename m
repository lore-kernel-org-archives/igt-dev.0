Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5754210E4A8
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 03:08:39 +0000 (UTC)
Message-ID: <aef21464-c1e8-7fc2-78e6-7565617690e2@intel.com>
Date: Wed, 6 Apr 2022 08:38:24 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220331062438.16545-1-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220331062438.16545-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] Add dynamic subtests
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

On Thu-31-03-2022 11:54 am, Nidhi Gupta wrote:
> Modified kms_sequence and kms_concurrent to include
> dynamic subtests.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_concurrent.c | 6 ++++--
>   tests/kms_sequence.c   | 6 ++++--
>   2 files changed, 8 insertions(+), 4 deletions(-)
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
> +	}
>   }
>   
>   static int opt_handler(int option, int option_index, void *input)
> diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
> index 9c287480..d33669a7 100644
> --- a/tests/kms_sequence.c
> +++ b/tests/kms_sequence.c
> @@ -278,6 +278,7 @@ igt_main
>   		fd = drm_open_driver_master(DRIVER_ANY);
>   		kmstest_set_vt_graphics_mode();
>   		igt_display_require(&data.display, fd);
> +		igt_display_require_output(&data.display);
>   	}
>   
>   	for (f = funcs; f->name; f++) {
> @@ -287,9 +288,10 @@ igt_main
>   
>   			igt_describe("This is a test of drmCrtcGetSequence and "
>   				     "drmCrtcQueueSequence");
> -			igt_subtest_f("%s-%s", f->name, m->name) {
> +			igt_subtest_with_dynamic_f("%s-%s", f->name, m->name) {
>   				data.flags = m->flags;
> -				run_test(&data, fd, f->func);
> +				igt_dynamic_f("%s", igt_output_name(data.output))

This is wrong, data.output is not initialized.

- Bhanu
> +					run_test(&data, fd, f->func);
>   			}
>   		}
>   	}
