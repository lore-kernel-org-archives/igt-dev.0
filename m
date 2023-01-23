Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6386310E4C9
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jan 2023 15:17:18 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 23 Jan 2023 16:17:11 +0100
Message-Id: <20230123151711.94167-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/prime_vgem: fix test listing
 problem
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
fixture, as uses of fd are allowed inside fixtures or subtests.
This may eliminate problem when using --list-subtests option,
depending on implementation it can assert like:

sudo build/tests/prime_vgem --list-subtests
...
coherency-blt
(prime_vgem:259195) intel_ctx-CRITICAL: Test assertion failure function intel_ctx_create_all_physical, file ../lib/intel_ctx.c:344:
(prime_vgem:259195) intel_ctx-CRITICAL: Failed assertion: err == 0
(prime_vgem:259195) intel_ctx-CRITICAL: error: -9 != 0
Test prime_vgem failed.

v2: improve commit messages and use fixtures for create and
  destroy of context (Petri)

Reported-by: Petri Latvala <petri.latvala@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/prime_vgem.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index f876e748..06be273c 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -1093,7 +1093,10 @@ static void test_each_engine(const char *name, int vgem, int i915,
 					unsigned int flags))
 {
 	const struct intel_execution_engine2 *e;
-	const intel_ctx_t *ctx = intel_ctx_create_all_physical(i915);
+	const intel_ctx_t *ctx;
+
+	igt_fixture
+		ctx = intel_ctx_create_all_physical(i915);
 
 	igt_subtest_with_dynamic(name) {
 		for_each_ctx_engine(i915, ctx, e) {
@@ -1110,7 +1113,8 @@ static void test_each_engine(const char *name, int vgem, int i915,
 		}
 	}
 
-	intel_ctx_destroy(i915, ctx);
+	igt_fixture
+		intel_ctx_destroy(i915, ctx);
 }
 
 igt_main
-- 
2.37.2
