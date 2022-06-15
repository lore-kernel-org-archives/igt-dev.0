Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A29112512
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jun 2022 15:50:15 +0000 (UTC)
Date: Wed, 15 Jun 2022 17:50:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yqn/tD2BCoRkIjoB@kamilkon-desk1>
References: <20220615105333.70867-1-mohammed.thasleem@intel.com>
 <20220615105333.70867-2-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220615105333.70867-2-mohammed.thasleem@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_rmfb: Create dynamic
 subtests
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

Hi Mohammed,

May you also add global description to test ?

On 2022-06-15 at 16:23:32 +0530, Mohammed Thasleem wrote:
> Modified kms_rmfb to include dynamic test cases.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/kms_rmfb.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
> index fcd5cdad..53172ded 100644
> --- a/tests/kms_rmfb.c
> +++ b/tests/kms_rmfb.c
> @@ -151,14 +151,26 @@ run_rmfb_test(struct rmfb_data *data, bool reopen)
>  	igt_output_t *output;
>  	enum pipe pipe;
>  
> -	for_each_pipe_with_single_output(&data->display, pipe, output)
> +	for_each_pipe_with_single_output(&data->display, pipe, output) {
> +		igt_dynamic_f("%s-pipe-%s", igt_output_name(output),
> +			      kmstest_pipe_name(pipe))
>  		test_rmfb(data, output, pipe, reopen);
--------------- ^

Indent this call (add tab here).

> +	}
>  }
>  
>  igt_main
>  {
> +	int i;
>  	struct rmfb_data data = {};
>  
> +	const struct {
> +		bool flags;
> +		const char *name;

Add description here:
		const char *description;

> +	} tests[] = {
> +		{ false, "rmfb-ioctl" },

And put them after names.

> +		{ true, "close-fd" },
> +	};
> +
>  	igt_fixture {
>  		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>  
> @@ -168,15 +180,16 @@ igt_main
>  		igt_display_require_output(&data.display);
>  	}
>  
> -	igt_describe("RMFB is supposed to free the framebuffers from any and all "
> -		     "planes so test this and make sure it works.");

Move this description into struct.

> -	igt_subtest_f("rmfb-ioctl")
> -		run_rmfb_test(&data, false);
> +	for (i = 0; i < ARRAY_SIZE(tests); i++) {
> +
> +		igt_describe("RMFB is supposed to free the framebuffers from any and all "

Here you can use igt_describe_f() with tests[i].description.

Regards,
Kamil

> +			     "planes so test this and make sure it works with rmfb-ioctl,"
> +			     "fd close and reopen.");
> +		igt_subtest_with_dynamic(tests[i].name) {
> +			run_rmfb_test(&data, tests[i].flags);
>  
> -	igt_describe("RMFB is supposed to free the framebuffers from any and all planes "
> -		     "so test this and make sure it works with fd close and reopen.");
> -	igt_subtest_f("close-fd")
> -		run_rmfb_test(&data, true);
> +		}
> +	}
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -- 
> 2.25.1
> 
