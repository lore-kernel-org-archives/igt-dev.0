Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2CA10E447
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jan 2024 13:23:42 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t] tests/intel/i915_suspend: Fix WARNs of invalid fd
Date: Tue,  9 Jan 2024 18:48:02 +0530
Message-Id: <20240109131802.2624834-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Call drm_close_driver() only if fd >=0, otherwise it'll will throw WARN:

(i915_suspend:7563) drmtest-WARNING: Don't attempt to close standard/invalid file descriptor: -1

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/i915_suspend.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/i915_suspend.c b/tests/intel/i915_suspend.c
index c25805584..82cabfa41 100644
--- a/tests/intel/i915_suspend.c
+++ b/tests/intel/i915_suspend.c
@@ -300,7 +300,9 @@ test_suspend_without_i915(int state)
 		igt_pm_get_d3cold_allowed(card.pci_slot_name, &d3cold_allowed);
 		igt_pm_set_d3cold_allowed(card.pci_slot_name, 0);
 	}
-	drm_close_driver(fd);
+
+	if (fd >= 0)
+		drm_close_driver(fd);
 
 	igt_kmsg(KMSG_INFO "Unloading i915\n");
 	igt_assert_eq(igt_i915_driver_unload(),0);
-- 
2.40.0
