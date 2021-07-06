Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5406E5B0
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jul 2021 21:17:09 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Wed,  7 Jul 2021 02:57:49 +0530
Message-Id: <20210706212749.27996-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_cdclk: Minor fix
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
List-ID: <igt-dev@lists.freedesktop.org>

Driver still works in a such way that we never reduce CDCLK, but always
only increase it. That was done in order to avoid continuous CDCLK switching,

So, in case if new CDCLK is 307200 and there is no change in CDCLK beacuse
of above stated driver optimization; pass the test else check lt condition.

Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_cdclk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/kms_cdclk.c b/tests/kms_cdclk.c
index d2a9fa5f..818cbfd5 100644
--- a/tests/kms_cdclk.c
+++ b/tests/kms_cdclk.c
@@ -31,6 +31,7 @@ IGT_TEST_DESCRIPTION("Test cdclk features : crawling");
 #define HDISPLAY_4K     3840
 #define VDISPLAY_4K     2160
 #define VREFRESH	60
+#define MAX_CDCLK_4K    307200
 
 /* Test flags */
 enum {
@@ -228,7 +229,8 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
 
 	/* cdclk should bump */
-	igt_assert_lt(cdclk_ref, cdclk_new);
+	if (cdclk_new != MAX_CDCLK_4K)
+		igt_assert_lt(cdclk_ref, cdclk_new);
 
 	/* cleanup */
 	do_cleanup_display(display);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
