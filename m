Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A5310E0D1
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Dec 2023 10:19:02 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Dec 2023 15:37:25 +0530
Message-Id: <20231201100725.8646-3-mohammed.thasleem@intel.com>
In-Reply-To: <20231201100725.8646-1-mohammed.thasleem@intel.com>
References: <20231201100725.8646-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 2/2] tests/intel/kms_pm_dc: Add LNL platform
 for dc9-dpms validation
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

DC5 counter on disp ver >=14 is not expected to get reset in DC9 state.
Add LNL patform to use runtime_suspended_time value to validate DC9
dpms test.

v2: Update subject and commit message. (Swati)
v3: Move lib/intel_chipset.h changes in separate patch. (Kamil)

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 8006e54de..0d5824e67 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -88,7 +88,7 @@
 #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
 #define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
 #define KMS_POLL_DISABLE 0
-#define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || IS_METEORLAKE(devid)))
+#define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || AT_LEAST_DISPLAY(devid, 14)))
 
 IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
 
@@ -505,7 +505,7 @@ static bool dc9_wait_entry(data_t *data, int dc_target, int prev_dc, int prev_rp
 	 * Runtime suspended residency should increment once DC9 is achieved;
 	 * this condition is valid for all platforms.
 	 * However, resetting of dc5/dc6 counter to check if display engine was in DC9;
-	 * this condition at present can be skipped for dg1, dg2 and MTL platforms.
+	 * this condition at present can be skipped for dg1, dg2 and MTL+ platforms.
 	 */
 	return igt_wait((read_runtime_suspended_time(data->drm_fd) > prev_rpm) &&
 			(!DC9_RESETS_DC_COUNTERS(data->devid) ||
-- 
2.25.1
