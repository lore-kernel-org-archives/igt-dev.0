Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CEE6E433
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Feb 2021 12:55:45 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id o7so1365357ils.2
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Feb 2021 04:55:45 -0800 (PST)
MIME-Version: 1.0
References: <20210217121812.103903-1-martin.peres@mupuf.org>
 <20210217121812.103903-3-martin.peres@mupuf.org>
In-Reply-To: <20210217121812.103903-3-martin.peres@mupuf.org>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Thu, 18 Feb 2021 13:56:17 +0100
Message-ID: <CAP+8YyHTEi9SNqZPQ_nPHNzKp5zqXTL0pviCNduDC=cbgrgTXA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 3/3] amdgpu/info: add
 timestamp-related tests
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
To: Martin Peres <martin.peres@mupuf.org>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

`Reviewed-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>` for the
series. Thanks!

On Wed, Feb 17, 2021 at 1:18 PM Martin Peres <martin.peres@mupuf.org> wrote:
>
> This test makes sure:
>
>  * the clock is running at the expected rate
>  * (potential) power gating has no effect on the clock
>
> v2:
>  - use signed integer for the gpu timestamp diff (Bas)
>
> v3:
>  - add test and subtest descriptions (Arek)
>  - split the fast and long tests in different subtests (Martin)
>  - use igt_stats to compute actual statistics (Chris)
>
> v4:
>  - call igt_stats_fini() after finishing with the stats (Petri)
>
> v5:
>  - add a human-readable text to asserts (Petri)
>  - assert directly on the function call, not its return value (Petri)
>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Signed-off-by: Martin Peres <martin.peres@mupuf.org>
> ---
>  tests/amdgpu/amd_info.c | 86 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>
> diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
> index b8f61e16..d6aea827 100644
> --- a/tests/amdgpu/amd_info.c
> +++ b/tests/amdgpu/amd_info.c
> @@ -43,6 +43,82 @@ static void query_firmware_version_test(void)
>                      "Failed to query the firmware version\n");
>  }
>
> +static void query_timestamp_test(uint32_t sleep_time, int sample_count)
> +{
> +       struct amdgpu_gpu_info gpu_info = {};
> +       double median, std_err, err_95_conf;
> +       igt_stats_t stats;
> +       float ns_per_tick;
> +       int i;
> +
> +       igt_stats_init_with_size(&stats, sample_count);
> +
> +       /* figure out how many nanoseconds each gpu timestamp tick represents */
> +       igt_assert_f(amdgpu_query_gpu_info(dev, &gpu_info) == 0,
> +                    "Failed to query the gpu information\n");
> +       igt_assert_f(gpu_info.gpu_counter_freq > 0,
> +                    "The GPU counter frequency cannot be undefined\n");
> +       ns_per_tick = 1e9 / (gpu_info.gpu_counter_freq * 1000.0);
> +
> +       /* acquire the data needed for the analysis */
> +       for (i = 0; i < sample_count; i++) {
> +               uint64_t ts_start, ts_end, cpu_delta;
> +               int64_t gpu_delta;
> +               float corrected_gpu_delta;
> +               struct timespec ts_cpu;
> +
> +               igt_assert_f(igt_gettime(&ts_cpu) == 0,
> +                            "Failed to read the CPU-provided time");
> +
> +               igt_assert_f(amdgpu_query_info(dev, AMDGPU_INFO_TIMESTAMP, 8,
> +                                              &ts_start) == 0,
> +                            "Failed to query the GPU start timestamp\n");
> +
> +               usleep(sleep_time);
> +
> +               igt_assert_f(amdgpu_query_info(dev, AMDGPU_INFO_TIMESTAMP, 8,
> +                                              &ts_end) == 0,
> +                            "Failed to query the GPU end timestamp\n");
> +
> +               /* get the GPU and CPU deltas */
> +               cpu_delta = igt_nsec_elapsed(&ts_cpu);
> +               gpu_delta = ts_end - ts_start;
> +               corrected_gpu_delta = gpu_delta * ns_per_tick;
> +
> +               /* make sure the GPU timestamps are ordered */
> +               igt_assert_f(gpu_delta > 0,
> +                            "The GPU time is not moving or is ticking in the "
> +                            "wrong direction (start=%lu, end=%lu, "
> +                            "end-start=%lu)\n", ts_start, ts_end, gpu_delta);
> +
> +               igt_stats_push_float(&stats, corrected_gpu_delta / cpu_delta);
> +       }
> +
> +       /* generate the statistics */
> +       median = igt_stats_get_median(&stats);
> +       std_err = igt_stats_get_std_error(&stats);
> +       err_95_conf = std_err * 1.96;
> +
> +       /* check that the median ticking rate is ~1.0, meaning that the
> +        * the GPU and CPU timestamps grow at the same rate
> +        */
> +       igt_assert_f(median > 0.99 && median < 1.01,
> +                    "The GPU time elapses at %.2f%% (+/- %.2f%% at 95%% "
> +                    "confidence) of the CPU's speed\ngpu_counter_freq=%u kHz, "
> +                    "should be %.0f kHz (+/- %.1f kHz at 95%% confidence)\n",
> +                    median * 100.0, err_95_conf * 100.0,
> +                    gpu_info.gpu_counter_freq,
> +                    gpu_info.gpu_counter_freq * median,
> +                    gpu_info.gpu_counter_freq * err_95_conf);
> +
> +       /* check the jitter in the ticking rate */
> +       igt_assert_f(err_95_conf < 0.01,
> +                    "The GPU time ticks with a jitter greater than 1%%, at "
> +                    "95%% confidence (+/- %.3f%%)\n", err_95_conf * 100.0);
> +
> +       igt_stats_fini(&stats);
> +}
> +
>  IGT_TEST_DESCRIPTION("Test the consistency of the data provided through the "
>                      "DRM_AMDGPU_INFO IOCTL");
>  igt_main
> @@ -66,6 +142,16 @@ igt_main
>         igt_subtest("query-firmware-version")
>                 query_firmware_version_test();
>
> +       igt_describe("Check that the GPU time ticks constantly, and at the "
> +                    "same rate as the CPU");
> +       igt_subtest("query-timestamp")
> +               query_timestamp_test(10000, 100);
> +
> +       igt_describe("Check that the GPU time keeps on ticking, even during "
> +                    "long idle times which could lead to clock/power gating");
> +       igt_subtest("query-timestamp-while-idle")
> +               query_timestamp_test(7000000, 1);
> +
>         igt_fixture {
>                 amdgpu_device_deinitialize(dev);
>                 close(fd);
> --
> 2.30.1
>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
