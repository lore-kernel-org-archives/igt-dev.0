Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2141410EA9E
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Feb 2022 16:13:27 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Fri, 11 Feb 2022 21:43:14 +0530
Message-Id: <20220211161314.16602-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests: i915_pm_rpm : Dump
 i915_runtime_pm_status
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
List-ID: <igt-dev@lists.freedesktop.org>

Dump i915_runtime_pm_status conditionally whenever runtime pm status
got active and it was expected to be suspended.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 648b0cffb..d1ba69af4 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -201,10 +201,17 @@ static bool wait_for_pc8_status(enum pc8_status status)
 
 static bool wait_for_suspended(void)
 {
-	if (has_pc8 && !has_runtime_pm)
+	bool suspended = false;
+
+	if (has_pc8 && !has_runtime_pm) {
 		return wait_for_pc8_status(PC8_ENABLED);
-	else
-		return igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
+	} else {
+		suspended = igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
+		if (!suspended)
+			igt_debugfs_dump(drm_fd, "i915_runtime_pm_status");
+
+		return suspended;
+	}
 }
 
 static bool wait_for_active(void)
-- 
2.26.2
