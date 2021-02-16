Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9168989F47
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Feb 2021 13:32:17 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20210216123236.693768-2-martin.peres@mupuf.org>
References: <20210216123236.693768-1-martin.peres@mupuf.org>
 <20210216123236.693768-2-martin.peres@mupuf.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 16 Feb 2021 13:32:07 +0000
Message-ID: <161348232750.8311.14303746100737987495@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] amdgpu/info: add a timestamp test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, Martin Peres <martin.peres@mupuf.org>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Martin Peres (2021-02-16 12:32:36)
> This test makes sure:
> 
>  * the clock is running at the expected rate
>  * (potential) power gating has no effect on the clock
> 
> v2:
>  - use signed integer for the gpu timestamp diff (Bas)
> 
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Signed-off-by: Martin Peres <martin.peres@mupuf.org>
> ---
>  tests/amdgpu/amd_info.c | 81 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
> index fe113e14..41f79dec 100644
> --- a/tests/amdgpu/amd_info.c
> +++ b/tests/amdgpu/amd_info.c
> @@ -44,6 +44,84 @@ static void query_firmware_version_test(void)
>         igt_assert_eq(r, 0);
>  }
>  
> +static float query_timestamp_test_sample(uint32_t sleep_time, int sample_count)
> +{
> +       struct amdgpu_gpu_info gpu_info = {};
> +       float *samples, average_factor = 0.0, sum_factors = 0.0, ns_per_tick;
> +       int i;
> +
> +       /* figure out how many nanoseconds each gpu timestamp tick represents */
> +       igt_assert_eq(amdgpu_query_gpu_info(dev, &gpu_info), 0);
> +       igt_assert_lt(0, gpu_info.gpu_counter_freq);
> +       ns_per_tick = 1e9 / (gpu_info.gpu_counter_freq * 1000.0);
> +
> +       samples = calloc(sample_count, sizeof(float));
> +       for (i = 0; i < sample_count; i++) {
> +               uint64_t ts_start, ts_end, cpu_delta;
> +               int64_t gpu_delta;
> +               float corrected_gpu_delta;
> +               struct timespec ts_cpu;
> +               int r;
> +
> +               igt_assert_eq(igt_gettime(&ts_cpu), 0);
> +
> +               r = amdgpu_query_info(dev, AMDGPU_INFO_TIMESTAMP, 8, &ts_start);
> +               igt_assert_eq(r, 0);
> +
> +               usleep(sleep_time);
> +
> +               r = amdgpu_query_info(dev, AMDGPU_INFO_TIMESTAMP, 8, &ts_end);
> +               igt_assert_eq(r, 0);
> +
> +               /* get the GPU and CPU deltas */
> +               cpu_delta = igt_nsec_elapsed(&ts_cpu);
> +               gpu_delta = ts_end - ts_start;
> +               corrected_gpu_delta = gpu_delta * ns_per_tick;
> +
> +               /* make sure the GPU timestamps are ordered */
> +               igt_assert_lt_s64(0, gpu_delta);
> +
> +               samples[i] = corrected_gpu_delta / cpu_delta;
> +               sum_factors += samples[i];
> +       }
> +
> +       /* check that all the samples are close to the average factor to detect
> +        * clock skews.
> +        */
> +       average_factor = sum_factors / sample_count;
> +       for (i = 0; i < sample_count; i++) {
> +               float diff = average_factor - samples[i];
> +               igt_assert_f(fabs(diff) < 0.01,
> +                            "Sample %i/%i exceeded the 1%% deviance from "
> +                            "average. Difference = %.2f%%\n", i, sample_count,
> +                            diff * 100.0);

Interesting. If you use igt_stats, then look instead of looking at the
median you look at the range, that will give you the +- succinctly, as
well as the stddev and usual metrics.

So instead of samples, igt_stats_init_with_size(&stats, sample_count),
igt_stats_push_float(&stats, corrected_gpu_delta / gpu_delta).
(And don't forget the missing igt_stats_fini(&stats)).

This being a computer, I would not trust the absolute range for CI, but
would favour using a large number of samples (hoping for the
distribution to converge to Normal so 100+) and look at the iqr, median
vs mean, etc.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
