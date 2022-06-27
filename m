Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490C7113272
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jun 2022 12:47:13 +0000 (UTC)
Date: Mon, 27 Jun 2022 14:47:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YrmmzQqmUcGdWWzy@kamilkon-desk1>
References: <20220623125239.21836-1-mohammed.thasleem@intel.com>
 <20220623125239.21836-2-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220623125239.21836-2-mohammed.thasleem@intel.com>
Subject: Re: [igt-dev] [PATCH v2 1/2] tests/kms_rmfb: Create dynamic subtests
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

On 2022-06-23 at 18:22:38 +0530, Mohammed Thasleem wrote:
> Modified kms_rmfb to include dynamic test cases.
> 
> v2: addressed indentation, test description moved into struct
>     and added global description to test.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/kms_rmfb.c | 37 +++++++++++++++++++++++++++----------
>  1 file changed, 27 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
> index fcd5cdad..72e58042 100644
> --- a/tests/kms_rmfb.c
> +++ b/tests/kms_rmfb.c
> @@ -36,6 +36,9 @@
>  #define DRM_CAP_CURSOR_HEIGHT 0x9
>  #endif
>  
> +IGT_TEST_DESCRIPTION("This tests rmfb and close-fd behavior. In these cases"
> +		     "the framebuffers should be removed from the crtc.");
> +
>  struct rmfb_data {
>  	int drm_fd;
>  	igt_display_t display;
> @@ -151,14 +154,29 @@ run_rmfb_test(struct rmfb_data *data, bool reopen)
>  	igt_output_t *output;
>  	enum pipe pipe;
>  
> -	for_each_pipe_with_single_output(&data->display, pipe, output)
> -		test_rmfb(data, output, pipe, reopen);
> +	for_each_pipe_with_single_output(&data->display, pipe, output) {
> +		igt_dynamic_f("%s-pipe-%s", igt_output_name(output),
> +			      kmstest_pipe_name(pipe))
> +			test_rmfb(data, output, pipe, reopen);
> +	}
>  }
>  
>  igt_main
>  {
> +	int i;

Move this below after tests[] definition.

>  	struct rmfb_data data = {};
>  

Remove this empty line from here.

> +	const struct {
> +		bool flags;
> +		const char *name;
> +		const char *description;
> +	} tests[] = {
> +		{ false, "rmfb-ioctl", "RMFB is supposed to free the framebuffers from any and all"
------------------------------------------------------------------------------------------------- ^
Please add space here. You can use --describe option to see
description on screen and check them. Now it will look like
"allplanes", but it should be "all planes".

> +				       "planes so test this and make sure it works."},
> +		{ true, "close-fd", "RMFB is supposed to free the framebuffers from any and all planes"
----------------------------------------------------------------------------------------------------- ^
Same here, add space at end.
This line is a little too long, split it more, into three lines.

> +				    "so test this and make sure it works with fd close and reopen."},
> +	};

Put "int i;" here.

> +
>  	igt_fixture {
>  		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>  
> @@ -168,15 +186,14 @@ igt_main
>  		igt_display_require_output(&data.display);
>  	}
>  
> -	igt_describe("RMFB is supposed to free the framebuffers from any and all "
> -		     "planes so test this and make sure it works.");
> -	igt_subtest_f("rmfb-ioctl")
> -		run_rmfb_test(&data, false);
> +	for (i = 0; i < ARRAY_SIZE(tests); i++) {
>  
> -	igt_describe("RMFB is supposed to free the framebuffers from any and all planes "
> -		     "so test this and make sure it works with fd close and reopen.");
> -	igt_subtest_f("close-fd")
> -		run_rmfb_test(&data, true);
> +		igt_describe(tests[i].description);
> +		igt_subtest_with_dynamic(tests[i].name) {
> +			run_rmfb_test(&data, tests[i].flags);
> +
> +		}
> +	}
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -- 
> 2.25.1
> 
