Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 31 Mar 2020 17:23:19 +0100
Message-Id: <20200331162320.968537-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/gem_exec_reloc: Dynamic active
 engine tests
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Use igt_subtest_with_dynamic for the flexible approach to engine
dependent test discovery.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_reloc.c | 38 ++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index 1aa03fba3..275cf6ae9 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -261,13 +261,13 @@ static void active(int fd, unsigned engine)
 
 	nengine = 0;
 	if (engine == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			if (gem_can_store_dword(fd, eb_ring(e)))
-				engines[nengine++] = eb_ring(e);
+		const struct intel_execution_engine2 *e;
+
+		__for_each_physical_engine(fd, e) {
+			if (gem_class_can_store_dword(fd, e->class))
+				engines[nengine++] = e->flags;
 		}
 	} else {
-		igt_require(gem_has_ring(fd, engine));
-		igt_require(gem_can_store_dword(fd, engine));
 		engines[nengine++] = engine;
 	}
 	igt_require(nengine);
@@ -706,6 +706,7 @@ static void basic_softpin(int fd)
 
 igt_main
 {
+	const struct intel_execution_engine2 *e;
 	const struct mode {
 		const char *name;
 		unsigned before, after;
@@ -805,15 +806,26 @@ igt_main
 	igt_subtest("gpu")
 		from_gpu(fd);
 
-	igt_subtest("basic-active")
-		active(fd, ALL_ENGINES);
-	for (const struct intel_execution_engine *e = intel_execution_engines;
-	     e->name; e++) {
-		igt_subtest_f("basic-active-%s", e->name)
-			active(fd, eb_ring(e));
-		igt_subtest_f("basic-spin-%s", e->name)
-			active_spin(fd, eb_ring(e));
+	igt_subtest_with_dynamic("basic-active") {
+		igt_dynamic("all")
+			active(fd, ALL_ENGINES);
+
+		__for_each_physical_engine(fd, e) {
+			if (!gem_class_can_store_dword(fd, e->class))
+				continue;
+
+			igt_dynamic_f("%s", e->name)
+				active(fd, e->flags);
+		}
+	}
+
+	igt_subtest_with_dynamic("basic-spin") {
+		__for_each_physical_engine(fd, e) {
+			igt_dynamic_f("%s", e->name)
+				active_spin(fd, e->flags);
+		}
 	}
+
 	igt_fixture
 		close(fd);
 }
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
