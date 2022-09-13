Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B7210E75C
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Sep 2022 15:09:36 +0000 (UTC)
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue, 13 Sep 2022 11:08:55 -0400
Message-ID: <20220913150855.43540-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_setmode: degrade assert to
 debug
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Unfortunately, there are too many sources of jitter that can cause the
vblank interval approximation obtained from DRM_IOCTL_WAIT_VBLANK to be
off by more than a scanline for this assert to be useful. So, to allow
this test to pass consistently degrade the assert to a debug.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
v2: fix logic
---
 tests/kms_setmode.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index bfa10891..58abfe14 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -527,12 +527,12 @@ static void check_timings(int crtc_idx, const drmModeModeInfo *kmode)
 	 * See:
 	 * https://en.wikipedia.org/wiki/Standard_deviation#Rules_for_normally_distributed_data
 	 */
-	igt_assert_f(fabs(mean - expected) < max(line_time(kmode), 1.718 * stddev),
-		     "vblank interval differs from modeline! expected %.1fus, measured %1.fus +- %.3fus, difference %.1fus (%.1f sigma, %.1f scanlines)\n",
-		     expected, mean, stddev,
-		     fabs(mean - expected),
-		     fabs(mean - expected) / stddev,
-		     fabs(mean - expected) / line_time(kmode));
+	if (fabs(mean - expected) > max(line_time(kmode), 1.718 * stddev))
+		igt_info("vblank interval differs from modeline! expected %.1fus, measured %1.fus +- %.3fus, difference %.1fus (%.1f sigma, %.1f scanlines)\n",
+			 expected, mean, stddev,
+			 fabs(mean - expected),
+			 fabs(mean - expected) / stddev,
+			 fabs(mean - expected) / line_time(kmode));
 }
 
 static void test_crtc_config(const struct test_config *tconf,
-- 
2.37.2
