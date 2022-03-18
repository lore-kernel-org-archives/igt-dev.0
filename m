Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F2510E949
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Mar 2022 14:11:19 +0000 (UTC)
Message-ID: <a038123b-1f53-e358-323b-07748981e0a5@intel.com>
Date: Fri, 18 Mar 2022 19:41:02 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220316061617.30842-1-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220316061617.30842-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6] IGT cleanup
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

On Wed-16-03-2022 11:46 am, Nidhi Gupta wrote:
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
> ---
>   tests/kms_concurrent.c | 37 +++++++++++++++++--------------------
>   tests/kms_sequence.c   | 11 +++++++----
>   2 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 1b8f4b04..6428c60d 100644
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
> @@ -278,35 +279,30 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
>   static void
>   run_test(data_t *data, enum pipe pipe, igt_output_t *output)
>   {
> -	int connected_outs;
> -	int n_planes = data->display.pipes[pipe].n_planes;
> +	int n_planes;
Why do we need this change? will igt_display_reset() clear this data?

> +
> +	igt_display_reset(&data->display);
> +	n_planes = data->display.pipes[pipe].n_planes;
>   
>   	if (!opt.user_seed)
>   		opt.seed = time(NULL);
>   
> -	connected_outs = 0;
> -	for_each_valid_output_on_pipe(&data->display, pipe, output) {
> -		igt_info("Testing resolution with connector %s using pipe %s with seed %d\n",
> -			 igt_output_name(output), kmstest_pipe_name(pipe), opt.seed);
> -
> -		srand(opt.seed);
> -
> -		test_init(data, pipe, n_planes, output);
> +	igt_info("Testing resolution with connector %s using pipe %s with seed %d\n",
> +		 igt_output_name(output), kmstest_pipe_name(pipe), opt.seed);
>   
> -		igt_fork(child, 1) {
> -			test_plane_position_with_output(data, pipe, n_planes, output);
> -		}
> +	srand(opt.seed);
>   
> -		test_resolution_with_output(data, pipe, n_planes, output);
> +	test_init(data, pipe, n_planes, output);
>   
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
> @@ -316,6 +312,7 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
>   
>   	igt_fixture {
>   		int valid_tests = 0;
> +		igt_display_reset(&data->display);
Reset is not required here, also we need to use 
igt_display_require_output() instead of having valid_tests variable.

Also, can we have a new patch to convert kms_concurrent to dynamic subtests?

>   
>   		igt_require_pipe(&data->display, pipe);
>   		igt_require(data->display.pipes[pipe].n_planes > 0);
> diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
> index 9c287480..569ea1d9 100644
> --- a/tests/kms_sequence.c
> +++ b/tests/kms_sequence.c
> @@ -74,9 +74,12 @@ static double elapsed(const struct timespec *start,
>   static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
>   {
>   	drmModeModeInfo *mode;
> -	igt_display_t *display = &data->display;
>   	igt_plane_t *primary;
> -
> +	igt_display_t *display;
Why this change?

> +	
> +	igt_display_reset(&data->display);
> +	display = &data->display;
> +	
>   	/* select the pipe we want to use */
>   	igt_output_set_pipe(output, data->pipe);
>   
> @@ -109,8 +112,8 @@ static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
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

Also, can we have a new patch to convert kms_sequence to dynamic subtests?

- Bhanu
