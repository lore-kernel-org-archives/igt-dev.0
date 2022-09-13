Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5BC10E691
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Sep 2022 09:18:48 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Sep 2022 12:17:59 +0300
Message-Id: <20220913091759.2780538-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915_pm_dc: Use igt_main
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Tests should never have an "int main".

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
---
 tests/i915/i915_pm_dc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index f664a2a2..c862ae39 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -474,11 +474,10 @@ static void kms_poll_state_restore(int sig)
 }
 
 IGT_TEST_DESCRIPTION("These tests validate Display Power DC states");
-int main(int argc, char *argv[])
+igt_main
 {
 	data_t data = {};
 
-	igt_subtest_init(argc, argv);
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
-- 
2.30.2
