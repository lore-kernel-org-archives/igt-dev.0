Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2116E056
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jul 2021 12:24:28 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Mon, 19 Jul 2021 17:36:32 +0530
Message-Id: <20210719120632.11658-1-anshuman.gupta@intel.com>
In-Reply-To: <20210715064731.4484-1-anshuman.gupta@intel.com>
References: <20210715064731.4484-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [REBASED] tests/i915_pm_dc: Fix platform version check
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

setup_dc_dpms() disables i915 runtime suspend to execute
dc{5,6}-dpms for the platforms has DC9 states to avoid
counter reset issue. With recent changes now AT_LEAST_GEN()
macro checks for grphics_ver, fix it with display_ver.

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_dc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 53840579..9d0a15d8 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -337,7 +337,7 @@ static void cleanup_dc_dpms(data_t *data)
 static void setup_dc_dpms(data_t *data)
 {
 	if (IS_BROXTON(data->devid) || IS_GEMINILAKE(data->devid) ||
-	    AT_LEAST_GEN(data->devid, 11)) {
+	    intel_display_ver(data->devid) >= 11) {
 		igt_disable_runtime_pm();
 		data->runtime_suspend_disabled = true;
 	} else {
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
