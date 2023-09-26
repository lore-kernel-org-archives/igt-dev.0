Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206D510E3FC
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 16:14:01 +0000 (UTC)
Message-ID: <0c2e957d-34fb-4ea8-6a65-8c01888d2e16@intel.com>
Date: Tue, 26 Sep 2023 21:43:37 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230918095033.257372-1-swati2.sharma@intel.com>
 <20230918095033.257372-2-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230918095033.257372-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_universal_plane: convert
 subtests to dynamic subtests
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

On Mon-18-09-2023 03:20 pm, Swati Sharma wrote:
> Convert subtests to dynamic subtests.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_universal_plane.c | 122 +++++++++---------------------------
>   1 file changed, 31 insertions(+), 91 deletions(-)
> 
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 8aa43a929..45278916d 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -97,6 +97,8 @@ typedef struct {
>   	int drm_fd;
>   	igt_display_t display;
>   	int display_ver;
> +	enum pipe pipe;
> +	igt_output_t *output;

Why do we need this change, since you are passing pipe & output as args 
in each function call?

>   } data_t;
>   
>   typedef struct {
> @@ -200,11 +202,6 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   	int num_primary = 0, num_cursor = 0;
>   	int i;
>   
> -	igt_require_pipe(display, pipe);
> -
> -	igt_info("Testing connector %s using pipe %s\n", igt_output_name(output),
> -		 kmstest_pipe_name(pipe));
> -
>   	functional_test_init(&test, output, pipe);
>   
>   	/*
> @@ -443,11 +440,6 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   	int i;
>   	int expect = 0;
>   
> -	igt_require_pipe(&data->display, pipe);
> -
> -	igt_info("Using (pipe %s + %s) to run the subtest.\n",
> -		 kmstest_pipe_name(pipe), igt_output_name(output));
> -
>   	igt_output_set_pipe(output, pipe);
>   	mode = igt_output_get_mode(output);
>   
> @@ -560,11 +552,6 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   	fd_set fds;
>   	int ret = 0;
>   
> -	igt_require_pipe(&data->display, pipe);
> -
> -	igt_info("Using (pipe %s + %s) to run the subtest.\n",
> -		 kmstest_pipe_name(pipe), igt_output_name(output));
> -
>   	igt_output_set_pipe(output, pipe);
>   
>   	pageflip_test_init(&test, output, pipe);
> @@ -676,13 +663,9 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   	int r, g, b;
>   	int count1, count2;
>   
> -	igt_require_pipe(display, pipe);
>   	igt_require(display->has_cursor_plane);
>   	igt_require_intel(data->drm_fd);
>   
> -	igt_info("Using (pipe %s + %s) to run the subtest.\n",
> -		 kmstest_pipe_name(pipe), igt_output_name(output));
> -
>   	igt_output_set_pipe(output, pipe);
>   	mode = igt_output_get_mode(output);
>   
> @@ -717,7 +700,6 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   		igt_skip("Primary and/or cursor are unavailable\n");
>   	}
>   
> -

Nit: Unrelated change.

>   	igt_plane_set_fb(primary, &background_fb);
>   	igt_display_commit2(display, COMMIT_LEGACY);
>   
> @@ -808,10 +790,6 @@ pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   	int ret = 0;
>   
>   	igt_skip_on(is_intel_device(data->drm_fd) && data->display_ver < 9);

Please don't skip the dynamic subtest, instead just don't run it.
Also, please fix igt_require in cursor_leak_test_pipe().

> -	igt_require_pipe(&data->display, pipe);
> -
> -	igt_info("Using (pipe %s + %s) to run the subtest.\n",
> -		 kmstest_pipe_name(pipe), igt_output_name(output));
>   
>   	igt_output_set_pipe(output, pipe);
>   
> @@ -865,103 +843,68 @@ pipe_output_combo_valid(igt_display_t *display,
>   }
>   
>   static void
> -run_tests_for_pipe(data_t *data, enum pipe pipe)
> +run_tests(data_t *data)
>   {
> -	igt_output_t *output;
> -
> -	igt_fixture {
> -		int valid_tests = 0;
> -
> -		igt_require_pipe(&data->display, pipe);
> -
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			valid_tests++;
> -
> -		igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
> -	}
> -
>   	igt_describe("Check the switching between different primary plane fbs with CRTC off");
> -	igt_subtest_f("universal-plane-pipe-%s-functional",
> -		      kmstest_pipe_name(pipe)) {
> -		bool found = false;
> -
> -		for_each_valid_output_on_pipe(&data->display, pipe, output) {
> -			if (!pipe_output_combo_valid(&data->display, pipe, output))
> +	igt_subtest_with_dynamic_f("universal-plane-functional") {
--------------------------------^
'_f' variant is not required if the subtest name is fixed.

> +		for_each_pipe_with_single_output(&data->display, data->pipe, data->output) {

This API will limit the execution to single pipe, are we not missing any 
coverage?

> +			if (!pipe_output_combo_valid(&data->display, data->pipe, data->output))
>   				continue;
>   
> -			found = true;
> -			functional_test_pipe(data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name)
-----------------------------------------------------------------------------------^
Please use igt_output_name() for output name.

- Bhanu

> +				functional_test_pipe(data, data->pipe, data->output);
>   		}
> -		igt_require_f(found, "No valid pipe/output combo found.\n");
>   	}
>   
>   	igt_describe("Test for scale-up or scale-down using universal plane API without covering CRTC");
> -	igt_subtest_f("universal-plane-pipe-%s-sanity",
> -		      kmstest_pipe_name(pipe)) {
> -		bool found = false;
> -
> -		for_each_valid_output_on_pipe(&data->display, pipe, output) {
> -			if (!pipe_output_combo_valid(&data->display, pipe, output))
> +	igt_subtest_with_dynamic_f("universal-plane-sanity") {
> +		for_each_pipe_with_single_output(&data->display, data->pipe, data->output) {
> +			if (!pipe_output_combo_valid(&data->display, data->pipe, data->output))
>   				continue;
>   
> -			found = true;
> -			sanity_test_pipe(data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name)
> +				sanity_test_pipe(data, data->pipe, data->output);
>   		}
> -		igt_require_f(found, "No valid pipe/output combo found.\n");
>   	}
>   
>   	igt_describe("Check pageflips while primary plane is disabled before IOCTL or between IOCTL"
> -			" and pageflip execution");
> -	igt_subtest_f("disable-primary-vs-flip-pipe-%s",
> -		      kmstest_pipe_name(pipe)) {
> -		bool found = false;
> -
> -		for_each_valid_output_on_pipe(&data->display, pipe, output) {
> -			if (!pipe_output_combo_valid(&data->display, pipe, output))
> +		     " and pageflip execution");
> +	igt_subtest_with_dynamic_f("disable-primary-vs-flip") {
> +		for_each_pipe_with_single_output(&data->display, data->pipe, data->output) {
> +			if (!pipe_output_combo_valid(&data->display, data->pipe, data->output))
>   				continue;
>   
> -			found = true;
> -			pageflip_test_pipe(data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name)
> +				pageflip_test_pipe(data, data->pipe, data->output);
>   		}
> -		igt_require_f(found, "No valid pipe/output combo found.\n");
>   	}
>   
>   	igt_describe("Check for cursor leaks after performing cursor operations");
> -	igt_subtest_f("cursor-fb-leak-pipe-%s",
> -		      kmstest_pipe_name(pipe)) {
> -		bool found = false;
> -
> -		for_each_valid_output_on_pipe(&data->display, pipe, output) {
> -			if (!pipe_output_combo_valid(&data->display, pipe, output))
> +	igt_subtest_with_dynamic_f("cursor-fb-leak") {
> +		for_each_pipe_with_single_output(&data->display, data->pipe, data->output) {
> +			if (!pipe_output_combo_valid(&data->display, data->pipe, data->output))
>   				continue;
>   
> -			found = true;
> -			cursor_leak_test_pipe(data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name)
> +				cursor_leak_test_pipe(data, data->pipe, data->output);
>   		}
> -		igt_require_f(found, "No valid pipe/output combo found.\n");
>   	}
>   
>   	igt_describe("Check if pageflip succeeds in windowed setting");
> -	igt_subtest_f("universal-plane-pageflip-windowed-pipe-%s",
> -		      kmstest_pipe_name(pipe)) {
> -		bool found = false;
> -
> -		for_each_valid_output_on_pipe(&data->display, pipe, output) {
> -			if (!pipe_output_combo_valid(&data->display, pipe, output))
> +	igt_subtest_with_dynamic_f("universal-plane-pageflip-windowed") {
> +		for_each_pipe_with_single_output(&data->display, data->pipe, data->output) {
> +			if (!pipe_output_combo_valid(&data->display, data->pipe, data->output))
>   				continue;
>   
> -			found = true;
> -			pageflip_win_test_pipe(data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name)
> +				pageflip_win_test_pipe(data, data->pipe, data->output);
>   		}
> -		igt_require_f(found, "No valid pipe/output combo found.\n");
>   	}
>   }
>   
> -static data_t data;
> -
>   igt_main
>   {
> -	enum pipe pipe;
> +	data_t data;
>   
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> @@ -975,10 +918,7 @@ igt_main
>   		igt_display_require_output(&data.display);
>   	}
>   
> -	for_each_pipe_static(pipe) {
> -		igt_subtest_group
> -			run_tests_for_pipe(&data, pipe);
> -	}
> +	run_tests(&data);
>   
>   	igt_fixture {
>   		igt_display_fini(&data.display);
