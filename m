Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8774F10E34E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Sep 2022 03:56:36 +0000 (UTC)
Message-ID: <582babf5-a5c1-16c0-7b06-c4a4478e1b0d@intel.com>
Date: Wed, 21 Sep 2022 09:26:18 +0530
To: Ananya Sharma <ananya.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220919095442.666253-1-ananya.sharma@intel.com>
 <20220919095442.666253-2-ananya.sharma@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220919095442.666253-2-ananya.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v5 1/2] tests/kms_universal_plane:
 Convert test to dynamic
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

On Mon-19-09-2022 03:24 pm, Ananya Sharma wrote:
> Modified kms_universal_plane to include dynamic test cases.
> 
> Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
> ---
>   tests/kms_universal_plane.c | 77 ++++++++++++++++---------------------
>   1 file changed, 33 insertions(+), 44 deletions(-)
> 
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 432f56ba..104323e7 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -752,59 +752,50 @@ pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   }
>   
>   static void
> -run_tests_for_pipe(data_t *data, enum pipe pipe)
> +run_tests_for_pipe(data_t *data)
>   {
>   	igt_output_t *output;
> 

Drop this new line.

> -	igt_fixture {
> -		int valid_tests = 0;
> +	struct {
> +		const char *name;
> +		void (*test_t)(data_t*, enum pipe, igt_output_t*);
> +		const char *desc;
> +	} tests[] = {
> +		{ "universal-plane-functional", functional_test_pipe,
> +		  "Check the switching between different primary plane fbs with CRTC off" },
>   
> -		igt_require_pipe(&data->display, pipe);
> +		{ "universal-plane-sanity", sanity_test_pipe,
> +		  "Test for scale-up or scale-down using universal plane API without CRTC" },
>   
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			valid_tests++;
> +		{ "disable-primary-vs-flip", pageflip_test_pipe,
> +		  "Check pageflips while primary plane is disabled before IOCTL or between IOCTL"
> +		  "and pageflip execution" },
>   
> -		igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
> -	}
> +		{ "cursor-fb-leak", cursor_leak_test_pipe,
> +		  "Check for cursor leaks after performing cursor operations" },
>   
> -	igt_describe("Check the switching between different primary plane fbs with CRTC off");
> -	igt_subtest_f("universal-plane-pipe-%s-functional",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			functional_test_pipe(data, pipe, output);
> -
> -	igt_describe("Test for scale-up or scale-down using universal plane API without covering CRTC");
> -	igt_subtest_f("universal-plane-pipe-%s-sanity",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			sanity_test_pipe(data, pipe, output);
> -
> -	igt_describe("Check pageflips while primary plane is disabled before IOCTL or between IOCTL"
> -			" and pageflip execution");
> -	igt_subtest_f("disable-primary-vs-flip-pipe-%s",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			pageflip_test_pipe(data, pipe, output);
> -
> -	igt_describe("Check for cursor leaks after performing cursor operations");
> -	igt_subtest_f("cursor-fb-leak-pipe-%s",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			cursor_leak_test_pipe(data, pipe, output);
> -
> -	igt_describe("Check if pageflip succeeds in windowed setting");
> -	igt_subtest_f("universal-plane-pageflip-windowed-pipe-%s",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			pageflip_win_test_pipe(data, pipe, output);
> +		{ "universal-plane-pageflip-windowed", pageflip_win_test_pipe,
> +		  "Check if pageflip succeeds in windowed setting"},
> +	};
> +	int i;
> +	enum pipe pipe;

Please add a new line to separate variable declarations & actual logic.

> +		for (i = 0; i < ARRAY_SIZE(tests); i++) {
> +			igt_describe_f("%s", tests[i].desc);
> +			igt_subtest_with_dynamic(tests[i].name) {
> +				for_each_pipe_with_single_output(&data->display, pipe, output) {
> +					igt_display_reset(&data->display);
> +					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +						      igt_output_name(output))
> +					tests[i].test_t(data, pipe, output);
---------------------------^
> +				}
----------------------^
> +			}
----------------^
> +		}
-----------^
Please fix the indentation of this block.

>   }
>   
>   static data_t data;
>   
>   igt_main
>   {
> -	enum pipe pipe;
> -
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   		if (is_i915_device(data.drm_fd))
> @@ -816,10 +807,8 @@ igt_main
>   		igt_display_require(&data.display, data.drm_fd);
>   	}
>   
> -	for_each_pipe_static(pipe) {
> -		igt_subtest_group
> -			run_tests_for_pipe(&data, pipe);
> -	}
> +	igt_subtest_group
> +			run_tests_for_pipe(&data);
----------------^
Please fix the indentation.

>   
>   	igt_fixture {
>   		igt_display_fini(&data.display);
