Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9A810F1C6
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Feb 2022 16:57:49 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Feb 2022 22:23:14 +0530
Message-Id: <20220223165314.23456-1-anshuman.gupta@intel.com>
In-Reply-To: <20220223095951.12430-1-anshuman.gupta@intel.com>
References: <20220223095951.12430-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] i915_pm_rpm: Use __igt_debugfs_dump for
 i915_runtime_pm_status
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Use __igt_debugfs_dump() in wait_for_suspended() in order to
specify explicit igt log level.
We need to dump the i915_runtime_pm_status even in case of igt
test's skips while setting up envirnment as well,
that requires log level to be IGT_LOG_INFO.

v2:
- Add a comment "Dump status even if the test skips" before
  __igt_debugfs_dump(). [Ashutosh]

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 6c8ffbd5d..1df0ed222 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -206,8 +206,10 @@ static bool wait_for_suspended(void)
 	} else {
 		bool suspended = igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
 
-		if (!suspended)
-			igt_debugfs_dump(drm_fd, "i915_runtime_pm_status");
+		if (!suspended) {
+			/* Dump runtime pm status even if test skips */
+			__igt_debugfs_dump(drm_fd, "i915_runtime_pm_status", IGT_LOG_INFO);
+		}
 
 		return suspended;
 	}
-- 
2.26.2
