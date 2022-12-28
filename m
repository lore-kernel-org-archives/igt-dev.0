Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A1A10E0FC
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Dec 2022 10:54:29 +0000 (UTC)
Message-ID: <5de06979-c6e2-313b-bed8-8432e095b07b@intel.com>
Date: Wed, 28 Dec 2022 16:24:13 +0530
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
 <20221115170855.196572-35-bhanuprakash.modem@intel.com>
From: "Sharma, Ananya" <ananya.sharma@intel.com>
In-Reply-To: <20221115170855.196572-35-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v5 34/52] tests/kms_universal_plane: Add
 support for Bigjoiner
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


On 15-11-2022 22:38, Bhanuprakash Modem wrote:
> This patch will add a check to Skip the subtest if a selected pipe/output
> combo won't support Bigjoiner or 8K mode.
>
> Example:
> * Pipe-D wont support a mode > 5K
> * To use 8K mode on a pipe then consecutive pipe must be available & free.
>
> V2: - Use updated helper name
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Ananya Sharma <ananya.sharma@intel.com>
> ---
>   tests/kms_universal_plane.c | 94 +++++++++++++++++++++++++++++++++----
>   1 file changed, 84 insertions(+), 10 deletions(-)
>
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index dd8fa193..2a9eb021 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -381,6 +381,9 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   
>   	igt_require_pipe(&data->display, pipe);
>   
> +	igt_info("Using (pipe %s + %s) to run the subtest.\n",
> +		 kmstest_pipe_name(pipe), igt_output_name(output));
> +
>   	igt_output_set_pipe(output, pipe);
>   	mode = igt_output_get_mode(output);
>   
> @@ -494,6 +497,9 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   
>   	igt_require_pipe(&data->display, pipe);
>   
> +	igt_info("Using (pipe %s + %s) to run the subtest.\n",
> +		 kmstest_pipe_name(pipe), igt_output_name(output));
> +
>   	igt_output_set_pipe(output, pipe);
>   
>   	pageflip_test_init(&test, output, pipe);
> @@ -604,6 +610,9 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   	igt_require(display->has_cursor_plane);
>   	igt_require_intel(data->drm_fd);
>   
> +	igt_info("Using (pipe %s + %s) to run the subtest.\n",
> +		 kmstest_pipe_name(pipe), igt_output_name(output));
> +
>   	igt_output_set_pipe(output, pipe);
>   	mode = igt_output_get_mode(output);
>   
> @@ -731,6 +740,9 @@ pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   	igt_skip_on(is_i915_device(data->drm_fd) && data->display_ver < 9);
>   	igt_require_pipe(&data->display, pipe);
>   
> +	igt_info("Using (pipe %s + %s) to run the subtest.\n",
> +		 kmstest_pipe_name(pipe), igt_output_name(output));
> +
>   	igt_output_set_pipe(output, pipe);
>   
>   	gen9_test_init(&test, output, pipe);
> @@ -766,6 +778,22 @@ pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   	gen9_test_fini(&test, output);
>   }
>   
> +static bool
> +pipe_output_combo_valid(igt_display_t *display,
> +			enum pipe pipe, igt_output_t *output)
> +{
> +	bool ret = true;
> +
> +	igt_display_reset(display);
> +
> +	igt_output_set_pipe(output, pipe);
> +	if (!i915_pipe_output_combo_valid(display))
> +		ret = false;
> +	igt_output_set_pipe(output, PIPE_NONE);
> +
> +	return ret;
> +}
> +
>   static void
>   run_tests_for_pipe(data_t *data, enum pipe pipe)
>   {
> @@ -784,34 +812,79 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
>   
>   	igt_describe("Check the switching between different primary plane fbs with CRTC off");
>   	igt_subtest_f("universal-plane-pipe-%s-functional",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> +		      kmstest_pipe_name(pipe)) {
> +		bool found = false;
> +
> +		for_each_valid_output_on_pipe(&data->display, pipe, output) {
> +			if (!pipe_output_combo_valid(&data->display, pipe, output))
> +				continue;
> +
> +			found = true;
>   			functional_test_pipe(data, pipe, output);
> +		}
> +		igt_require_f(found, "No valid pipe/output combo found.\n");
> +	}
>   
>   	igt_describe("Test for scale-up or scale-down using universal plane API without covering CRTC");
>   	igt_subtest_f("universal-plane-pipe-%s-sanity",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> +		      kmstest_pipe_name(pipe)) {
> +		bool found = false;
> +
> +		for_each_valid_output_on_pipe(&data->display, pipe, output) {
> +			if (!pipe_output_combo_valid(&data->display, pipe, output))
> +				continue;
> +
> +			found = true;
>   			sanity_test_pipe(data, pipe, output);
> +		}
> +		igt_require_f(found, "No valid pipe/output combo found.\n");
> +	}
>   
>   	igt_describe("Check pageflips while primary plane is disabled before IOCTL or between IOCTL"
>   			" and pageflip execution");
>   	igt_subtest_f("disable-primary-vs-flip-pipe-%s",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> +		      kmstest_pipe_name(pipe)) {
> +		bool found = false;
> +
> +		for_each_valid_output_on_pipe(&data->display, pipe, output) {
> +			if (!pipe_output_combo_valid(&data->display, pipe, output))
> +				continue;
> +
> +			found = true;
>   			pageflip_test_pipe(data, pipe, output);
> +		}
> +		igt_require_f(found, "No valid pipe/output combo found.\n");
> +	}
>   
>   	igt_describe("Check for cursor leaks after performing cursor operations");
>   	igt_subtest_f("cursor-fb-leak-pipe-%s",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> +		      kmstest_pipe_name(pipe)) {
> +		bool found = false;
> +
> +		for_each_valid_output_on_pipe(&data->display, pipe, output) {
> +			if (!pipe_output_combo_valid(&data->display, pipe, output))
> +				continue;
> +
> +			found = true;
>   			cursor_leak_test_pipe(data, pipe, output);
> +		}
> +		igt_require_f(found, "No valid pipe/output combo found.\n");
> +	}
>   
>   	igt_describe("Check if pageflip succeeds in windowed setting");
>   	igt_subtest_f("universal-plane-pageflip-windowed-pipe-%s",
> -		      kmstest_pipe_name(pipe))
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> +		      kmstest_pipe_name(pipe)) {
> +		bool found = false;
> +
> +		for_each_valid_output_on_pipe(&data->display, pipe, output) {
> +			if (!pipe_output_combo_valid(&data->display, pipe, output))
> +				continue;
> +
> +			found = true;
>   			pageflip_win_test_pipe(data, pipe, output);
> +		}
> +		igt_require_f(found, "No valid pipe/output combo found.\n");
> +	}
>   }
>   
>   static data_t data;
> @@ -829,6 +902,7 @@ igt_main
>   
>   		igt_require_pipe_crc(data.drm_fd);
>   		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
>   	}
>   
>   	for_each_pipe_static(pipe) {
