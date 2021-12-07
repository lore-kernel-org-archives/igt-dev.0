Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F719EB8C9
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Dec 2021 15:42:29 +0000 (UTC)
Date: Tue, 7 Dec 2021 17:41:39 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <Ya+Asyu9/3mIwQtn@platvala-desk.ger.corp.intel.com>
References: <20211203195825.3553293-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203195825.3553293-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH] tests/kms_flip: Do not check for timestamp or
 sequences on Mediatek
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, igt-dev@lists.freedesktop.org, tzungbi@google.com, seanpaul@chromium.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Dec 03, 2021 at 02:58:24PM -0500, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> Mediatek devices have a HW issue with sending their vblank IRQ at the same time interval
> everytime. The drift can be below or above the expected frame time, causing the
> timestamp to drift with a relatively larger standard deviation over a large sample.
> 
> [How]
> Filter out the flags TEST_CHECK_TS and TEST_VBLANK_EXPIRED_SEQ from the
> tests flags, and restrict sequence and ts checks.
> 
> Tested on Jacuzzi (MT8183)
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  lib/drmtest.c    |  5 +++++
>  lib/drmtest.h    |  1 +
>  tests/kms_flip.c | 44 ++++++++++++++++++++++++++++++++------------
>  3 files changed, 38 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 29cb3f4c..09a9a229 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -114,6 +114,11 @@ bool is_i915_device(int fd)
>  	return __is_device(fd, "i915");
>  }
>  
> +bool is_mtk_device(int fd)
> +{
> +	return __is_device(fd, "mediatek");
> +}
> +
>  bool is_msm_device(int fd)
>  {
>  	return __is_device(fd, "msm");
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index a6eb60c3..b5debd44 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -103,6 +103,7 @@ void igt_require_vc4(int fd);
>  
>  bool is_amdgpu_device(int fd);
>  bool is_i915_device(int fd);
> +bool is_mtk_device(int fd);
>  bool is_msm_device(int fd);
>  bool is_nouveau_device(int fd);
>  bool is_vc4_device(int fd);
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index ccb085da..56addab8 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -129,6 +129,15 @@ struct event_state {
>  	int seq_step;
>  };
>  
> +static bool should_skip_ts_checks() {
> +	/* Mediatek devices have a HW issue with sending their vblank IRQ at the same time interval
> +	 * everytime. The drift can be below or above the expected frame time, causing the
> +	 * timestamp to drift with a relatively larger standard deviation over a large sample.
> +	 * As it's a known issue, skip any Timestamp or Sequence checks for MTK drivers.
> +	 */
> +	return is_mtk_device(drm_fd);
> +}
> +
>  static bool vblank_dependence(int flags)
>  {
>  	int vblank_flags = TEST_VBLANK | TEST_VBLANK_BLOCK |
> @@ -761,16 +770,19 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
>  		start = gettime_us();
>  		igt_assert(__wait_for_vblank(TEST_VBLANK_BLOCK, o->pipe, 2, 0, &reply) == 0);
>  		end = gettime_us();
> -		/*
> -		 * we waited for two vblanks, so verify that
> -		 * we were blocked for ~1-2 frames. And due
> -		 * to scheduling latencies we give it an extra
> -		 * half a frame or so.
> -		 */
> -		igt_assert_f(end - start > 0.9 * actual_frame_time(o) &&
> -			     end - start < 2.6 * actual_frame_time(o),
> -			     "wait for two vblanks took %lu usec (frame time %f usec)\n",
> -			     end - start, mode_frame_time(o));
> +
> +		if (!should_skip_ts_checks()) {
> +			/*
> +			 * we waited for two vblanks, so verify that
> +			 * we were blocked for ~1-2 frames. And due
> +			 * to scheduling latencies we give it an extra
> +			 * half a frame or so.
> +			 */
> +			igt_assert_f(end - start > 0.9 * actual_frame_time(o) &&
> +							 end - start < 2.6 * actual_frame_time(o),
> +						 "wait for two vblanks took %lu usec (frame time %f usec)\n",
> +						 end - start, mode_frame_time(o));
> +		}
>  		join_vblank_wait_thread();
>  	}
>  
> @@ -1228,8 +1240,10 @@ static bool calibrate_ts(struct test_output *o, int crtc_idx)
>  
>  	igt_info("Expected frametime: %.0fus; measured %.1fus +- %.3fus accuracy %.2f%%\n",
>  		 expected, mean, stddev, 100 * 3 * stddev / mean);
> -	/* 99.7% samples within 0.5% of the mean */
> -	igt_assert(3 * stddev / mean < 0.005);
> +	if (!should_skip_ts_checks())
> +		/* 99.7% samples within 0.5% of the mean */
> +		igt_assert(3 * stddev / mean < 0.005);

Put that igt_info above into the if block as well, it's useless if
it's not checked, right?


> +
>  	/* 84% samples within 0.5% of the expected value.
>  	 * See comments in check_timings() in kms_setmode.c
>  	 */
> @@ -1723,6 +1737,12 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  		if (is_i915_device(drm_fd)) {
>  			bops = buf_ops_create(drm_fd);
>  		}
> +
> +		if (should_skip_ts_checks()) {
> +			igt_info("Skipping timestamp checks\n");
> +			for (i = 0; i < sizeof(tests) / sizeof(tests[0]); i++)
> +				tests[i].flags &= ~(TEST_CHECK_TS | TEST_VBLANK_EXPIRED_SEQ);
> +		}
>  	}
>

Tentatively, this is
Reviewed-by: Petri Latvala <petri.latvala@intel.com>

With those asserts removed, is there still enough left for mtk devices
that running the tests have some merit?


-- 
Petri Latvala
