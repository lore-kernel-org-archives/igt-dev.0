Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2592610E31C
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Nov 2023 17:36:54 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Apr 2022 05:52:30 +0530
Message-Id: <20220422002230.19535-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel/kms_pm_dc: Fix dc9-dpms test on
 LNL
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
Add condition to check runtime_suspended_time value to validate
DC9 dpms test.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 lib/intel_chipset.h     | 1 +
 tests/intel/kms_pm_dc.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index bd79a2cab..f413f840a 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -212,6 +212,7 @@ void intel_check_pch(void);
 
 #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
 #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
+#define AT_LEAST_DISPLAY(devid, x) (intel_get_device_info(devid)->display_ver >= x)
 
 #define IS_GEN2(devid)		IS_GEN(devid, 2)
 #define IS_GEN3(devid)		IS_GEN(devid, 3)
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 87fdbab01..33c2af95b 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -114,7 +114,7 @@
 #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
 #define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
 #define KMS_POLL_DISABLE 0
-#define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || IS_METEORLAKE(devid)))
+#define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || AT_LEAST_DISPLAY(devid, 14)))
 #define DRM_MODE_FMT    "\"%s\": %d %d %d %d %d %d %d %d %d %d 0x%x 0x%x"
 #define DRM_MODE_ARG(m) \
 		(m)->name, (m)->vrefresh, (m)->clock, \
@@ -608,7 +608,7 @@ static bool dc9_wait_entry(data_t *data, int dc_target, int prev_dc, int prev_rp
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
