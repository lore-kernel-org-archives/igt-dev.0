Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64FA10E3CB
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 06:58:17 +0000 (UTC)
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 21 Jun 2023 14:57:29 +0800
Message-ID: <20230621065733.840316-4-chiahsuan.chung@amd.com>
In-Reply-To: <20230621065733.840316-1-chiahsuan.chung@amd.com>
References: <20230621065733.840316-1-chiahsuan.chung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 4/8] tests/amdgpu/amd_freesync_video_mode:
 Add some code from kms_vrr to resolve tearing issue
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tom Chung <chiahsuan.chung@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[Why]
There is a tearing video issue during the stage-2 animation test.

[How]
1. Refer to the kms_vrr IGT code, it needs some delay before the the next flip and
   add some warmup time before do the flip and measure to make the test more accurate.
2. Change the target refresh rate percentage to 75% to align with the kms_vrr test.

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 tests/amdgpu/amd_freesync_video_mode.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index a7b10886d..073f91084 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -26,7 +26,7 @@
 #include <signal.h>
 
 #define NSECS_PER_SEC (1000000000ull)
-#define TEST_DURATION_NS (10 * NSECS_PER_SEC)
+#define TEST_DURATION_NS (8 * NSECS_PER_SEC)
 
 #define BYTES_PER_PIXEL 4
 #define MK_COLOR(r, g, b) ((0 << 24) | (r << 16) | (g << 8) | b)
@@ -640,7 +640,7 @@ flip_and_measure(
 	igt_info("interval_ns=%lu\n", interval_ns);
 
 	for (;;) {
-		uint64_t event_ns;
+		uint64_t event_ns, wait_ns;
 		int64_t diff_ns;
 
 		data->front = !data->front;
@@ -675,6 +675,18 @@ flip_and_measure(
 
 		if (event_ns - start_ns > duration_ns)
 			break;
+
+		/*
+		 * Burn CPU until next timestamp, sleeping isn't accurate enough.
+		 * The target timestamp is based on the delta b/w event timestamps
+		 * and whatever the time left to reach the expected refresh rate.
+		 */
+		diff_ns = event_ns - target_ns;
+		wait_ns = ((diff_ns + interval_ns - 1) / interval_ns) * interval_ns;
+		wait_ns -= diff_ns;
+		target_ns = event_ns + wait_ns;
+
+		while (get_time_ns() < target_ns - 10);
 	}
 
 	igt_info("Completed %u flips, %u were in threshold for (%llu Hz) %"PRIu64"ns.\n",
@@ -807,9 +819,10 @@ mode_transition(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t sce
 	igt_info("stage-2: simple animation as video playback\n");
 	prepare_test(data, output, pipe, mode_playback);
 	interval = nsec_per_frame(mode_playback->vrefresh) ;
+	/* Do a short run with VRR before measure to make sure we measure in a stable state */
+	result = flip_and_measure(data, output, pipe, interval, 2 * NSECS_PER_SEC, ANIM_TYPE_CIRCLE_WAVE);
 	result = flip_and_measure(data, output, pipe, interval, TEST_DURATION_NS, ANIM_TYPE_CIRCLE_WAVE);
-	igt_assert_f(result > 90, "Target refresh rate not meet(result=%d%%\n", result);
-
+	igt_assert_f(result > 75, "Target refresh rate not meet 75%% (result=%d%%\n", result);
 	finish_test(data, pipe, output);
 }
 
-- 
2.34.1
