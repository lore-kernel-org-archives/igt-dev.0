Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738646E357
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2020 08:10:57 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 22 Apr 2020 09:10:11 +0100
Message-Id: <20200422081011.3523086-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/i915_pm_rpm: Split the planes into
 dynamic subtests
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
Cc: Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Use the dynamic subtests to allow the user to individually run the
per-plane rpm tests.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 tests/i915/i915_pm_rpm.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 4f8124dc4..2521ae0dc 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1803,7 +1803,8 @@ static void planes_subtest(bool universal, bool dpms)
 
 			type = universal ? get_plane_type(plane->plane_id) :
 					   PLANE_OVERLAY;
-			test_one_plane(dpms, plane->plane_id, type);
+			igt_dynamic_f("plane-%d\n", plane->plane_id)
+				test_one_plane(dpms, plane->plane_id, type);
 			planes_tested++;
 		}
 		drmModeFreePlane(plane);
@@ -2062,13 +2063,13 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		cursor_subtest(false);
 	igt_subtest("cursor-dpms")
 		cursor_subtest(true);
-	igt_subtest("legacy-planes")
+	igt_subtest_with_dynamic("legacy-planes")
 		planes_subtest(false, false);
-	igt_subtest("legacy-planes-dpms")
+	igt_subtest_with_dynamic("legacy-planes-dpms")
 		planes_subtest(false, true);
-	igt_subtest("universal-planes")
+	igt_subtest_with_dynamic("universal-planes")
 		planes_subtest(true, false);
-	igt_subtest("universal-planes-dpms")
+	igt_subtest_with_dynamic("universal-planes-dpms")
 		planes_subtest(true, true);
 
 	/* Misc */
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
