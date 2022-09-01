Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E7410E6BA
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 11:45:06 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Sep 2022 13:44:35 +0200
Message-Id: <20220901114442.55071-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220901114442.55071-1-zbigniew.kempczynski@intel.com>
References: <20220901114442.55071-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 05/12] i915/gem_create: Stress creation with
 busy engines
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

From: Chris Wilson <chris.p.wilson@intel.com>

Use shortlived non-preemptible batches to demonstrate an issue with
waiting on user controlled resources.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
---
 tests/i915/gem_create.c | 54 +++++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index 06a9498e0d..c4c40e85c0 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -290,7 +290,8 @@ static void always_clear(int i915, const struct gem_memory_region *r, int timeou
 	igt_info("Checked %'lu page allocations\n", checked);
 }
 
-static void busy_create(int i915, const struct gem_memory_region *r, int timeout)
+static void busy_create(int i915, const struct gem_memory_region *r, int timeout, unsigned int flags)
+#define BUSY_HOG 0x1
 {
 	struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
@@ -301,12 +302,14 @@ static void busy_create(int i915, const struct gem_memory_region *r, int timeout
 	ctx = intel_ctx_create_all_physical(i915);
 	ahnd = get_reloc_ahnd(i915, ctx->id);
 
-	igt_fork_hang_detector(i915);
-	for_each_ctx_engine(i915, ctx, e)
-		spin[e->flags] = igt_spin_new(i915,
-					      .ahnd = ahnd,
-					      .ctx = ctx,
-					      .engine = e->flags);
+	for_each_ctx_engine(i915, ctx, e) {
+		spin[e->flags] =
+			igt_spin_new(i915,
+				     .ahnd = ahnd,
+				     .ctx = ctx,
+				     .engine = e->flags,
+				     .flags = flags & BUSY_HOG ? IGT_SPIN_NO_PREEMPTION : 0);
+	}
 
 	igt_until_timeout(timeout) {
 		for_each_ctx_engine(i915, ctx, e) {
@@ -314,12 +317,13 @@ static void busy_create(int i915, const struct gem_memory_region *r, int timeout
 			igt_spin_t *next;
 
 			handle = gem_create_in_memory_region_list(i915, 4096, 0, &r->ci, 1);
-			next = igt_spin_new(i915,
-					    .ahnd = ahnd,
-					    .ctx = ctx,
-					    .engine = e->flags,
-					    .dependency = handle,
-					    .flags = IGT_SPIN_SOFTDEP);
+			next = __igt_spin_new(i915,
+					      .ahnd = ahnd,
+					      .ctx = ctx,
+					      .engine = e->flags,
+					      .dependency = handle,
+					      .flags = ((flags & BUSY_HOG ? IGT_SPIN_NO_PREEMPTION : 0) |
+							IGT_SPIN_SOFTDEP));
 			gem_close(i915, handle);
 
 			igt_spin_free(i915, spin[e->flags]);
@@ -335,7 +339,6 @@ static void busy_create(int i915, const struct gem_memory_region *r, int timeout
 	igt_info("Created %ld objects while busy\n", count);
 
 	gem_quiescent_gpu(i915);
-	igt_stop_hang_detector();
 }
 
 static void size_update(int fd)
@@ -862,11 +865,26 @@ igt_main
 	}
 
 	igt_describe("Create buffer objects while GPU is busy.");
-	igt_subtest_with_dynamic("busy-create") {
-		for_each_memory_region(r, fd) {
-			igt_dynamic_f("%s", r->name)
-				busy_create(fd, r, 30);
+	igt_subtest_group {
+		igt_fixture
+			igt_fork_hang_detector(fd);
+
+		igt_subtest_with_dynamic("busy-create") {
+			for_each_memory_region(r, fd) {
+				igt_dynamic_f("%s", r->name)
+					busy_create(fd, r, 30, 0);
+			}
 		}
+
+		igt_subtest_with_dynamic("hog-create") {
+			for_each_memory_region(r, fd) {
+				igt_dynamic_f("%s", r->name)
+					busy_create(fd, r, 30, BUSY_HOG);
+			}
+		}
+
+		igt_fixture
+			igt_stop_hang_detector();
 	}
 
 	igt_describe("Exercise create_ext placements extension.");
-- 
2.34.1
