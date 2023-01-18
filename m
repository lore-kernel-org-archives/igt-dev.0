Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2A510E6F6
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 15:00:10 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 Jan 2023 15:59:54 +0100
Message-Id: <20230118145954.36846-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/prime_vgem: fix test listing problem
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

Move call to function with possible usage of card fd inside
of subtest code. Such uses are allowed inside fixups or subtests.
This may eliminate problem when using --list-subtests option,
depending on implementation it can assert like:

sudo build/tests/prime_vgem --list-subtests
...
coherency-blt
(prime_vgem:259195) intel_ctx-CRITICAL: Test assertion failure function intel_ctx_create_all_physical, file ../lib/intel_ctx.c:344:
(prime_vgem:259195) intel_ctx-CRITICAL: Failed assertion: err == 0
(prime_vgem:259195) intel_ctx-CRITICAL: error: -9 != 0
Test prime_vgem failed.

Reported-by: Petri Latvala <petri.latvala@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/prime_vgem.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index f876e748..1eaf19d4 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -1093,9 +1093,10 @@ static void test_each_engine(const char *name, int vgem, int i915,
 					unsigned int flags))
 {
 	const struct intel_execution_engine2 *e;
-	const intel_ctx_t *ctx = intel_ctx_create_all_physical(i915);
 
 	igt_subtest_with_dynamic(name) {
+		const intel_ctx_t *ctx = intel_ctx_create_all_physical(i915);
+
 		for_each_ctx_engine(i915, ctx, e) {
 			if (!gem_class_can_store_dword(i915, e->class))
 				continue;
@@ -1108,9 +1109,9 @@ static void test_each_engine(const char *name, int vgem, int i915,
 				fn(i915, vgem, ctx, e->flags);
 			}
 		}
-	}
 
-	intel_ctx_destroy(i915, ctx);
+		intel_ctx_destroy(i915, ctx);
+	}
 }
 
 igt_main
-- 
2.37.2
