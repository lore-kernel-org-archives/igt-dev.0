Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406266E0CE
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2020 10:44:46 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue, 12 May 2020 16:04:15 +0530
Message-Id: <20200512103415.28968-7-anshuman.gupta@intel.com>
In-Reply-To: <20200512103415.28968-1-anshuman.gupta@intel.com>
References: <20200512103415.28968-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v8 6/6] tests/i915_pm_rpm: Fix the
 universal-plane cap setting in plane tests
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
Cc: martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Imre Deak <imre.deak@intel.com>

The current value of the universal-plane capability is 1 if
igt_display_require() has been called, so make sure we always set the
value expected by the test and restore the correct original value.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 650de7b0..0a641640 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1786,18 +1786,15 @@ static void test_one_plane(bool dpms, uint32_t plane_id,
 /* This one also triggered WARNs on our driver at some point in time. */
 static void planes_subtest(bool universal, bool dpms)
 {
-	int i, rc, crtc_idx;
+	int i, planes_tested = 0, crtc_idx;
 	drmModePlaneResPtr planes;
 
 	igt_require(default_mode_params);
 	crtc_idx = kmstest_get_crtc_idx(ms_data.res,
 					default_mode_params->crtc_id);
 
-	if (universal) {
-		rc = drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES,
-				     1);
-		igt_require(rc == 0);
-	}
+	igt_assert_eq(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES,
+				      universal), 0);
 
 	planes = drmModeGetPlaneResources(drm_fd);
 	for (i = 0; i < planes->count_planes; i++) {
@@ -1818,10 +1815,9 @@ static void planes_subtest(bool universal, bool dpms)
 	}
 	drmModeFreePlaneResources(planes);
 
-	if (universal) {
-		rc = drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
-		igt_assert_eq(rc, 0);
-	}
+	igt_assert_eq(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES,
+				      1), 0);
+	igt_assert_lte(universal ? 3 : 1, planes_tested);
 }
 
 static void pm_test_tiling(void)
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
