Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93B01130AA
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jun 2022 06:44:25 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 sai.gowtham.ch@intel.com, Priyanka.Dandamudi@intel.com
Date: Mon, 27 Jun 2022 12:13:46 +0530
Message-Id: <20220627064347.3707017-2-janga.rahul.kumar@intel.com>
In-Reply-To: <20220627064347.3707017-1-janga.rahul.kumar@intel.com>
References: <20220627064347.3707017-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] tests/i915/gem_exec_parallel : Add subtests
 description
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Add test description to all the available subtests.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/i915/gem_exec_parallel.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
index 1dfbaa24..687ca70c 100644
--- a/tests/i915/gem_exec_parallel.c
+++ b/tests/i915/gem_exec_parallel.c
@@ -34,6 +34,8 @@
 #include "igt.h"
 #include "igt_gt.h"
 
+IGT_TEST_DESCRIPTION("Exercise to fill buffers using many clients working in parallel.");
+
 #define ENGINE_MASK  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 #define VERIFY 0
@@ -309,11 +311,12 @@ igt_main
 	const struct mode {
 		const char *name;
 		unsigned flags;
+		const char *describe;
 	} modes[] = {
-		{ "basic", 0 },
-		{ "contexts", CONTEXTS },
-		{ "fds", FDS },
-		{ "userptr", USERPTR },
+		{ "basic", 0, "Check basic functionality per engine." },
+		{ "contexts", CONTEXTS, "Check with many contexts." },
+		{ "fds", FDS, "Check with many fds." },
+		{ "userptr", USERPTR, "Check basic userptr thrashing." },
 		{ NULL }
 	};
 	const intel_ctx_t *ctx;
@@ -327,6 +330,7 @@ igt_main
 		igt_fork_hang_detector(fd);
 	}
 
+	igt_describe("Check with engines working in parallel.");
 	igt_subtest_with_dynamic("engines") {
 		for (const struct mode *m = modes; m->name; m++)
 			igt_dynamic(m->name)
@@ -335,6 +339,7 @@ igt_main
 	}
 
 	for (const struct mode *m = modes; m->name; m++) {
+		igt_describe(m->describe);
 		igt_subtest_with_dynamic(m->name) {
 			for_each_ctx_engine(fd, ctx, e) {
 				if (gem_class_can_store_dword(fd, e->class))
-- 
2.25.1
