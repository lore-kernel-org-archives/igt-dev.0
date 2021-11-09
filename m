Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD69C6E423
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Nov 2021 19:52:23 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Wed, 10 Nov 2021 01:25:50 +0530
Message-Id: <20211109195551.10452-3-jeevan.b@intel.com>
In-Reply-To: <20211109195551.10452-1-jeevan.b@intel.com>
References: <20211109195551.10452-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/3] tests/kms_psr2_sf: Change testcase
 design
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
Cc: daniel@ffwll.ch, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Change testcase design so that it avoids new subtest for each block position.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/i915/kms_psr2_sf.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index dca2d030..7f88b514 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
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
