Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCD96E899
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Sep 2021 14:04:02 +0000 (UTC)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri,  3 Sep 2021 16:03:48 +0200
Message-Id: <20210903140348.252686-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] test/gem_exec_suspend: Enable the test for
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
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Discrete GPUs don't support gem_set_caching() and uses a single,
kernel provided mapping mode, FIXED. Adjust the test accordingly.

This makes the test run on DG1.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/i915/gem_exec_suspend.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
index dbe0c8a7..5f17e600 100644
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
@@ -293,6 +294,7 @@ igt_main
 	const struct intel_execution_engine2 *e;
 	igt_hang_t hang;
 	const intel_ctx_t *ctx;
+	bool has_lmem;
 	int fd;
 
 	igt_fixture {
@@ -302,6 +304,7 @@ igt_main
 		ctx = intel_ctx_create_all_physical(fd);
 
 		igt_fork_hang_detector(fd);
+		has_lmem = gem_has_lmem(fd);
 	}
 
 	igt_subtest("basic")
@@ -318,6 +321,18 @@ igt_main
 		run_test(fd, ctx, ALL_ENGINES, HIBERNATE);
 
 	for (m = modes; m->suffix; m++) {
+		if (has_lmem) {
+			igt_subtest_with_dynamic_f("fixed%s", m->suffix) {
+				for_each_ctx_engine(fd, ctx, e) {
+					if (!gem_class_can_store_dword(fd, e->class))
+						continue;
+					igt_dynamic_f("%s", e->name)
+						run_test(fd, ctx, e->flags, m->mode);
+				}
+			}
+			continue;
+		}
+
 		igt_subtest_with_dynamic_f("uncached%s", m->suffix) {
 			for_each_ctx_engine(fd, ctx, e) {
 				if (!gem_class_can_store_dword(fd, e->class))
-- 
2.31.1
