Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C1118AEAE
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Aug 2022 06:49:56 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  2 Aug 2022 12:23:49 +0530
Message-Id: <20220802065350.26410-2-nidhi1.gupta@intel.com>
In-Reply-To: <20220802065350.26410-1-nidhi1.gupta@intel.com>
References: <20220802065350.26410-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] tests/i915/kms_draw_crc: Convert tests to
 dynamic
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

Convert the existing subtests to dynamic subtests.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/kms_draw_crc.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index 33fefed4..5c9feac9 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -335,18 +335,20 @@ igt_main
 	igt_fixture
 		setup_environment();
 
-	for (format_idx = 0; format_idx < ARRAY_SIZE(formats); format_idx++) {
-	for (method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
-	for (modifier_idx = 0; modifier_idx < ARRAY_SIZE(modifiers); modifier_idx++) {
-		igt_describe("This subtest verfies igt_draw library works "
-			     "with different modifiers, DRM_FORMATS, DRAW_METHODS.");
-		igt_subtest_f("draw-method-%s-%s-%s",
+	igt_describe("This subtest verfies igt_draw library works "
+		     "with different modifiers, DRM_FORMATS, DRAW_METHODS.");
+	igt_subtest_with_dynamic("draw-method") {
+		for (format_idx = 0; format_idx < ARRAY_SIZE(formats); format_idx++) {
+		for (method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
+		for (modifier_idx = 0; modifier_idx < ARRAY_SIZE(modifiers); modifier_idx++) {
+		igt_dynamic_f("draw-method-%s-%s-%s",
 			      format_str(format_idx),
 			      igt_draw_get_method_name(method),
 			      modifier_str(modifier_idx))
 			draw_method_subtest(method, format_idx,
 					    modifiers[modifier_idx]);
 	} } }
+	}
 
 	igt_describe("This subtest verifies CRC after filling fb with x-tiling "
 		     "or none.");
-- 
2.26.2
