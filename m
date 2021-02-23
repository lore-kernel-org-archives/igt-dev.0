Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89D289FAD
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Feb 2021 08:23:49 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Tue, 23 Feb 2021 14:02:59 +0530
Message-Id: <20210223083259.32367-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_frontbuffer_tracking:modified
 subtest name
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
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Some platforms do not have support for mappable GTT, for those platforms
subtests with draw method as mmap-gtt will be skipped, added mmap-gtt in
the end of the subtests name which uses it as a draw method so that filtering
of those subtests as expected skip will be easier while assessing results.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_frontbuffer_tracking.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tracking.c
index 14f522d8..2e74bec6 100644
--- a/tests/kms_frontbuffer_tracking.c
+++ b/tests/kms_frontbuffer_tracking.c
@@ -3411,10 +3411,11 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		    (t.feature & FEATURE_FBC) == 0)
 			continue;
 
-		igt_subtest_f("%s-%s-%s-fliptrack",
+		igt_subtest_f("%s-%s-%s-fliptrack-%s",
 			      feature_str(t.feature),
 			      pipes_str(t.pipes),
-			      fbs_str(t.fbs))
+			      fbs_str(t.fbs),
+			      igt_draw_get_method_name(t.method))
 			fliptrack_subtest(&t, FLIP_PAGEFLIP);
 	TEST_MODE_ITER_END
 
@@ -3479,7 +3480,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		    t.method != IGT_DRAW_MMAP_GTT)
 			continue;
 
-		igt_subtest_f("%s-farfromfence", feature_str(t.feature))
+		igt_subtest_f("%s-farfromfence-%s",
+			      feature_str(t.feature),
+			      igt_draw_get_method_name(t.method))
 			farfromfence_subtest(&t);
 	TEST_MODE_ITER_END
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
