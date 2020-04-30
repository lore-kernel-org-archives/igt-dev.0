Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 30 Apr 2020 10:45:36 +0100
Message-Id: <20200430094536.767299-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] perf: Bump the timestamp tolerance for
 really slow devices
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

Slow devices with low CS frequencies may take longer than expected
between the PIPECONTROL timestamp and the OA timestamp, hovering just
above the arbitrary 500ns threshold. The discrepancy seems relatively
stable, just the device taking longer than anticipated without affecting
the results, so make the threshold a little more lenient.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/perf.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tests/perf.c b/tests/perf.c
index 5d3c68789..b1e2a2e64 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -3415,13 +3415,13 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 			uint64_t timestamp0_64, timestamp1_64;
 			uint32_t delta_ts64, delta_oa32;
 			uint64_t delta_ts64_ns, delta_oa32_ns;
-			uint32_t delta_delta;
 			int width = 800;
 			int height = 600;
 			uint32_t ctx_id = 0xffffffff; /* invalid handle */
 			uint32_t ctx1_id = 0xffffffff;  /* invalid handle */
 			uint32_t current_ctx_id = 0xffffffff;
 			uint32_t n_invalid_ctx = 0;
+			int delta_delta;
 			int ret;
 			struct accumulator accumulator = {
 				.format = test_set->perf_oa_format
@@ -3589,12 +3589,10 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 
 			/* The delta as calculated via the PIPE_CONTROL timestamp or
 			 * the OA report timestamps should be almost identical but
-			 * allow a 500 nanoseconds margin.
+			 * allow a 2 microsecond margin.
 			 */
-			delta_delta = delta_ts64_ns > delta_oa32_ns ?
-				(delta_ts64_ns - delta_oa32_ns) :
-				(delta_oa32_ns - delta_ts64_ns);
-			if (delta_delta > 500) {
+			delta_delta = delta_ts64_ns - delta_oa32_ns;
+			if (abs(delta_delta) > 2000) {
 				igt_debug("Too slow %d; skipping\n",
 					  delta_delta);
 				ret = EAGAIN;
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
