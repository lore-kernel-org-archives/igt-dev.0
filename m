Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D6B10E35C
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 01:05:34 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 28 Nov 2022 17:05:22 -0800
Message-Id: <20221129010522.994524-3-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221129010522.994524-1-umesh.nerlige.ramappa@intel.com>
References: <20221129010522.994524-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] i915/perf: Enable MTL OA tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add some MTL definitions in the OA tests.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index e6216ffd..dd1f1ac3 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -258,7 +258,7 @@ get_oa_format(enum drm_i915_oa_format format)
 {
 	if (IS_HASWELL(devid))
 		return hsw_oa_formats[format];
-	else if (IS_DG2(devid))
+	else if (IS_DG2(devid) || IS_METEORLAKE(devid))
 		return dg2_oa_formats[format];
 	else if (IS_GEN12(devid))
 		return gen12_oa_formats[format];
@@ -558,7 +558,7 @@ oa_report_get_ctx_id(uint32_t *report)
 static int
 oar_unit_default_format(void)
 {
-	if (IS_DG2(devid))
+	if (IS_DG2(devid) || IS_METEORLAKE(devid))
 		return I915_OAR_FORMAT_A32u40_A4u32_B8_C8;
 
 	return test_set->perf_oa_format;
@@ -4847,9 +4847,11 @@ test_whitelisted_registers_userspace_config(void)
 		mux_regs[i++] = 0;
 		mux_regs[i++] = 0xD2C;
 		mux_regs[i++] = 0;
-		/* WAIT_FOR_RC6_EXIT */
-		mux_regs[i++] = 0x20CC;
-		mux_regs[i++] = 0;
+		if (!IS_METEORLAKE(devid)) {
+			/* WAIT_FOR_RC6_EXIT */
+			mux_regs[i++] = 0x20CC;
+			mux_regs[i++] = 0;
+		}
 	}
 
 	if (IS_CHERRYVIEW(devid)) {
-- 
2.36.1
