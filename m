Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810E910E31F
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 01:55:35 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  9 May 2023 07:32:28 +0530
Message-Id: <20230509020228.25780-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_fbcon_fbt: Execute test on
 multiple modes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In present situation the test is executing only for single mode,
execute the test for the next mode supported by the connector if
the first one is invalid to enable fbc.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/kms_fbcon_fbt.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tests/i915/kms_fbcon_fbt.c b/tests/i915/kms_fbcon_fbt.c
index 831ec867..543426d1 100644
--- a/tests/i915/kms_fbcon_fbt.c
+++ b/tests/i915/kms_fbcon_fbt.c
@@ -37,6 +37,7 @@ IGT_TEST_DESCRIPTION("Test the relationship between fbcon and the frontbuffer "
 		     "tracking infrastructure.");
 
 #define MAX_CONNECTORS 32
+int j = 0;
 
 struct drm_info {
 	int fd, debugfs_fd;
@@ -164,14 +165,14 @@ typedef bool (*connector_possible_fn)(drmModeConnectorPtr connector);
 static void set_mode_for_one_screen(struct drm_info *drm,
 				    connector_possible_fn connector_possible)
 {
-	int i, rc;
+	int rc;
 	uint32_t crtc_id;
 	drmModeModeInfoPtr mode;
 	uint32_t buffer_id;
 	drmModeConnectorPtr c = NULL;
 
-	for (i = 0; i < drm->res->count_connectors; i++) {
-		c = drm->connectors[i];
+	for (;j < drm->res->count_connectors; j++) {
+		c = drm->connectors[j];
 
 		if (c->connection == DRM_MODE_CONNECTED && c->count_modes &&
 		    connector_possible(c)) {
@@ -179,7 +180,7 @@ static void set_mode_for_one_screen(struct drm_info *drm,
 			break;
 		}
 	}
-	igt_require_f(i < drm->res->count_connectors,
+	igt_require_f(j < drm->res->count_connectors,
 		      "No connector available\n");
 
 	crtc_id = kmstest_find_crtc_for_connector(drm->fd, drm->res, c, 0);
@@ -348,7 +349,12 @@ static void subtest(struct drm_info *drm, struct feature *feature, bool suspend)
 
 	set_mode_for_one_screen(drm, feature->connector_possible_fn);
 	wait_user("Screen set.");
-	igt_assert(feature->wait_until_enabled(drm->debugfs_fd));
+	if (!(feature->wait_until_enabled(drm->debugfs_fd))) {
+		++j;
+		set_mode_for_one_screen(drm, feature->connector_possible_fn);
+		wait_user("Screen set for next mode.");
+		igt_assert(feature->wait_until_enabled(drm->debugfs_fd));
+	}
 
 	if (suspend) {
 		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
-- 
2.39.0
