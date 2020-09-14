Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F386E492
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Sep 2020 12:00:09 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Mon, 14 Sep 2020 17:29:48 +0530
Message-Id: <20200914115948.9967-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ctx_exec: Added test description
 for testcase
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added test description to all the available subtests.

Cc: Melkaveri, Arjun <Arjun.Melkaveri@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_ctx_exec.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index 194191de..bb5a17ac 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -353,6 +353,7 @@ igt_main
 		gem_write(fd, handle, 0, batch, sizeof(batch));
 	}
 
+        igt_describe("Tests the basic context batch buffer execution.");
 	igt_subtest("basic") {
 		ctx_id = gem_context_create(fd);
 		igt_assert(exec(fd, handle, 0, ctx_id) == 0);
@@ -367,19 +368,30 @@ igt_main
 		igt_assert(exec(fd, handle, 0, ctx_id) < 0);
 		gem_sync(fd, handle);
 	}
-
+        igt_describe("Tests if __gem_execbuf returns -ENOENT "
+                     "when non-existent context id's are set.");
 	igt_subtest("basic-invalid-context")
 		invalid_context(fd, handle);
 
+	igt_describe("Test tries to check maximum number of buffers it can evict "
+            "for a context.");
 	igt_subtest("eviction")
 		big_exec(fd, handle, 0);
 
+	igt_describe("Test creates a no-recovery scenario by allowing a hang, "
+                     "setting I915_CONTEXT_PARAM_RECOVERABLE to 0 and then "
+                     "force resetting the GPU "
+                     "and checks if  __gem_execbuf returns -EIO.");
 	igt_subtest("basic-norecovery")
 		norecovery(fd);
 
+	igt_describe("Test verifies that contexts are automatically shotdown "
+                     "on close if hangchecking is disabled.");
 	igt_subtest("basic-nohangcheck")
 		nohangcheck_hostile(fd);
 
+	igt_describe("Test checks if the kernel doesn't leak the vma "
+                     "pin_count for the last context on reset.");
 	igt_subtest("reset-pin-leak") {
 		int i;
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
