Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E782C6E95E
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Feb 2021 13:21:19 +0000 (UTC)
From: Martin Peres <martin.peres@mupuf.org>
Date: Tue, 16 Feb 2021 14:32:36 +0200
Message-Id: <20210216123236.693768-2-martin.peres@mupuf.org>
In-Reply-To: <20210216123236.693768-1-martin.peres@mupuf.org>
References: <20210216123236.693768-1-martin.peres@mupuf.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] amdgpu/info: add a timestamp test
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

Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Signed-off-by: Martin Peres <martin.peres@mupuf.org>
---
 tests/amdgpu/amd_info.c | 81 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
index fe113e14..41f79dec 100644
--- a/tests/amdgpu/amd_info.c
+++ b/tests/amdgpu/amd_info.c
@@ -44,6 +44,84 @@ static void query_firmware_version_test(void)
 	igt_assert_eq(r, 0);
 }
 
+static float query_timestamp_test_sample(uint32_t sleep_time, int sample_count)
+{
+	struct amdgpu_gpu_info gpu_info = {};
+	float *samples, average_factor = 0.0, sum_factors = 0.0, ns_per_tick;
+	int i;
+
+	/* figure out how many nanoseconds each gpu timestamp tick represents */
+	igt_assert_eq(amdgpu_query_gpu_info(dev, &gpu_info), 0);
+	igt_assert_lt(0, gpu_info.gpu_counter_freq);
+	ns_per_tick = 1e9 / (gpu_info.gpu_counter_freq * 1000.0);
+
+	samples = calloc(sample_count, sizeof(float));
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
+		samples[i] = corrected_gpu_delta / cpu_delta;
+		sum_factors += samples[i];
+	}
+
+	/* check that all the samples are close to the average factor to detect
+	 * clock skews.
+	 */
+	average_factor = sum_factors / sample_count;
+	for (i = 0; i < sample_count; i++) {
+		float diff = average_factor - samples[i];
+		igt_assert_f(fabs(diff) < 0.01,
+			     "Sample %i/%i exceeded the 1%% deviance from "
+			     "average. Difference = %.2f%%\n", i, sample_count,
+			     diff * 100.0);
+	}
+
+	return average_factor;
+}
+
+static void query_timestamp_test(void)
+{
+	float factor_short, factor_long;
+
+	/* check a small time factor repeatedly to check for stability */
+	factor_short = query_timestamp_test_sample(100000, 10);
+
+	/* check that time elapses as fast on the CPU as on the GPU */
+	igt_assert_f(fabs(1.0 - factor_short) < 0.01,
+		     "The GPU time elapses at %.2f%% of the CPU's speed. "
+		     "Correction factor: x%.6f\n", factor_short * 100.0,
+		     1.0 / factor_short);
+
+	/* check that time also elapses at the same rate, after the GPU has been
+	 * idle for a while, as power gating may have stopped the clock.
+	 * Assuming a 5s power gating delay as a worst case scenario.
+	 */
+	factor_long = query_timestamp_test_sample(7000000, 1);
+	igt_assert_f(fabs(1.0 - factor_long) < 0.01,
+		     "The GPU clock stopped ticking while the GPU was idle\n");
+}
+
 igt_main
 {
 	int fd = -1;
@@ -64,6 +142,9 @@ igt_main
 	igt_subtest("query-firmware-version")
 		query_firmware_version_test();
 
+	igt_subtest("query-timestamp")
+		query_timestamp_test();
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
