Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB6189A6D
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Sep 2021 14:19:12 +0000 (UTC)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Mon,  6 Sep 2021 16:18:58 +0200
Message-Id: <20210906141858.371710-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2] test/gem_exec_suspend: Enable the test for
 discrete GPUs
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
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Discrete GPUs don't support gem_set_caching() and uses a single,
kernel provided caching mode, FIXED. Adjust the test accordingly.

This makes the test run on DG1.

v2:
- Use igt_require() do determine which of the caching mode subtests to
  run. (Petri Latvala)
- Pass the ctx parameter to igt_spin_new(), as it appears to be needed for
  the hang-SX subtests to run on DG1.

Cc: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Z# Untracked files:
---
 tests/i915/gem_exec_suspend.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
index dbe0c8a7..887bb735 100644
--- a/tests/i915/gem_exec_suspend.c
+++ b/tests/i915/gem_exec_suspend.c
@@ -114,7 +114,8 @@ static void run_test(int fd, const intel_ctx_t *ctx,
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = gem_create(fd, 4096);
-	gem_set_caching(fd, obj[0].handle, !!(flags & CACHED));
+	if (!gem_has_lmem(fd))
+		gem_set_caching(fd, obj[0].handle, !!(flags & CACHED));
 	obj[0].flags |= EXEC_OBJECT_WRITE;
 	obj[1].handle = gem_create(fd, 4096);
 	gem_write(fd, obj[1].handle, 0, &bbe, sizeof(bbe));
@@ -178,7 +179,8 @@ static void run_test(int fd, const intel_ctx_t *ctx,
 	}
 
 	if (flags & HANG)
-		spin = igt_spin_new(fd, .ahnd = ahnd, .engine = engine);
+		spin = igt_spin_new(fd, .ahnd = ahnd, .engine = engine,
+			.ctx = ctx);
 
 	switch (mode(flags)) {
 	case NOSLEEP:
@@ -318,7 +320,18 @@ igt_main
 		run_test(fd, ctx, ALL_ENGINES, HIBERNATE);
 
 	for (m = modes; m->suffix; m++) {
+		igt_subtest_with_dynamic_f("fixed%s", m->suffix) {
+			igt_require(gem_has_lmem(fd));
+			for_each_ctx_engine(fd, ctx, e) {
+				if (!gem_class_can_store_dword(fd, e->class))
+					continue;
+				igt_dynamic_f("%s", e->name)
+					run_test(fd, ctx, e->flags, m->mode);
+			}
+		}
+
 		igt_subtest_with_dynamic_f("uncached%s", m->suffix) {
+			igt_require(!gem_has_lmem(fd));
 			for_each_ctx_engine(fd, ctx, e) {
 				if (!gem_class_can_store_dword(fd, e->class))
 					continue;
@@ -328,6 +341,7 @@ igt_main
 		}
 
 		igt_subtest_with_dynamic_f("cached%s", m->suffix) {
+			igt_require(!gem_has_lmem(fd));
 			for_each_ctx_engine(fd, ctx, e) {
 				if (!gem_class_can_store_dword(fd, e->class))
 					continue;
-- 
2.31.1
