Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4349A10E229
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Dec 2022 08:29:55 +0000 (UTC)
Date: Wed, 14 Dec 2022 10:30:32 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Alex Hung <alex.hung@amd.com>
Message-ID: <Y5mJqL+CU9fFtiGl@platvala-desk.ger.corp.intel.com>
References: <20221213234332.364224-1-alex.hung@amd.com>
 <20221213234332.364224-2-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221213234332.364224-2-alex.hung@amd.com>
Subject: Re: [igt-dev] [PATCH 2/2] tests/kms_bw: Run tests on available
 pipes only
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Dec 13, 2022 at 04:43:32PM -0700, Alex Hung wrote:
> This cleans up unnecessary skips during executions.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/kms_bw.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index 27100587..ac801746 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -145,17 +145,9 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>  	igt_output_t *output;
>  	struct igt_fb buffer[IGT_MAX_PIPES];
>  	igt_crc_t zero, captured[IGT_MAX_PIPES];
> -	int i = 0, num_pipes = 0;
> -	enum pipe p;
> +	int i = 0;
>  	int ret;
>  
> -	/* Cannot use igt_display_get_n_pipes() due to fused pipes on i915 where they do
> -	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
> -	for_each_pipe(display, p) num_pipes++;
> -
> -	igt_skip_on_f(pipe > num_pipes,
> -                      "ASIC does not have %d pipes\n", pipe);
> -
>  	test_init(data);
>  
>  	/* create buffers */
> @@ -204,6 +196,7 @@ igt_main
>  {
>  	data_t data;
>  	int i = 0, j = 0;
> +	enum pipe p;
>  
>  	memset(&data, 0, sizeof(data));
>  
> @@ -219,14 +212,13 @@ igt_main
>  
>  	}
>  
> -	/* We're not using for_each_pipe_static because we need the
> -	 * _amount_ of pipes */
> -	for (i = 0; i < IGT_MAX_PIPES; i++) {
> +	for_each_pipe(&data.display, p) {
>  		for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
>  			igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
>  			      test_mode[j].name)
>  			run_test_linear_tiling(&data, i, &test_mode[j]);
>  		}
> +		i++;
>  	}


When enumerating tests with --list-subtests you don't have
data.display valid. As gitlab pipeline relay warned for this series.

What you can do is make this an igt_subtest_with_dynamic, and

igt_subtest_with_dynamic_f("linear-tiling-multiple-displays-%s", test_mode[j].name) {
  for_each_pipe(&data.display, p) {
    igt_dynamic_f("%d-displays", i+1) {
      run_test_linear_tiling(&data, i, &test_mode[j]);
    }
  }
}

However, even with that in place, using for_each_pipe sounds wrong. As
the comment says, this is using an _amount_ of pipes, not one
particular pipe.


-- 
Petri Latvala
