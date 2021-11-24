Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9206E4A5
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Nov 2021 21:09:26 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Wed, 24 Nov 2021 13:10:02 -0800
Message-Id: <20211124211002.114989-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_cursor_legacy: Disable Intel's
 PSR2 selective fetch in this test
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

When doing a primary or sprite plane flip, PSR2 selective fetch code
also adds all the planes including cursor that overlaps with the
area being updated, so this causes legacy cursor API calls to
wait for a pending atomic commit to finish causing tests that do
checks with vblank counters.

So here when running in an Intel platform that has PSR2 selective
fetch enabled, it will switch to PSR1 before executing the subtests.
Because what this whole test mostly wants to do, is check if userspace
can do asynchronous cursors updates.

v2:
- rename functions and add documentation

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2346
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Jouni Hogander <jouni.hogander@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 lib/igt_psr.c             | 44 +++++++++++++++++++++++++++++++++++++++
 lib/igt_psr.h             |  3 +++
 tests/kms_cursor_legacy.c | 10 +++++++++
 3 files changed, 57 insertions(+)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 8fa8b192f..98eb28b40 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -280,3 +280,47 @@ bool i915_psr2_selective_fetch_check(int drm_fd)
 
 	return ret;
 }
+
+/**
+ * i915_psr2_sel_fetch_to_psr1
+ *
+ * Check if PSR2 selective fetch is enabled, if yes switch to PSR1 and returns
+ * true otherwise returns false.
+ * This function should be called from tests that are not compatible with PSR2
+ * selective fetch.
+ *
+ * Returns:
+ * True if PSR mode changed to PSR1, false otherwise.
+ */
+bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
+{
+	int debugfs_fd;
+	bool ret = false;
+
+	if (!is_i915_device(drm_fd))
+		return ret;
+
+	debugfs_fd = igt_debugfs_dir(drm_fd);
+	if (psr2_selective_fetch_check(debugfs_fd)) {
+		psr_set(drm_fd, debugfs_fd, PSR_MODE_1);
+		ret = true;
+	}
+
+	close(debugfs_fd);
+	return ret;
+}
+
+/**
+ * i915_psr2_sel_fetch_restore
+ *
+ * Restore PSR2 selective fetch after tests were executed, this function should
+ * only be called if i915_psr2_sel_fetch_to_psr1() returned true.
+ */
+void i915_psr2_sel_fetch_restore(int drm_fd)
+{
+	int debugfs_fd;
+
+	debugfs_fd = igt_debugfs_dir(drm_fd);
+	psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH);
+	close(debugfs_fd);
+}
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index a075f336d..76cd26c65 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -49,4 +49,7 @@ void psr_print_debugfs(int debugfs_fd);
 
 bool i915_psr2_selective_fetch_check(int drm_fd);
 
+bool i915_psr2_sel_fetch_to_psr1(int drm_fd);
+void i915_psr2_sel_fetch_restore(int drm_fd);
+
 #endif
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index cd2f84984..d50155e89 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -27,6 +27,7 @@
 
 #include "i915/gem.h"
 #include "igt.h"
+#include "igt_psr.h"
 #include "igt_rand.h"
 #include "igt_stats.h"
 
@@ -1421,6 +1422,7 @@ igt_main
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	igt_display_t display = { .drm_fd = -1 };
+	bool intel_psr2_restore = false;
 	int i;
 
 	igt_fixture {
@@ -1428,6 +1430,12 @@ igt_main
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&display, display.drm_fd);
+		/*
+		 * Not possible to evade vblank after a primary or sprite plane
+		 * page flip with cursor legacy APIS when Intel's PSR2 selective
+		 * fetch is enabled, so switching PSR1 for this whole test.
+		 */
+		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd);
 	}
 
 	/*Test description for pipe-* and all-pipe-* tests*/
@@ -1609,6 +1617,8 @@ igt_main
 		}
 
 	igt_fixture {
+		if (intel_psr2_restore)
+			i915_psr2_sel_fetch_restore(display.drm_fd);
 		igt_display_fini(&display);
 	}
 }
-- 
2.34.0
