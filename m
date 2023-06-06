Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D01C10E129
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 01:21:55 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Jun 2023 18:21:49 -0700
Message-Id: <20230606012150.2119065-4-ashutosh.dixit@intel.com>
In-Reply-To: <20230606012150.2119065-1-ashutosh.dixit@intel.com>
References: <20230606012150.2119065-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] tests/gem_ctx_freq: Disable SLPC
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
against set frequencies is therefore meaninful only when SLPC efficient
freq is disabled.

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6786
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_ctx_freq.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_ctx_freq.c b/tests/i915/gem_ctx_freq.c
index b2f6c2af55e1..6dfcf4187d4b 100644
--- a/tests/i915/gem_ctx_freq.c
+++ b/tests/i915/gem_ctx_freq.c
@@ -131,6 +131,15 @@ static bool get_sysfs_freq(int dirfd, uint32_t *min, uint32_t *max)
 		igt_sysfs_rps_scanf(dirfd, RPS_MAX_FREQ_MHZ, "%u", max) == 1);
 }
 
+static void slpc_ignore_efficient_freq(int dirfd, bool val)
+{
+	if (!(gem_using_guc_submission(i915) && i915_is_slpc_enabled(i915)))
+		return;
+
+	igt_require(igt_sysfs_has_attr(dirfd, "slpc_ignore_eff_freq"));
+	igt_assert(igt_sysfs_set_u32(dirfd, "slpc_ignore_eff_freq", val));
+}
+
 static void sysfs_range(int dirfd, int gt)
 {
 #define N_STEPS 10
@@ -147,9 +156,11 @@ static void sysfs_range(int dirfd, int gt)
 	 * The sysfs interface sets the global limits and overrides the
 	 * user's request. So we can to check that if the user requests
 	 * a range outside of the sysfs, the requests are only run at the
-	 * constriained sysfs range.
+	 * constrained sysfs range. With GuC SLPC this requires disabling
+	 * efficient freq.
 	 */
 
+	slpc_ignore_efficient_freq(dirfd, true);
 	igt_require(get_sysfs_freq(dirfd, &sys_min, &sys_max));
 	igt_info("System min freq: %dMHz; max freq: %dMHz\n", sys_min, sys_max);
 
@@ -199,6 +210,8 @@ static void __restore_sysfs_freq(int dirfd)
 {
 	char buf[256];
 
+	slpc_ignore_efficient_freq(dirfd, false);
+
 	if (igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf)) > 0)
 		igt_sysfs_rps_set(dirfd, RPS_MIN_FREQ_MHZ, buf);
 
-- 
2.38.0
