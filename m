Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7259010EC5D
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 02:57:32 +0000 (UTC)
Message-ID: <75ab57a5-3c26-a15e-cbf8-a5fe007cf1f9@intel.com>
Date: Wed, 6 Apr 2022 08:27:13 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220322110912.3509-1-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220322110912.3509-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v7] IGT cleanup
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

On Tue-22-03-2022 04:39 pm, Nidhi Gupta wrote:
> Before starting the next subtest, clean up the states to default
> values, those are assumed by other tests.
> 
> v2: And also before running the subtest we need to sanitize the system state
> to default, since we can't trust the state of previous subtest, used
> igt_display_reset() to sanitize the state. (Bhanuprakash Modem)
> 
> Below tests are modified:
> 	tests/kms_concurrent.c
> 	tests/kms_sequence.c
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>

For readability purpose, please update the title. Just IGT Cleanup looks 
poor to me.

With this change, this patch is
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu
> ---
>   tests/kms_concurrent.c | 39 ++++++++++++++-------------------------
>   tests/kms_sequence.c   |  8 +++++---
>   2 files changed, 19 insertions(+), 28 deletions(-)
> 
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 1b8f4b04..3fbf80e1 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -82,7 +82,8 @@ static void test_fini(data_t *data, enum pipe pipe, int n_planes,
>   	}
>   
>   	/* reset the constraint on the pipe */
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
>   	free(data->plane);
>   	data->plane = NULL;
> @@ -278,35 +279,28 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
>   static void
>   run_test(data_t *data, enum pipe pipe, igt_output_t *output)
>   {
> -	int connected_outs;
>   	int n_planes = data->display.pipes[pipe].n_planes;
> +	igt_display_reset(&data->display);
>   
>   	if (!opt.user_seed)
>   		opt.seed = time(NULL);
>   
> -	connected_outs = 0;
> -	for_each_valid_output_on_pipe(&data->display, pipe, output) {
> -		igt_info("Testing resolution with connector %s using pipe %s with seed %d\n",
> -			 igt_output_name(output), kmstest_pipe_name(pipe), opt.seed);
> +	igt_info("Testing resolution with connector %s using pipe %s with seed %d\n",
> +		 igt_output_name(output), kmstest_pipe_name(pipe), opt.seed);
>   
> -		srand(opt.seed);
> +	srand(opt.seed);
>   
> -		test_init(data, pipe, n_planes, output);
> +	test_init(data, pipe, n_planes, output);
>   
> -		igt_fork(child, 1) {
> -			test_plane_position_with_output(data, pipe, n_planes, output);
> -		}
> -
> -		test_resolution_with_output(data, pipe, n_planes, output);
> -
> -		igt_waitchildren();
> +	igt_fork(child, 1) {
> +		test_plane_position_with_output(data, pipe, n_planes, output);
> +	}
>   
> -		test_fini(data, pipe, n_planes, output);
> +	test_resolution_with_output(data, pipe, n_planes, output);
>   
> -		connected_outs++;
> -	}
> +	igt_waitchildren();
>   
> -	igt_skip_on(connected_outs == 0);
> +	test_fini(data, pipe, n_planes, output);
>   }
>   
>   static void
> @@ -315,15 +309,10 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
>   	igt_output_t *output;
>   
>   	igt_fixture {
> -		int valid_tests = 0;
> -
>   		igt_require_pipe(&data->display, pipe);
>   		igt_require(data->display.pipes[pipe].n_planes > 0);
>   
> -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			valid_tests++;
> -
> -		igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
> +		igt_display_require_output(&data->display);
>   	}
>   
>   	igt_describe("Test atomic mode setting concurrently with multiple planes and screen "
> diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
> index 9c287480..80e8e45c 100644
> --- a/tests/kms_sequence.c
> +++ b/tests/kms_sequence.c
> @@ -76,7 +76,9 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
>   	drmModeModeInfo *mode;
>   	igt_display_t *display = &data->display;
>   	igt_plane_t *primary;
> -
> +	
> +	igt_display_reset(&data->display);
> +	
>   	/* select the pipe we want to use */
>   	igt_output_set_pipe(output, data->pipe);
>   
> @@ -109,8 +111,8 @@ static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   	igt_plane_set_fb(primary, NULL);
>   
> -	igt_output_set_pipe(output, PIPE_ANY);
> -	igt_display_commit(display);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   }
>   
>   static int crtc_get_sequence(int fd, struct drm_crtc_get_sequence *cgs)
