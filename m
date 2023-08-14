Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA38B10E013
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 10:04:45 +0000 (UTC)
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 14 Aug 2023 15:26:54 +0530
Message-Id: <20230814095654.872-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc: Check runtime
 suspend for DC9 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Thasleem@freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As for MTL DC5 counter is not expected to get reset in DC9 state.
Add condition to check runtime_suspended_time value for both
igfx and dgfx to track DC9 dpms entry.

Signed-off-by: Thasleem, Mohammed <mohammed.thasleem@intel.com>
---
 tests/i915/i915_pm_dc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 90fe847fc..13ae31583 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -88,7 +88,7 @@
 #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
 #define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
 #define KMS_POLL_DISABLE 0
-#define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid)))
+#define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || IS_METEORLAKE(devid)))
 
 IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
 
@@ -514,7 +514,7 @@ static bool dc9_wait_entry(data_t *data, int dc_target, int prev_dc, int prev_rp
 	 * Runtime suspended residency should increment once DC9 is achieved;
 	 * this condition is valid for all platforms.
 	 * However, resetting of dc5/dc6 counter to check if display engine was in DC9;
-	 * this condition at present can be skipped for dg1 and dg2 platforms.
+	 * this condition at present can be skipped for dg1, dg2 and MTL platforms.
 	 */
 	return igt_wait((read_runtime_suspended_time(data->drm_fd) > prev_rpm) &&
 			(!DC9_RESETS_DC_COUNTERS(data->devid) ||
-- 
2.34.1
