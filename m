Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0666E357
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2020 08:13:07 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 22 Apr 2020 09:12:58 +0100
Message-Id: <20200422081258.3542431-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200422081011.3523086-1-chris@chris-wilson.co.uk>
References: <20200422081011.3523086-1-chris@chris-wilson.co.uk>
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
 tests/i915/i915_pm_rpm.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 4f8124dc4..a34e78b6b 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1778,7 +1778,7 @@ static void test_one_plane(bool dpms, uint32_t plane_id,
 /* This one also triggered WARNs on our driver at some point in time. */
 static void planes_subtest(bool universal, bool dpms)
 {
-	int i, rc, planes_tested = 0, crtc_idx;
+	int i, rc, crtc_idx;
 	drmModePlaneResPtr planes;
 
 	igt_require(default_mode_params);
@@ -1803,8 +1803,8 @@ static void planes_subtest(bool universal, bool dpms)
 
 			type = universal ? get_plane_type(plane->plane_id) :
 					   PLANE_OVERLAY;
-			test_one_plane(dpms, plane->plane_id, type);
-			planes_tested++;
+			igt_dynamic_f("plane-%d\n", plane->plane_id)
+				test_one_plane(dpms, plane->plane_id, type);
 		}
 		drmModeFreePlane(plane);
 	}
@@ -1813,10 +1813,6 @@ static void planes_subtest(bool universal, bool dpms)
 	if (universal) {
 		rc = drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
 		igt_assert_eq(rc, 0);
-
-		igt_assert_lte(3, planes_tested);
-	} else {
-		igt_assert_lte(1, planes_tested);
 	}
 }
 
@@ -2062,13 +2058,13 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
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
