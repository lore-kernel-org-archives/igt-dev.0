Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9130C6E95A
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Oct 2021 08:54:02 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Mon,  4 Oct 2021 14:26:29 +0530
Message-Id: <20211004085629.2796-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Add retry mechanism for
 async flip subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, Karthik B S <karthik.b.s@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Async flip subtests fail sporadically with CRC failure on CI.
This is expected as these tests are not run on highest priority by the
scheduler, but this creates noise on CI. Add retry mechanism to rerun
the test once if failure is seen.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/i915/kms_big_fb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index 308227c9..8c09f59e 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -481,6 +481,7 @@ max_hw_stride_async_flip_test(data_t *data)
 		       h = data->output->config.default_mode.vdisplay;
 	igt_plane_t *primary;
 	igt_crc_t compare_crc, async_crc;
+	bool retried = false;
 
 	igt_require(data->display.is_atomic);
 	igt_output_set_pipe(data->output, data->pipe);
@@ -513,6 +514,7 @@ max_hw_stride_async_flip_test(data_t *data)
 					  INTEL_PIPE_CRC_SOURCE_AUTO);
 	igt_pipe_crc_start(data->pipe_crc);
 
+retry:
 	igt_set_timeout(5, "Async pageflipping loop got stuck!\n");
 	for (int i = 0; i < 2; i++) {
 		igt_plane_set_fb(primary, &data->big_fb);
@@ -548,6 +550,13 @@ max_hw_stride_async_flip_test(data_t *data)
 		igt_assert_f(kmstest_get_vblank(data->drm_fd, data->pipe, 0) -
 			     startframe == 1, "lost frames\n");
 
+		/* Test is not running at real time priority, so allow one failure*/
+		if (!(igt_check_crc_equal(&compare_crc, &async_crc)^(i^1)) && !retried) {
+			retried = true;
+			igt_reset_timeout();
+			goto retry;
+		}
+
 		igt_assert_f(igt_check_crc_equal(&compare_crc, &async_crc)^(i^1),
 			     "CRC failure with async flip, crc %s match for checked round\n",
 			     i?"should":"shouldn't");
-- 
2.22.0
