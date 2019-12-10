Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 10 Dec 2019 12:19:34 +0000
Message-Id: <20191210121934.3845438-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/perf_pmu: Cap target number of
 interrupts
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

Limit the maximum number of interrupts in order to avoid overburdening
older CPUs and GPUs.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/perf_pmu.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/perf_pmu.c b/tests/perf_pmu.c
index 33fb4d653..e1bbf2410 100644
--- a/tests/perf_pmu.c
+++ b/tests/perf_pmu.c
@@ -1274,11 +1274,15 @@ static void cpu_hotplug(int gem_fd)
 	assert_within_epsilon(val, ts[1] - ts[0], tolerance);
 }
 
+static int target_num_interrupts(int i915)
+{
+	return min(gem_measure_ring_inflight(i915, I915_EXEC_DEFAULT, 0), 30);
+}
+
 static void
 test_interrupts(int gem_fd)
 {
-	const int target =
-		gem_measure_ring_inflight(gem_fd, I915_EXEC_DEFAULT, 0);
+	const int target = target_num_interrupts(gem_fd);
 	const unsigned int test_duration_ms = 1000;
 	igt_spin_t *spin[target];
 	struct pollfd pfd;
@@ -1342,8 +1346,7 @@ test_interrupts(int gem_fd)
 static void
 test_interrupts_sync(int gem_fd)
 {
-	const int target =
-		gem_measure_ring_inflight(gem_fd, I915_EXEC_DEFAULT, 0);
+	const int target = target_num_interrupts(gem_fd);
 	const unsigned int test_duration_ms = 1000;
 	igt_spin_t *spin[target];
 	struct pollfd pfd;
-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
