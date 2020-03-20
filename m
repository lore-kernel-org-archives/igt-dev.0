Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA54B6EB71
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2020 22:45:10 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Fri, 20 Mar 2020 15:46:21 -0700
Message-Id: <20200320224621.55102-7-jose.souza@intel.com>
In-Reply-To: <20200320224621.55102-1-jose.souza@intel.com>
References: <20200320224621.55102-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 7/7] DO_NOT_MERGE: Revert
 "tests/kms_fbcon_fbt: Handle FBC enabled on fbcon in GEN9+"
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

Reverting this one as the kernel patches did not landed yet so it would
cause CI to fail.

This reverts commit cfacb381895eb7fdcac4bbbcd13c92fe1a9e62dc.
---
 tests/kms_fbcon_fbt.c | 42 ++++++++++++++----------------------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
index db06d293..f50f8b2f 100644
--- a/tests/kms_fbcon_fbt.c
+++ b/tests/kms_fbcon_fbt.c
@@ -42,7 +42,6 @@ struct drm_info {
 	int debugfs_fd;
 	drmModeResPtr res;
 	drmModeConnectorPtr connectors[MAX_CONNECTORS];
-	int devid;
 };
 
 static void wait_user(const char *msg)
@@ -68,8 +67,6 @@ static void setup_drm(struct drm_info *drm)
 		drm->connectors[i] = drmModeGetConnectorCurrent(drm->fd,
 						drm->res->connectors[i]);
 
-	drm->devid = intel_get_drm_devid(drm->fd);
-
 	kmstest_set_vt_graphics_mode();
 }
 
@@ -142,30 +139,19 @@ static bool fbc_wait_until_disabled(int debugfs_fd)
 	return r;
 }
 
-static bool fbc_not_compressing_enabled(int debugfs_fd)
-{
-	char buf[128];
-
-	igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status", buf,
-				sizeof(buf));
-	return strstr(buf, "FBC enabled\nCompressing: no");
-}
-
-static bool fbc_wait_until_update(struct drm_info *drm)
+static bool fbc_wait_until_update(int debugfs)
 {
 	/*
-	 * As now kernel enables FBC on linear surfaces on GEN9+, check if the
-	 * fbcon cursor blinking is causing the FBC to uncompress the
-	 * framebuffer.
+	 * FBC is not expected to be enabled because fbcon do not uses a tiled
+	 * framebuffer so a fence can not be setup on the framebuffer and FBC
+	 * code requires a fence to accurate track frontbuffer modifications
+	 * (what maybe is not necessary anymore as we now have
+	 * intel_fbc_invalidate()/flush()).
 	 *
-	 * For older GENs FBC is still expected to be disabled as it still
-	 * relies on a tiled and fenceable framebuffer to track modifications.
+	 * If one day fbcon starts to use a tiled framebuffer we would need to
+	 * check the 'Compressing' status as in each blink it would be disabled.
 	 */
-	if (AT_LEAST_GEN(drm->devid, 9))
-		return igt_wait(fbc_not_compressing_enabled(drm->debugfs_fd),
-				2000, 1);
-	else
-		return !fbc_wait_until_disabled(drm->debugfs_fd);
+	return !fbc_wait_until_disabled(debugfs);
 }
 
 typedef bool (*connector_possible_fn)(drmModeConnectorPtr connector);
@@ -234,9 +220,9 @@ static bool psr_supported_on_chipset(int debugfs_fd)
 	return psr_sink_support(debugfs_fd, PSR_MODE_1);
 }
 
-static bool psr_wait_until_update(struct drm_info *drm)
+static bool psr_wait_until_update(int debugfs_fd)
 {
-	return psr_long_wait_update(drm->debugfs_fd, PSR_MODE_1);
+	return psr_long_wait_update(debugfs_fd, PSR_MODE_1);
 }
 
 static void disable_features(int debugfs_fd)
@@ -259,7 +245,7 @@ static inline void psr_debugfs_enable(int debugfs_fd)
 struct feature {
 	bool (*supported_on_chipset)(int debugfs_fd);
 	bool (*wait_until_enabled)(int debugfs_fd);
-	bool (*wait_until_update)(struct drm_info *drm);
+	bool (*wait_until_update)(int debugfs_fd);
 	bool (*connector_possible_fn)(drmModeConnectorPtr connector);
 	void (*enable)(int debugfs_fd);
 } fbc = {
@@ -309,13 +295,13 @@ static void subtest(struct drm_info *drm, struct feature *feature, bool suspend)
 	sleep(3);
 
 	wait_user("Back to fbcon.");
-	igt_assert(feature->wait_until_update(drm));
+	igt_assert(feature->wait_until_update(drm->debugfs_fd));
 
 	if (suspend) {
 		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
 					      SUSPEND_TEST_NONE);
 		sleep(5);
-		igt_assert(feature->wait_until_update(drm));
+		igt_assert(feature->wait_until_update(drm->debugfs_fd));
 	}
 }
 
-- 
2.25.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
