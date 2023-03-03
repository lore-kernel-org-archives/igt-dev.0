Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886CF10E6DD
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Mar 2023 15:50:08 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Mar 2023 21:19:41 +0530
Message-Id: <20230303154941.490669-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] perf_pmu: Dump i915_runtime_pm_status
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

Dump i915_pm_runtime_status in case of i915 device failed to runtime
suspend, it will dump the rpm wakeref tracking information which
will useful to debug the runtime pm issues.

v2:
- Use wait_for_suspended(). [Ashutosh]

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf_pmu.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index c1779fc9d..df194c8ad 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -1703,6 +1703,16 @@ static bool wait_for_rc6(int fd, int timeout)
 	return false;
 }
 
+static bool wait_for_suspended(int gem_fd)
+{
+	bool suspended = igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
+
+	if (!suspended)
+		__igt_debugfs_dump(gem_fd, "i915_runtime_pm_status", IGT_LOG_INFO);
+
+	return suspended;
+}
+
 static void
 test_rc6(int gem_fd, unsigned int flags)
 {
@@ -1727,7 +1737,7 @@ test_rc6(int gem_fd, unsigned int flags)
 		drmModeFreeResources(res);
 
 		igt_require(igt_setup_runtime_pm(gem_fd));
-		igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+		igt_require(wait_for_suspended(gem_fd));
 
 		/*
 		 * Sleep for a bit to see if once woken up estimated RC6 hasn't
-- 
2.25.1
