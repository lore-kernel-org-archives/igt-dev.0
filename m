Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD4110E01F
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Oct 2023 12:10:36 +0000 (UTC)
Message-ID: <c5830a7d-0d19-407a-78a9-bce983b3afa8@intel.com>
Date: Thu, 5 Oct 2023 17:40:11 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230928155604.546419-1-swati2.sharma@intel.com>
 <20230928155604.546419-2-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230928155604.546419-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v2 1/2] tests/kms_universal_plane: convert subtests
 to dynamic subtests
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


On Thu-28-09-2023 09:26 pm, Swati Sharma wrote:
> Convert subtests to dynamic subtests.
> 
> v2: -use igt_output_name()
>      -use igt_subtest_with_dynamic()
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   tests/kms_universal_plane.c | 112 +++++++++---------------------------
>   1 file changed, 26 insertions(+), 86 deletions(-)
> 
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 8aa43a929..7dbbaba00 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -200,11 +200,6 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
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
> @@ -443,11 +438,6 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
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
> @@ -560,11 +550,6 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
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
> @@ -676,13 +661,9 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
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
> @@ -717,7 +698,6 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   		igt_skip("Primary and/or cursor are unavailable\n");
>   	}
>   
> -
>   	igt_plane_set_fb(primary, &background_fb);
>   	igt_display_commit2(display, COMMIT_LEGACY);
>   
> @@ -807,12 +787,6 @@ pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   
>   	int ret = 0;
>   
> -	igt_skip_on(is_intel_device(data->drm_fd) && data->display_ver < 9);
> -	igt_require_pipe(&data->display, pipe);
> -
> -	igt_info("Using (pipe %s + %s) to run the subtest.\n",
> -		 kmstest_pipe_name(pipe), igt_output_name(output));
> -
>   	igt_output_set_pipe(output, pipe);
>   
>   	gen9_test_init(&test, output, pipe);
> @@ -865,103 +839,72 @@ pipe_output_combo_valid(igt_display_t *display,
>   }
>   
>   static void
> -run_tests_for_pipe(data_t *data, enum pipe pipe)
> +run_tests(data_t *data)
>   {
>   	igt_output_t *output;
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
> +	enum pipe pipe;
>   
>   	igt_describe("Check the switching between different primary plane fbs with CRTC off");
> -	igt_subtest_f("universal-plane-pipe-%s-functional",
> -		      kmstest_pipe_name(pipe)) {
> -		bool found = false;
> -
> -		for_each_valid_output_on_pipe(&data->display, pipe, output) {
> +	igt_subtest_with_dynamic("universal-plane-functional") {
> +		for_each_pipe_with_single_output(&data->display, pipe, output) {
>   			if (!pipe_output_combo_valid(&data->display, pipe, output))
>   				continue;
>   
> -			found = true;
> -			functional_test_pipe(data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
> +				functional_test_pipe(data, pipe, output);
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
> +	igt_subtest_with_dynamic("universal-plane-sanity") {
> +		for_each_pipe_with_single_output(&data->display, pipe, output) {
>   			if (!pipe_output_combo_valid(&data->display, pipe, output))
>   				continue;
>   
> -			found = true;
> -			sanity_test_pipe(data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
> +				sanity_test_pipe(data, pipe, output);
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
> +		     " and pageflip execution");
> +	igt_subtest_with_dynamic("disable-primary-vs-flip") {
> +		for_each_pipe_with_single_output(&data->display, pipe, output) {
>   			if (!pipe_output_combo_valid(&data->display, pipe, output))
>   				continue;
>   
> -			found = true;
> -			pageflip_test_pipe(data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
> +				pageflip_test_pipe(data, pipe, output);
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
> +	igt_subtest_with_dynamic("cursor-fb-leak") {
> +		for_each_pipe_with_single_output(&data->display, pipe, output) {
>   			if (!pipe_output_combo_valid(&data->display, pipe, output))
>   				continue;
>   
> -			found = true;
> -			cursor_leak_test_pipe(data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
> +				cursor_leak_test_pipe(data, pipe, output);
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
> +	igt_subtest_with_dynamic("universal-plane-pageflip-windowed") {
> +		igt_require(is_intel_device(data->drm_fd) && data->display_ver >= 9);
> +		for_each_pipe_with_single_output(&data->display, pipe, output) {
>   			if (!pipe_output_combo_valid(&data->display, pipe, output))
>   				continue;
>   
> -			found = true;
> -			pageflip_win_test_pipe(data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
> +				pageflip_win_test_pipe(data, pipe, output);
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
