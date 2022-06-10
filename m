Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BA111AD5B
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 04:28:33 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Jun 2022 10:01:30 +0530
Message-Id: <20220610043131.3452-2-nidhi1.gupta@intel.com>
In-Reply-To: <20220610043131.3452-1-nidhi1.gupta@intel.com>
References: <20220610043131.3452-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] tests/i915/kms_draw_crc.c: Convert test to
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

Covert the existing subtests to dynamic subtests.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/kms_draw_crc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index 33fefed4..3e68479e 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -340,7 +340,7 @@ igt_main
 	for (modifier_idx = 0; modifier_idx < ARRAY_SIZE(modifiers); modifier_idx++) {
 		igt_describe("This subtest verfies igt_draw library works "
 			     "with different modifiers, DRM_FORMATS, DRAW_METHODS.");
-		igt_subtest_f("draw-method-%s-%s-%s",
+		igt_subtest_with_dynamic_f("draw-method-%s-%s-%s",
 			      format_str(format_idx),
 			      igt_draw_get_method_name(method),
 			      modifier_str(modifier_idx))
@@ -350,7 +350,7 @@ igt_main
 
 	igt_describe("This subtest verifies CRC after filling fb with x-tiling "
 		     "or none.");
-	igt_subtest("fill-fb")
+	igt_subtest_with_dynamic("fill-fb")
 		fill_fb_subtest();
 
 	igt_fixture
-- 
2.26.2
