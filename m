Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126886E04A
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2020 15:02:54 +0000 (UTC)
From: sai gowtham <sai.gowtham.ch@intel.com>
Date: Wed,  6 May 2020 20:32:18 +0530
Message-Id: <20200506150218.3811-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t][V3]tests/i915/gem_ringfill: Adjusted test
 to utilize all available engines.
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
To: sai.gowtham.ch@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Replaced the legacy for_each_engine* defines with the ones implemented
in the gem_engine_topology library.

Added legacy engine coverage and changed subtest name in
fast-feedback.testlist
from basic-default-forked -->legacy-basic-forked@default.

Cc: Dec Katarzyna <katarzyna.dec@intel.com>
Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
Signed-off-by: satyavat <satyavathi.k@intel.com>
Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_ringfill.c             | 42 ++++++++++++++++++---------
 tests/intel-ci/fast-feedback.testlist |  2 +-
 2 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
index 4c73f4d9..60b2eab6 100644
--- a/tests/i915/gem_ringfill.c
+++ b/tests/i915/gem_ringfill.c
@@ -240,6 +240,8 @@ static void run_test(int fd, unsigned ring, unsigned flags, unsigned timeout)
 
 igt_main
 {
+	const struct intel_execution_engine *e;
+	const struct intel_execution_engine2 *e2;
 	const struct {
 		const char *suffix;
 		unsigned flags;
@@ -249,12 +251,12 @@ igt_main
 		{ "", 0, 0, true},
 		{ "-interruptible", INTERRUPTIBLE, 1, true },
 		{ "-hang", HANG, 10, true },
-		{ "-child", CHILD, 0 },
+		{ "child", CHILD, 0 },
 		{ "-forked", FORKED, 0, true },
 		{ "-fd", FORKED | NEWFD, 0, true },
-		{ "-bomb", BOMB | NEWFD | INTERRUPTIBLE, 150 },
-		{ "-S3", BOMB | SUSPEND, 30 },
-		{ "-S4", BOMB | HIBERNATE, 30 },
+		{ "bomb", BOMB | NEWFD | INTERRUPTIBLE, 150 },
+		{ "S3", BOMB | SUSPEND, 30 },
+		{ "S4", BOMB | HIBERNATE, 30 },
 		{ NULL }
 	}, *m;
 	bool master = false;
@@ -276,17 +278,31 @@ igt_main
 		igt_info("Ring size: %d batches\n", ring_size);
 		igt_require(ring_size);
 	}
+	/* Legacy for selecting rings. */
+	for (m = modes; m->suffix; m++) {
+		igt_subtest_with_dynamic_f("legacy-%s%s",
+				m->basic ? "basic" : "", m->suffix) {
+			for (e = intel_execution_engines; e->name; e++) {
+				igt_dynamic_f("%s", e->name) {
+					igt_skip_on(m->flags & NEWFD && master);
+					run_test(fd, eb_ring(e),
+							m->flags,
+							m->timeout);
+				}
 
+			}
+		}
+	}
 	for (m = modes; m->suffix; m++) {
-		const struct intel_execution_engine *e;
-
-		for (e = intel_execution_engines; e->name; e++) {
-			igt_subtest_f("%s%s%s",
-				      m->basic && !e->exec_id ? "basic-" : "",
-				      e->name,
-				      m->suffix) {
-				igt_skip_on(m->flags & NEWFD && master);
-				run_test(fd, eb_ring(e), m->flags, m->timeout);
+		igt_subtest_with_dynamic_f("%s%s",
+				m->basic ? "basic" : "", m->suffix) {
+			__for_each_physical_engine(fd, e2) {
+				igt_dynamic_f("%s", e2->name) {
+					igt_skip_on(m->flags & NEWFD && master);
+					run_test(fd, e2->flags,
+							m->flags,
+							m->timeout);
+				}
 			}
 		}
 	}
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 2ccad438..994f15e5 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -35,7 +35,7 @@ igt@gem_mmap@basic
 igt@gem_mmap_gtt@basic
 igt@gem_render_linear_blits@basic
 igt@gem_render_tiled_blits@basic
-igt@gem_ringfill@basic-default-forked
+igt@gem_ringfill@legacy-basic-forked@default
 igt@gem_sync@basic-all
 igt@gem_sync@basic-each
 igt@gem_tiled_blits@basic
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
