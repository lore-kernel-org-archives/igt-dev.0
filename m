Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 27 Jan 2020 09:07:10 +0000
Message-Id: <20200127090712.2324227-2-chris@chris-wilson.co.uk>
In-Reply-To: <20200127090712.2324227-1-chris@chris-wilson.co.uk>
References: <20200127090712.2324227-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/4] i915/gem_exec_nop: Reduce runtime
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Reduce the upper timeout for stress tests from 150s to a mere 20s, and
quick tests to 2s.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_nop.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
index dbedb3561..9a2efd32c 100644
--- a/tests/i915/gem_exec_nop.c
+++ b/tests/i915/gem_exec_nop.c
@@ -865,41 +865,41 @@ igt_main
 	}
 
 	igt_subtest("basic-series")
-		series(device, handle, 5);
+		series(device, handle, 2);
 
 	igt_subtest("basic-parallel")
-		parallel(device, handle, 5);
+		parallel(device, handle, 2);
 
 	igt_subtest("basic-sequential")
-		sequential(device, handle, 0, 5);
+		sequential(device, handle, 0, 2);
 
 	for (e = intel_execution_engines; e->name; e++) {
 		igt_subtest_f("%s", e->name)
 			single(device, handle, eb_ring(e), e->name);
 		igt_subtest_f("signal-%s", e->name)
-			fence_signal(device, handle, eb_ring(e), e->name, 5);
+			fence_signal(device, handle, eb_ring(e), e->name, 2);
 	}
 
 	igt_subtest("signal-all")
-		fence_signal(device, handle, ALL_ENGINES, "all", 150);
+		fence_signal(device, handle, ALL_ENGINES, "all", 20);
 
 	igt_subtest("series")
-		series(device, handle, 150);
+		series(device, handle, 20);
 
 	igt_subtest("parallel")
-		parallel(device, handle, 150);
+		parallel(device, handle, 20);
 
 	igt_subtest("sequential")
-		sequential(device, handle, 0, 150);
+		sequential(device, handle, 0, 20);
 
 	igt_subtest("forked-sequential")
-		sequential(device, handle, FORKED, 150);
+		sequential(device, handle, FORKED, 20);
 
 	igt_subtest("chained-sequential")
-		sequential(device, handle, FORKED | CHAINED, 150);
+		sequential(device, handle, FORKED | CHAINED, 20);
 
 	igt_subtest("context-sequential")
-		sequential(device, handle, FORKED | CONTEXT, 150);
+		sequential(device, handle, FORKED | CONTEXT, 20);
 
 	igt_subtest_group {
 		igt_fixture {
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
