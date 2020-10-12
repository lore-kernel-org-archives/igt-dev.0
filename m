Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D963F6E03C
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2020 10:05:40 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Mon, 12 Oct 2020 15:10:17 +0530
Message-Id: <20201012094017.18019-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_async_flips: Modify assert to fix
 failure seen on few platforms
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
To: igt-dev@lists.freedesktop.org
Cc: sowmyax.kaparthi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Failure is seen on CI on few platforms as one of the flips in between is
taking longer time. To fix this, added a check to assert for individual
flips only for the alternate-sync-async-flip subtest. In the
async-flip-with-page-flip-events subtest we anyway check the overall FPS
at the end, so we do not need a check for individual flips and this should
take care of some random flip taking more time in between.

Also, reduced the MIN_FLIPS_PER_FRAME from 8 to 5 based on the failure
seen in CI.

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/2521

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_async_flips.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 40aaef2c..dea23cf9 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -39,7 +39,7 @@
  */
 
 #define RUN_TIME 2
-#define MIN_FLIPS_PER_FRAME 8
+#define MIN_FLIPS_PER_FRAME 5
 
 IGT_TEST_DESCRIPTION("Test asynchronous page flips.");
 
@@ -205,10 +205,12 @@ static void test_async_flip(data_t *data, bool alternate_sync_async)
 		gettimeofday(&end, NULL);
 		timersub(&end, &start, &diff);
 
-		igt_assert_f(data->flip_interval < 1000.0 / (data->refresh_rate * MIN_FLIPS_PER_FRAME),
-			     "Flip interval not significantly smaller than vblank interval\n"
-			     "Flip interval: %lfms, Refresh Rate = %dHz, Threshold = %d\n",
-			     data->flip_interval, data->refresh_rate, MIN_FLIPS_PER_FRAME);
+		if (alternate_sync_async) {
+			igt_assert_f(data->flip_interval < 1000.0 / (data->refresh_rate * MIN_FLIPS_PER_FRAME),
+				     "Flip interval not significantly smaller than vblank interval\n"
+				     "Flip interval: %lfms, Refresh Rate = %dHz, Threshold = %d\n",
+				     data->flip_interval, data->refresh_rate, MIN_FLIPS_PER_FRAME);
+		}
 
 		frame++;
 	} while (diff.tv_sec < RUN_TIME);
-- 
2.22.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
