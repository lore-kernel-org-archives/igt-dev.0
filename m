Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FFB10E1D1
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Aug 2023 04:24:34 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Aug 2023 09:49:34 +0530
Message-Id: <20230823041934.329942-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/i915/kms_fbcon_fbt: Execute test
 on multiple modes
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

v2: loop through modes until check fbc_stride_not_supported
    returns 0

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/kms_fbcon_fbt.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/tests/i915/kms_fbcon_fbt.c b/tests/i915/kms_fbcon_fbt.c
index 2cb0ffdb4..af52d8373 100644
--- a/tests/i915/kms_fbcon_fbt.c
+++ b/tests/i915/kms_fbcon_fbt.c
@@ -79,6 +79,7 @@ IGT_TEST_DESCRIPTION("Test the relationship between fbcon and the frontbuffer "
 		     "tracking infrastructure.");
 
 #define MAX_CONNECTORS 32
+int j;
 
 struct drm_info {
 	int fd, debugfs_fd, crtc_id;
@@ -93,6 +94,15 @@ static void wait_user(const char *msg)
 	igt_debug_wait_for_keypress("fbt");
 }
 
+static bool fbc_stride_not_supported(int debugfs_fd)
+{
+	char buf[128];
+
+	igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status", buf,
+				sizeof(buf));
+	return strstr(buf, "FBC disabled: framebuffer stride not supported\n");
+}
+
 static bool fbc_supported_on_chipset(int device, int debugfs_fd)
 {
 	char buf[128];
@@ -208,21 +218,26 @@ typedef bool (*connector_possible_fn)(drmModeConnectorPtr connector);
 static void set_mode_for_one_screen(struct drm_info *drm,
 				    connector_possible_fn connector_possible)
 {
-	int i, rc;
+	int rc, i;
 	drmModeModeInfoPtr mode;
 	uint32_t buffer_id;
 	drmModeConnectorPtr c = NULL;
 
-	for (i = 0; i < drm->res->count_connectors; i++) {
-		c = drm->connectors[i];
 
-		if (c->connection == DRM_MODE_CONNECTED && c->count_modes &&
-		    connector_possible(c)) {
-			mode = &c->modes[0];
+	for (j = 0; j < drm->res->count_connectors; j++) {
+		c = drm->connectors[j];
+		if (!(c->connection == DRM_MODE_CONNECTED && c->count_modes &&
+		    connector_possible(c)))
+			continue;
+		for (i = 0; i < c->count_modes; i++) {
+			if (!fbc_stride_not_supported(drm->debugfs_fd))
+				continue;
+			mode = &c->modes[i];
 			break;
 		}
+		break;
 	}
-	igt_require_f(i < drm->res->count_connectors,
+	igt_require_f(j < drm->res->count_connectors,
 		      "No connector available\n");
 
 	drm->crtc_id = kmstest_find_crtc_for_connector(drm->fd, drm->res, c, 0);
@@ -391,7 +406,12 @@ static void subtest(struct drm_info *drm, struct feature *feature, bool suspend)
 
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
2.25.1
