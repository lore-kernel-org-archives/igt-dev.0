Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C99411B6B6
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Jul 2022 05:00:08 +0000 (UTC)
Message-ID: <15c32c55-b11d-71d8-c4b2-2fb514750cbe@intel.com>
Date: Thu, 7 Jul 2022 10:29:46 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220630055215.60857-1-mohammed.thasleem@intel.com>
 <20220630055215.60857-2-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220630055215.60857-2-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v5 1/2] tests/kms_rmfb: Create dynamic subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nidhi1.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu-30-06-2022 11:22 am, Mohammed Thasleem wrote:
> Modified kms_rmfb to include dynamic test cases.
> 
> v2: addressed indentation, test description moved into struct
>      and added global description to test.
> v3: minor changes.
> v4: removed space.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/kms_rmfb.c | 36 ++++++++++++++++++++++++++----------
>   1 file changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
> index fcd5cdad..614bbac9 100644
> --- a/tests/kms_rmfb.c
> +++ b/tests/kms_rmfb.c
> @@ -36,6 +36,9 @@
>   #define DRM_CAP_CURSOR_HEIGHT 0x9
>   #endif
>   
> +IGT_TEST_DESCRIPTION("This tests rmfb and close-fd behavior. In these cases"
> +		     "the framebuffers should be removed from the crtc.");
> +
>   struct rmfb_data {
>   	int drm_fd;
>   	igt_display_t display;
> @@ -151,13 +154,28 @@ run_rmfb_test(struct rmfb_data *data, bool reopen)
>   	igt_output_t *output;
>   	enum pipe pipe;
>   
> -	for_each_pipe_with_single_output(&data->display, pipe, output)
> -		test_rmfb(data, output, pipe, reopen);
> +	for_each_pipe_with_single_output(&data->display, pipe, output) {
> +		igt_dynamic_f("%s-pipe-%s", igt_output_name(output),
> +			      kmstest_pipe_name(pipe))

Please update subtest name as <pipe_name>-<output_name>.

- Bhanu

> +			test_rmfb(data, output, pipe, reopen);
> +	}
>   }
>   
>   igt_main
>   {
> +	const struct {
> +		bool flags;
> +		const char *name;
> +		const char *description;
> +	} tests[] = {
> +		{ false, "rmfb-ioctl", "RMFB is supposed to free the framebuffers from any and all "
> +				       "planes so test this and make sure it works."},
> +		{ true, "close-fd", "RMFB is supposed to free the framebuffers from any and all "
> +				    "planes so test this and make sure it works with fd close "
> +				    "and reopen."},
> +	};
>   	struct rmfb_data data = {};
> +	int i;
>   
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> @@ -168,15 +186,13 @@ igt_main
>   		igt_display_require_output(&data.display);
>   	}
>   
> -	igt_describe("RMFB is supposed to free the framebuffers from any and all "
> -		     "planes so test this and make sure it works.");
> -	igt_subtest_f("rmfb-ioctl")
> -		run_rmfb_test(&data, false);
> +	for (i = 0; i < ARRAY_SIZE(tests); i++) {
> +		igt_describe(tests[i].description);
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
>   	igt_fixture {
>   		igt_display_fini(&data.display);
