Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA0C10E805
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Apr 2022 13:01:03 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 19 Apr 2022 16:00:57 +0300
Message-Id: <20220419130057.9141-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] gem_lmem_swapping: Check requirements
 before module unload
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

To prevent a needless unload-load cycle, check for lmem before the
unload if i915 is already loaded.

Also check that the device is there at all so we get a better error
message than EBADFD from require_gem.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
---
 tests/i915/gem_lmem_swapping.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 2f9f3268..ec41dfc3 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -534,10 +534,25 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		struct intel_execution_engine2 *e;
 		char *tmp;
 
+		/*
+		 * If the driver is already loaded, check that it has
+		 * lmem before unloading to prevent a needless
+		 * unload-load cycle on integrated platforms.
+		 */
+		if (igt_kmod_is_loaded("i915")) {
+			i915 = __drm_open_driver(DRIVER_INTEL);
+			igt_require_fd(i915);
+			igt_require_gem(i915);
+			igt_require(gem_has_lmem(i915));
+			close(i915);
+		}
+
 		igt_i915_driver_unload();
 		igt_assert_eq(igt_i915_driver_load("lmem_size=4096"), 0);
 
 		i915 = __drm_open_driver(DRIVER_INTEL);
+		igt_require_fd(i915);
+		/* Do the lmem check again in case the reload messed something up (as unlikely it is) */
 		igt_require_gem(i915);
 		igt_require(gem_has_lmem(i915));
 
-- 
2.30.2
