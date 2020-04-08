Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed,  8 Apr 2020 13:59:46 +0100
Message-Id: <20200408125946.2054864-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/i915_pm_rc6_residency: Show where the
 time is spent
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

Sometimes the bg_load only wakes up once or twice in 3s. That's
just unbelievable, so include some measurements to see how long the
load spends in submission & waiting.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/i915_pm_rc6_residency.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
index cd1a6c8d6..15efba186 100644
--- a/tests/i915/i915_pm_rc6_residency.c
+++ b/tests/i915/i915_pm_rc6_residency.c
@@ -304,11 +304,13 @@ static void bg_load(int i915, unsigned int flags, unsigned long *ctl)
 
 	sigaction(SIGINT, &act, NULL);
 	do {
+		uint64_t submit, wait, elapsed;
 		struct timespec tv = {};
 
 		igt_nsec_elapsed(&tv);
 
 		gem_execbuf(i915, &execbuf);
+		submit = igt_nsec_elapsed(&tv);
 		if (flags & WAITBOOST) {
 			gem_sync(i915, obj.handle);
 			if (flags & ONCE)
@@ -317,6 +319,7 @@ static void bg_load(int i915, unsigned int flags, unsigned long *ctl)
 			while (gem_bo_busy(i915, obj.handle))
 				usleep(0);
 		}
+		wait = igt_nsec_elapsed(&tv);
 		ctl[1]++;
 
 		/*
@@ -330,8 +333,15 @@ static void bg_load(int i915, unsigned int flags, unsigned long *ctl)
 		if (!gem_has_execlists(i915))
 			igt_drop_caches_set(i915, DROP_IDLE);
 
+		elapsed = igt_nsec_elapsed(&tv);
+		igt_info("Pulse took %.3fms (submit %.1fus, wait %.1fus, idle %.1fus)\n",
+			 1e-6 * elapsed,
+			 1e-3 * submit,
+			 1e-3 * (wait - submit),
+			 1e-3 * (elapsed - wait));
+
 		/* aim for ~1% busy */
-		usleep(min(igt_nsec_elapsed(&tv) / 10, 50 * 1000));
+		usleep(min(elapsed / 10, 50 * 1000));
 	} while (!READ_ONCE(*ctl));
 }
 
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
