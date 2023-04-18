Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E4F10E7FA
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 16:49:48 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Apr 2023 22:14:32 +0530
Message-Id: <20230418164501.1687266-17-bhanuprakash.modem@intel.com>
In-Reply-To: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 16/45] tests/i915/kms_cdclk: Add XE support
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

Add XE driver support for kms tests.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_cdclk.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_cdclk.c b/tests/i915/kms_cdclk.c
index bb0036802..0f9b8dc58 100644
--- a/tests/i915/kms_cdclk.c
+++ b/tests/i915/kms_cdclk.c
@@ -65,6 +65,9 @@ static int get_current_cdclk_freq(int debugfs_fd)
 	 * Display specific clock frequency info is moved to i915_cdclk_info,
 	 * On older kernels if this debugfs is not found, fallback to read from
 	 * i915_frequency_info.
+	 *
+	 * FIXME: As of now, XE debugfs is still using i915 namespace, once the
+	 * Kernel changes are landed, update this to use the XE specific debugfs.
 	 */
 	res = igt_debugfs_simple_read(debugfs_fd, "i915_cdclk_info",
 				      buf, sizeof(buf));
@@ -368,7 +371,7 @@ igt_main
 	data_t data = {};
 
 	igt_fixture {
-		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		igt_require(data.drm_fd >= 0);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		igt_require(data.debugfs_fd);
-- 
2.40.0
