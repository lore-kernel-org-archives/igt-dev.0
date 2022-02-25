Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D60710E905
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 10:53:17 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com
Date: Fri, 25 Feb 2022 16:16:10 +0530
Message-Id: <20220225104610.50919-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ctx_exec: Added test description
 for testcase
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added test description to all the available subtests.

v2: Added description for newly added test case.

Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_ctx_exec.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index a1270a88..88f0d6ed 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -465,6 +465,7 @@ igt_main
 		gem_write(fd, handle, 0, batch, sizeof(batch));
 	}
 
+	igt_describe("Check the basic context batch buffer execution.");
 	igt_subtest("basic") {
 		ctx_id = gem_context_create(fd);
 		igt_assert(exec(fd, handle, 0, ctx_id) == 0);
@@ -480,18 +481,30 @@ igt_main
 		gem_sync(fd, handle);
 	}
 
+	igt_describe("Check if __gem_execbuf returns -ENOENT"
+		     " when non-existent context id's are set.");
 	igt_subtest("basic-invalid-context")
 		invalid_context(fd, handle);
 
+	igt_describe("Check maximum number of buffersit can"
+		     " evict for a context.");
 	igt_subtest("eviction")
 		big_exec(fd, handle, 0);
 
+	igt_describe("Create a no-recovery scenario by allowing a hang,"
+		     " setting I915_CONTEXT_PARAM_RECOVERABLE to 0 and then"
+		     " force resetting the GPU and check if __gem_execbuf"
+		     " returns -EIO.");
 	igt_subtest("basic-norecovery")
 		norecovery(fd);
 
+	igt_describe("Verify that contexts are automatically shotdown"
+		     " on close, if hangchecking is disabled.");
 	igt_subtest("basic-nohangcheck")
 		nohangcheck_hostile(fd);
 
+	igt_describe("Race the execution and interrupt handlers along a context,"
+	             " while closing it at a random time.");
 	igt_subtest_group {
 		igt_fixture {
 			intel_allocator_multiprocess_start();
@@ -505,6 +518,8 @@ igt_main
 		}
 	}
 
+	igt_describe("Check if the kernel doesn't leak the vma"
+		     " pin_count for the last context on reset.");
 	igt_subtest("reset-pin-leak") {
 		int i;
 		uint64_t ahnd;
-- 
2.25.1
