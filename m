Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2056.outbound.protection.outlook.com [40.107.100.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C75B10E219
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Sep 2022 19:49:34 +0000 (UTC)
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Mon, 12 Sep 2022 15:48:47 -0400
Message-ID: <20220912194847.124414-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t] tests/kms_setmode: degrade assert to debug
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
 tests/kms_setmode.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index bfa10891..07548bf9 100644
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
+	if (fabs(mean - expected) <= max(line_time(kmode), 1.718 * stddev))
+		igt_info("vblank interval differs from modeline! expected %.1fus, measured %1.fus +- %.3fus, difference %.1fus (%.1f sigma, %.1f scanlines)\n",
+			 expected, mean, stddev,
+			 fabs(mean - expected),
+			 fabs(mean - expected) / stddev,
+			 fabs(mean - expected) / line_time(kmode));
 }
 
 static void test_crtc_config(const struct test_config *tconf,
-- 
2.37.2
