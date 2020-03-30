Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 30 Mar 2020 10:21:16 +0100
Message-Id: <20200330092117.810776-3-chris@chris-wilson.co.uk>
In-Reply-To: <20200330092117.810776-1-chris@chris-wilson.co.uk>
References: <20200330092117.810776-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/4] i915/gem_exec_capture: Dynamise
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
 tests/i915/gem_exec_capture.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index fe2c4bd12..bc13d8632 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -524,9 +524,14 @@ static size_t safer_strlen(const char *s)
 	return s ? strlen(s) : 0;
 }
 
+#define test_each_engine(T, i915, e) \
+	igt_subtest_with_dynamic(T) __for_each_physical_engine(i915, e) \
+		for_each_if(gem_class_can_store_dword(i915, (e)->class)) \
+			igt_dynamic_f("%s", (e)->name)
+
 igt_main
 {
-	const struct intel_execution_engine *e;
+	const struct intel_execution_engine2 *e;
 	igt_hang_t hang;
 	int fd = -1;
 	int dir = -1;
@@ -550,17 +555,8 @@ igt_main
 		igt_require(safer_strlen(igt_sysfs_get(dir, "error")) > 0);
 	}
 
-	for (e = intel_execution_engines; e->name; e++) {
-		/* default exec-id is purely symbolic */
-		if (e->exec_id == 0)
-			continue;
-
-		igt_subtest_f("capture-%s", e->name) {
-			igt_require(gem_ring_has_physical_engine(fd, eb_ring(e)));
-			igt_require(gem_can_store_dword(fd, eb_ring(e)));
-			capture(fd, dir, eb_ring(e));
-		}
-	}
+	test_each_engine("capture", fd, e)
+		capture(fd, dir, e->flags);
 
 	igt_subtest_f("many-4K-zero") {
 		igt_require(gem_can_store_dword(fd, 0));
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
