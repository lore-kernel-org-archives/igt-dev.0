Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEBD6E985
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Feb 2021 20:26:13 +0000 (UTC)
From: Martin Peres <martin.peres@mupuf.org>
Date: Tue, 16 Feb 2021 22:25:57 +0200
Message-Id: <20210216202557.878778-2-martin.peres@mupuf.org>
In-Reply-To: <20210216202557.878778-1-martin.peres@mupuf.org>
References: <20210216202557.878778-1-martin.peres@mupuf.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 2/2] amdgpu/info: add timestamp-related
 tests
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
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
List-ID: <igt-dev@lists.freedesktop.org>

This test makes sure:

 * the clock is running at the expected rate
 * (potential) power gating has no effect on the clock

v2:
 - use signed integer for the gpu timestamp diff (Bas)

v3:
 - add test and subtest descriptions (Arek)
 - split the fast and long tests in different subtests (Martin)
 - use igt_stats to compute actual statistics (Chris)

v4:
 - call igt_stats_fini() after finishing with the stats (Petri)

Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Signed-off-by: Martin Peres <martin.peres@mupuf.org>
---
 tests/amdgpu/amd_info.c | 79 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
index 6764e640..e3b1eac1 100644
--- a/tests/amdgpu/amd_info.c
+++ b/tests/amdgpu/amd_info.c
@@ -44,6 +44,75 @@ static void query_firmware_version_test(void)
 	igt_assert_eq(r, 0);
 }
 
+static void query_timestamp_test(uint32_t sleep_time, int sample_count)
+{
+	struct amdgpu_gpu_info gpu_info = {};
+	double median, std_err, err_95_conf;
+	igt_stats_t stats;
+	float ns_per_tick;
+	int i;
+
+	igt_stats_init_with_size(&stats, sample_count);
+
+	/* figure out how many nanoseconds each gpu timestamp tick represents */
+	igt_assert_eq(amdgpu_query_gpu_info(dev, &gpu_info), 0);
+	igt_assert_lt(0, gpu_info.gpu_counter_freq);
+	ns_per_tick = 1e9 / (gpu_info.gpu_counter_freq * 1000.0);
+
+	/* acquire the data needed for the analysis */
+	for (i = 0; i < sample_count; i++) {
+		uint64_t ts_start, ts_end, cpu_delta;
+		int64_t gpu_delta;
+		float corrected_gpu_delta;
+		struct timespec ts_cpu;
+		int r;
+
+		igt_assert_eq(igt_gettime(&ts_cpu), 0);
+
+		r = amdgpu_query_info(dev, AMDGPU_INFO_TIMESTAMP, 8, &ts_start);
+		igt_assert_eq(r, 0);
+
+		usleep(sleep_time);
+
+		r = amdgpu_query_info(dev, AMDGPU_INFO_TIMESTAMP, 8, &ts_end);
+		igt_assert_eq(r, 0);
+
+		/* get the GPU and CPU deltas */
+		cpu_delta = igt_nsec_elapsed(&ts_cpu);
+		gpu_delta = ts_end - ts_start;
+		corrected_gpu_delta = gpu_delta * ns_per_tick;
+
+		/* make sure the GPU timestamps are ordered */
+		igt_assert_lt_s64(0, gpu_delta);
+
+		igt_stats_push_float(&stats, corrected_gpu_delta / cpu_delta);
+	}
+
+	/* generate the statistics */
+	median = igt_stats_get_median(&stats);
+	std_err = igt_stats_get_std_error(&stats);
+	err_95_conf = std_err * 1.96;
+
+	/* check that the median ticking rate is ~1.0, meaning that the
+	 * the GPU and CPU timestamps grow at the same rate
+	 */
+	igt_assert_f(median > 0.99 && median < 1.01,
+		     "The GPU time elapses at %.2f%% (+/- %.2f%% at 95%% "
+		     "confidence) of the CPU's speed\ngpu_counter_freq=%u kHz, "
+		     "should be %.0f kHz (+/- %.1f kHz at 95%% confidence)\n",
+		     median * 100.0, err_95_conf * 100.0,
+		     gpu_info.gpu_counter_freq,
+		     gpu_info.gpu_counter_freq * median,
+		     gpu_info.gpu_counter_freq * err_95_conf);
+
+	/* check the jitter in the ticking rate */
+	igt_assert_f(err_95_conf < 0.01,
+		     "The GPU time ticks with a jitter greater than 1%%, at "
+		     "95%% confidence (+/- %.3f%%)\n", err_95_conf * 100.0);
+
+	igt_stats_fini(&stats);
+}
+
 IGT_TEST_DESCRIPTION("Test the consistency of the data provided through the "
 		     "DRM_AMDGPU_INFO IOCTL");
 igt_main
@@ -67,6 +136,16 @@ igt_main
 	igt_subtest("query-firmware-version")
 		query_firmware_version_test();
 
+	igt_describe("Check that the GPU time ticks constantly, and at the "
+		     "same rate as the CPU");
+	igt_subtest("query-timestamp")
+		query_timestamp_test(10000, 100);
+
+	igt_describe("Check that the GPU time keeps on ticking, even during "
+		     "long idle times which could lead to clock/power gating");
+	igt_subtest("query-timestamp-while-idle")
+		query_timestamp_test(7000000, 1);
+
 	igt_fixture {
 		amdgpu_device_deinitialize(dev);
 		close(fd);
-- 
2.30.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
