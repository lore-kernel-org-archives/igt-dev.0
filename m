Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 24 Mar 2020 12:52:33 +0000
Message-Id: <20200324125233.56308-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/i915_pm_rc6_residency: Make ringbuffer
 rc6 fast
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

The legacy ringbuffer submission lacks a fast soft-rc6
mechanism as we have no interrupt for an idle ring. As such
we are at the mercy of HW RC6... which is not quite as
precise as we need to pass this test. Oh well.

Since HW is not fast enough to minimise power draw, tell the driver to
park as soon as we know we are idle. One day, we hope for the driver to
discover a mechanism to do this for itself, for as this test shows that
can save us Watts!

Closes: https://gitlab.freedesktop.org/drm/intel/issues/1516
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/i915_pm_rc6_residency.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
index f507f76bc..d2dc37a16 100644
--- a/tests/i915/i915_pm_rc6_residency.c
+++ b/tests/i915/i915_pm_rc6_residency.c
@@ -310,6 +310,17 @@ static void bg_load(int i915, unsigned int flags, unsigned long *ctl)
 		}
 		ctl[1]++;
 
+		/*
+		 * The legacy ringbuffer submission lacks a fast soft-rc6
+		 * mechanism as we have no interrupt for an idle ring. As such
+		 * we are at the mercy of HW RC6... which is not quite as
+		 * precise as we need to pass this test. Oh well.
+		 *
+		 * Fake it until we make it.
+		 */
+		if (!gem_has_execlists(i915))
+			igt_drop_caches_set(i915, DROP_IDLE);
+
 		usleep(igt_nsec_elapsed(&tv) / 10); /* => 1% busy */
 	} while (!READ_ONCE(*ctl));
 }
-- 
2.26.0.rc2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
