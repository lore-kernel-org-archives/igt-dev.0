Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705F76E908
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Sep 2021 07:57:08 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Tue, 21 Sep 2021 13:27:48 +0530
Message-Id: <20210921075749.13049-3-jeevan.b@intel.com>
In-Reply-To: <20210921075749.13049-1-jeevan.b@intel.com>
References: <20210921075749.13049-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_psr2_sf: Make this a generic
 test and change testcase design
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: daniel@ffwll.ch, jose.souza@intel.com, Jeevan B <jeevan.b@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Make this a generic kms test and change testcase design so that it avoids
new subtest for each block position

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/i915/kms_psr2_sf.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 93347327..c83120c4 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -550,7 +550,7 @@ igt_main
 	igt_fixture {
 		int r;
 
-		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 
@@ -582,9 +582,9 @@ igt_main
 	}
 
 	/* Verify primary plane selective fetch */
-	for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
-		igt_describe("Test that selective fetch works on primary plane");
-		igt_subtest_f("primary-%s-sf-dmg-area-%d", op_str(data.op), i) {
+	igt_describe("Test that selective fetch works on primary plane");
+	igt_subtest_f("primary-%s-sf-dmg-area", op_str(data.op)) {
+		for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
 			data.damage_area_count = i;
 			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 			prepare(&data);
@@ -594,9 +594,9 @@ igt_main
 	}
 
 	/* Verify overlay plane selective fetch */
-	for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
-		igt_describe("Test that selective fetch works on overlay plane");
-		igt_subtest_f("overlay-%s-sf-dmg-area-%d", op_str(data.op), i) {
+	igt_describe("Test that selective fetch works on overlay plane");
+	igt_subtest_f("overlay-%s-sf-dmg-area", op_str(data.op)) {
+		for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
 			data.damage_area_count = i;
 			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 			prepare(&data);
@@ -618,9 +618,9 @@ igt_main
 	/* Only for overlay plane */
 	data.op = PLANE_MOVE;
 	/* Verify overlay plane move selective fetch */
-	for (i = POS_TOP_LEFT; i <= POS_BOTTOM_RIGHT ; i++) {
-		igt_describe("Test that selective fetch works on moving overlay plane");
-		igt_subtest_f("%s-sf-dmg-area-%d", op_str(data.op), i) {
+	igt_describe("Test that selective fetch works on moving overlay plane");
+	igt_subtest_f("%s-sf-dmg-area", op_str(data.op)) {
+		for (i = POS_TOP_LEFT; i <= POS_BOTTOM_RIGHT ; i++) {
 			data.pos = i;
 			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 			prepare(&data);
@@ -631,10 +631,10 @@ igt_main
 
 	/* Verify primary plane selective fetch with overplay plane blended */
 	data.op = OVERLAY_PRIM_UPDATE;
-	for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
-		igt_describe("Test that selective fetch works on primary plane "
-			     "with blended overlay plane");
-		igt_subtest_f("%s-sf-dmg-area-%d", op_str(data.op), i) {
+	igt_describe("Test that selective fetch works on primary plane "
+		     "with blended overlay plane");
+	igt_subtest_f("%s-sf-dmg-area", op_str(data.op)) {
+		for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
 			data.damage_area_count = i;
 			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 			prepare(&data);
-- 
2.19.1
