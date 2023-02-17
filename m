Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D723D10E10D
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Feb 2023 15:12:52 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 17 Feb 2023 16:12:41 +0100
Message-Id: <20230217151241.45317-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/i915_suspend: run in subprocess to
 catch oom
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

Shrink subtest can end up with oom killing it. Create subprocess
and run it from there so it will at least get reported like:

dynamic child 0 pid:70254 died with signal 9, Killed
Subtest shrink: FAIL (23.906s)

dmesg reports:

[103335.337309] Out of memory: Killed process 70254 (i915_suspend)

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/i915_suspend.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
index 815f1c8a..9798ba5c 100644
--- a/tests/i915/i915_suspend.c
+++ b/tests/i915/i915_suspend.c
@@ -176,15 +176,22 @@ test_shrink(int fd, unsigned int mode)
 	void *mem;
 
 	gem_quiescent_gpu(fd);
-	igt_purge_vm_caches(fd);
 
-	mem = igt_get_total_pinnable_mem(&size);
-	igt_assert(mem != MAP_FAILED);
+	igt_multi_fork(child, 1) {
+		fd = gem_reopen_driver(fd);
+		igt_purge_vm_caches(fd);
 
-	igt_purge_vm_caches(fd);
-	igt_system_suspend_autoresume(mode, SUSPEND_TEST_NONE);
+		mem = igt_get_total_pinnable_mem(&size);
+		igt_assert(mem != MAP_FAILED);
 
-	munmap(mem, size);
+		igt_purge_vm_caches(fd);
+		igt_system_suspend_autoresume(mode, SUSPEND_TEST_NONE);
+
+		munmap(mem, size);
+		close(fd);
+	}
+
+	igt_waitchildren();
 }
 
 static void
-- 
2.37.2
