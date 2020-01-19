Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sun, 19 Jan 2020 09:58:56 +0000
Message-Id: <20200119095856.3840335-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/i915_pm_rc6_residency: Relax tolerance
 for HW RC6
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

Ringbuffer HW RC6 is not as fast as soft-rc6 on execlists, as it must
always wait for an EI before entering RC6 and does not benefit from an
interrupt generated when the rings go idle (so no immediate parking).
Our goal with the test is to make sure that we do enter rc6 under very
light workloads, so increase the tolerance slightly.

fi-cfl-guc: 2.84
fi-kbl-8809g: 2.76
fi-kbl-x1275: 2.81
fi-skl-6770hq: 2.79
fi-skl-lmem: 2.85
fi-hsw-4770: 2.65
fi-hsw-4770r: 2.64
fi-hsw-peppy: 2.65
fi-ivb-3770: 0 (awooga, awooga, awooga!)
fi-snb-2520m: 2.66
fi-snb-2600: 2.64

Worst case among an idle run is 88%, so set our tolerance to 20%.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/i915/i915_pm_rc6_residency.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
index c801a5f60..6a714cab8 100644
--- a/tests/i915/i915_pm_rc6_residency.c
+++ b/tests/i915/i915_pm_rc6_residency.c
@@ -283,6 +283,7 @@ static int open_pmu(int i915, uint64_t config)
 static void rc6_idle(int i915)
 {
 	const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
+	const int tolerance = 20; /* Some RC6 is better than none! */
 	unsigned long slept, cycles;
 	unsigned long *done;
 	uint64_t rc6, ts[2];
@@ -339,7 +340,7 @@ static void rc6_idle(int i915)
 	close(fd);
 
 	igt_assert(cycles >= SLEEP_DURATION); /* At least one wakeup/s needed */
-	assert_within_epsilon(rc6, ts[1] - ts[0], 5);
+	assert_within_epsilon(rc6, ts[1] - ts[0], tolerance);
 }
 
 igt_main
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
