Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 30 Mar 2020 10:21:17 +0100
Message-Id: <20200330092117.810776-4-chris@chris-wilson.co.uk>
In-Reply-To: <20200330092117.810776-1-chris@chris-wilson.co.uk>
References: <20200330092117.810776-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/4] i915/gem_exec_parallel: Dynamise
 per-engine tests
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

Convert the per-engine tests into a dynamic subtest.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_parallel.c        | 28 ++++++++++++++-------------
 tests/intel-ci/fast-feedback.testlist |  4 +---
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
index 98316af40..66fe18534 100644
--- a/tests/i915/gem_exec_parallel.c
+++ b/tests/i915/gem_exec_parallel.c
@@ -196,7 +196,6 @@ static void all(int fd, struct intel_execution_engine2 *engine, unsigned flags)
 				engines[nengine++] = e->flags;
 		}
 	} else {
-		igt_require(gem_class_can_store_dword(fd, engine->class));
 		engines[nengine++] = engine->flags;
 	}
 	igt_require(nengine);
@@ -254,7 +253,7 @@ igt_main
 		const char *name;
 		unsigned flags;
 	} modes[] = {
-		{ "", 0 },
+		{ "basic", 0 },
 		{ "contexts", CONTEXTS },
 		{ "fds", FDS },
 		{ NULL }
@@ -268,18 +267,21 @@ igt_main
 		igt_fork_hang_detector(fd);
 	}
 
-	for (const struct mode *m = modes; m->name; m++)
-		igt_subtest_f("%s", *m->name ? m->name : "basic")
-			/* NULL value means all engines */
-			all(fd, NULL, m->flags);
-
-	__for_each_physical_engine(fd, e) {
+	igt_subtest_with_dynamic("engines") {
 		for (const struct mode *m = modes; m->name; m++)
-			igt_subtest_f("%s%s%s",
-				      e->name,
-				      *m->name ? "-" : "",
-				      m->name)
-				all(fd, e, m->flags);
+			igt_dynamic(m->name)
+				/* NULL value means all engines */
+				all(fd, NULL, m->flags);
+	}
+
+	for (const struct mode *m = modes; m->name; m++) {
+		igt_subtest_with_dynamic(m->name) {
+			__for_each_physical_engine(fd, e) {
+				if (gem_class_can_store_dword(fd, e->class))
+					igt_dynamic(e->name)
+						all(fd, e, m->flags);
+			}
+		}
 	}
 
 	igt_fixture {
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index b41fb4a01..06367f822 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -21,9 +21,7 @@ igt@gem_exec_fence@basic-wait
 igt@gem_exec_fence@basic-await
 igt@gem_exec_fence@nb-await
 igt@gem_exec_gttfill@basic
-igt@gem_exec_parallel@basic
-igt@gem_exec_parallel@contexts
-igt@gem_exec_parallel@fds
+igt@gem_exec_parallel@engines
 igt@gem_exec_store@basic-all
 igt@gem_exec_suspend@basic
 igt@gem_exec_suspend@basic-s0
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
