Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B7910E5DB
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jun 2023 15:48:02 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  8 Jun 2023 08:47:55 -0700
Message-Id: <20230608154756.2866519-4-ashutosh.dixit@intel.com>
In-Reply-To: <20230608154756.2866519-1-ashutosh.dixit@intel.com>
References: <20230608154756.2866519-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 i-g-t 3/4] tests/gem_ctx_freq: Disable SLPC
 efficient freq for the test
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

When SLPC efficient freq is enabled, GPU frequencies can be outside the
min/max range set from sysfs. Any test which compares actual GPU frequency
against set frequencies is therefore meaningful only when SLPC efficient
freq is disabled.

v2: Move ignore_slpc_efficient_freq to lib/igt_pm.c (Vinay)

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6786
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_pm.c              | 17 +++++++++++++++++
 lib/igt_pm.h              |  1 +
 tests/i915/gem_ctx_freq.c |  6 +++++-
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index e60b09a73140..18c84bf3a021 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1400,3 +1400,20 @@ int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
 
 	return usage;
 }
+
+/**
+ * igt_pm_ignore_slpc_efficient_freq
+ * @i915: open i915 drm file descriptor
+ * @gtfd: open gt sysfs fd
+ * @val: value to set
+ *
+ * Ignores/un-ignores SLPC efficient frequency
+ */
+void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val)
+{
+	if (!(gem_using_guc_submission(i915) && i915_is_slpc_enabled(i915)))
+		return;
+
+	igt_require(igt_sysfs_has_attr(gtfd, "slpc_ignore_eff_freq"));
+	igt_assert(igt_sysfs_set_u32(gtfd, "slpc_ignore_eff_freq", val));
+}
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 448cf42de7f1..71ec2f239993 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -88,5 +88,6 @@ bool i915_is_slpc_enabled_gt(int drm_fd, int gt);
 bool i915_is_slpc_enabled(int drm_fd);
 int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
+void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
 
 #endif /* IGT_PM_H */
diff --git a/tests/i915/gem_ctx_freq.c b/tests/i915/gem_ctx_freq.c
index b2f6c2af55e1..d15f83600480 100644
--- a/tests/i915/gem_ctx_freq.c
+++ b/tests/i915/gem_ctx_freq.c
@@ -147,9 +147,11 @@ static void sysfs_range(int dirfd, int gt)
 	 * The sysfs interface sets the global limits and overrides the
 	 * user's request. So we can to check that if the user requests
 	 * a range outside of the sysfs, the requests are only run at the
-	 * constriained sysfs range.
+	 * constrained sysfs range. With GuC SLPC this requires disabling
+	 * efficient freq.
 	 */
 
+	igt_pm_ignore_slpc_efficient_freq(i915, dirfd, true);
 	igt_require(get_sysfs_freq(dirfd, &sys_min, &sys_max));
 	igt_info("System min freq: %dMHz; max freq: %dMHz\n", sys_min, sys_max);
 
@@ -199,6 +201,8 @@ static void __restore_sysfs_freq(int dirfd)
 {
 	char buf[256];
 
+	igt_pm_ignore_slpc_efficient_freq(i915, dirfd, false);
+
 	if (igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf)) > 0)
 		igt_sysfs_rps_set(dirfd, RPS_MIN_FREQ_MHZ, buf);
 
-- 
2.38.0
