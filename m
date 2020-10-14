Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 14 Oct 2020 11:40:30 +0100
Message-Id: <20201014104038.2554985-2-chris@chris-wilson.co.uk>
In-Reply-To: <20201014104038.2554985-1-chris@chris-wilson.co.uk>
References: <20201014104038.2554985-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 02/10] i915/gem_exec_balancer: Check
 balancer submission latency
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
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

While CI is unreliable in terms of detecting performance deltas, it
should still be able to detect when we are orders of magnitude off
expectations. In this case, latency/throughput when submitting to a load
balancer should be on par with a native engine.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_balancer.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 35a032ccb..0c334b91b 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -2380,6 +2380,7 @@ static void nop(int i915)
 	for (int class = 0; class < 32; class++) {
 		struct i915_engine_class_instance *ci;
 		unsigned int count;
+		double max = 0;
 		uint32_t ctx;
 
 		ci = list_engines(i915, 1u << class, &count);
@@ -2410,6 +2411,8 @@ static void nop(int i915)
 
 			t = igt_nsec_elapsed(&tv) * 1e-3 / nops;
 			igt_info("%s:%d %.3fus\n", class_to_str(class), n, t);
+			if (t > max)
+				max = t;
 		}
 
 		{
@@ -2433,9 +2436,10 @@ static void nop(int i915)
 
 			t = igt_nsec_elapsed(&tv) * 1e-3 / nops;
 			igt_info("%s:* %.3fus\n", class_to_str(class), t);
+			if (t > 10 * max)
+				igt_warn("Balancer submission %.1fx worse than normal!\n", t / max);
 		}
 
-
 		igt_fork(child, count) {
 			struct drm_i915_gem_execbuffer2 execbuf = {
 				.buffers_ptr = to_user_pointer(&batch),
@@ -2476,6 +2480,8 @@ static void nop(int i915)
 			t = igt_nsec_elapsed(&tv) * 1e-3 / nops;
 			igt_info("[%d] %s:* %.3fus\n",
 				 child, class_to_str(class), t);
+			if (t > 20 * max)
+				igt_warn("[%d] Balancer submission %.1fx worse than normal!\n", child, t / max);
 
 			gem_context_destroy(i915, execbuf.rsvd1);
 		}
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
