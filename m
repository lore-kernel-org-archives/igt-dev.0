Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E9710E012
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 16:34:15 +0000 (UTC)
Message-ID: <edbd4362-03ef-e9b5-0036-9e02131c3782@intel.com>
Date: Tue, 26 Sep 2023 22:03:45 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230918143754.263696-1-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230918143754.263696-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: remove pipe
 dependency in subtest name
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

Hi Swati,

On Mon-18-09-2023 08:07 pm, Swati Sharma wrote:
> Remove pipe dependency in subtest name and give some
> meaningful name to subtest. >
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_concurrent.c | 39 ++++++++++++---------------------------
>   1 file changed, 12 insertions(+), 27 deletions(-)
> 
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index d9cb197de..e38ee0a4d 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -30,24 +30,13 @@
>    * Description: Test atomic mode setting concurrently with multiple planes and
>    *              screen resolution
>    *
> - * SUBTEST: pipe-%s
> + * SUBTEST: multi-plane-atomic-resolution
>    * Description: Test atomic mode setting concurrently with multiple planes and
> - *              screen resolution on %arg[1].
> + *              screen resolution.
>    * Driver requirement: i915, xe
>    * Functionality: kms_core
>    * Mega feature: General Display Features
>    * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @A:      pipe A
> - * @B:      pipe B
> - * @C:      pipe C
> - * @D:      pipe D
> - * @E:      pipe E
> - * @F:      pipe F
> - * @G:      pipe G
> - * @H:      pipe H
>    */
>   
>   IGT_TEST_DESCRIPTION("Test atomic mode setting concurrently with multiple planes and screen resolution");
> @@ -61,6 +50,7 @@ typedef struct {
>   	igt_display_t display;
>   	igt_plane_t **plane;
>   	struct igt_fb *fb;
> +	enum pipe pipe;

Why do we need this change, since you are passing the pipe as an arg in 
each function call just like a output?

>   } data_t;
>   
>   /* Command line parameters. */
> @@ -341,30 +331,30 @@ run_test(data_t *data, enum pipe pipe, igt_output_t *output)
>   }
>   
>   static void
> -run_tests_for_pipe(data_t *data, enum pipe pipe)
> +run_tests_for_pipe(data_t *data)
>   {
>   	igt_output_t *output;
>   
>   	igt_fixture {
> -		igt_require_pipe(&data->display, pipe);
> -		igt_require(data->display.pipes[pipe].n_planes > 0);
> +		igt_require_pipe(&data->display, data->pipe);

This is redundant, for_each_pipe_with_single_output() guarantees atleast 
one valid pipe.

> +		igt_require(data->display.pipes[data->pipe].n_planes > 0);
------------------------------------------------^
pipe is not initialized. Please move this check inside 
for_each_pipe_with_single_output() if it is really required.

>   
>   		igt_display_require_output(&data->display);

Please move this to igt_fixture inside the igt_main

>   	}
>   
>   	igt_describe("Test atomic mode setting concurrently with multiple planes and screen "
>   		     "resolution.");
> -	igt_subtest_with_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> -		for_each_valid_output_on_pipe(&data->display, pipe, output) {
> +	igt_subtest_with_dynamic("multi-plane-atomic-resolution") {
> +		for_each_pipe_with_single_output(&data->display, data->pipe, output) {

Are we not loosing any coverage, as we are limiting the execution to 
single output?

- Bhanu

>   			igt_display_reset(&data->display);
>   
> -			igt_output_set_pipe(output, pipe);
> +			igt_output_set_pipe(output, data->pipe);
>   			if (!i915_pipe_output_combo_valid(&data->display))
>   				continue;
>   
>   			igt_output_set_pipe(output, PIPE_NONE);
> -			igt_dynamic_f("%s", igt_output_name(output))
> -				run_test(data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), igt_output_name(output))
> +				run_test(data, data->pipe, output);
>   		}
>   	}
>   }
> @@ -405,8 +395,6 @@ static data_t data;
>   
>   igt_main_args("", long_options, help_str, opt_handler, NULL)
>   {
> -	enum pipe pipe;
> -
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   		kmstest_set_vt_graphics_mode();
> @@ -416,10 +404,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   			intel_allocator_multiprocess_start();
>   	}
>   
> -	for_each_pipe_static(pipe) {
> -		igt_subtest_group
> -			run_tests_for_pipe(&data, pipe);
> -	}
> +	run_tests_for_pipe(&data);
>   
>   	igt_fixture {
>   		if (is_intel_device(data.drm_fd))
