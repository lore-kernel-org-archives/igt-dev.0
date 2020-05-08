Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri,  8 May 2020 15:56:30 +0200
Message-Id: <20200508135631.8099-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200508135631.8099-1-janusz.krzysztofik@linux.intel.com>
References: <20200508135631.8099-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/gem_exec_nop: Kill obsolete
 pass/fail metric
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

Commit 870c774b866c ("igt/gem_exec_nop: Add expectancy of independent
execution between engines") extended a "basic" subtest (now
"basic-series") with a pass/fail metric based on comparison of parallel
execution time to be less than an average * 2.  Since then, that limit
has been raised quite a few times:
- by commit 41a26b5152a5 ("igt/gem_exec_nop: Relax parallel assertion
  for short rings") to maximum + minimum,
- by commit 7bd4f918c461 ("igt/gem_exec_nop: Explain the parallel
  execution assertion") to maximum + minimum * 10/9,
- by commit a0eebbddecaa ("igt/gem_exec_nop: Relax assertion for
  parallel execution") to sum * 2.

With the criteria relaxed up to that extent, the purpose of that check
has been limited to a showcase for an old GuC failure.  Since that is
now obsolete, kill that assert.

Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/i915/gem_exec_nop.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
index 357449c5b..c17d672c3 100644
--- a/tests/i915/gem_exec_nop.c
+++ b/tests/i915/gem_exec_nop.c
@@ -682,23 +682,6 @@ static void series(int fd, uint32_t handle, int timeout)
 	time = elapsed(&start, &now) / count;
 	igt_info("All (%d engines): %'lu cycles, average %.3fus per cycle [expected %.3fus]\n",
 		 nengine, count, 1e6*time, 1e6*((max-min)/nengine+min));
-
-	/* The rate limiting step should be how fast the slowest engine can
-	 * execute its queue of requests, as when we wait upon a full ring all
-	 * dispatch is frozen. So in general we cannot go faster than the
-	 * slowest engine (but as all engines are in lockstep, they should all
-	 * be executing in parallel and so the average should be max/nengines),
-	 * but we should equally not go any slower.
-	 *
-	 * However, that depends upon being able to submit fast enough, and
-	 * that in turns depends upon debugging turned off and no bottlenecks
-	 * within the driver. We cannot assert that we hit ideal conditions
-	 * across all engines, so we only look for an outrageous error
-	 * condition.
-	 */
-	igt_assert_f(time < 2*sum,
-		     "Average time (%.3fus) exceeds expectation for parallel execution (min %.3fus, max %.3fus; limit set at %.3fus)\n",
-		     1e6*time, 1e6*min, 1e6*max, 1e6*sum*2);
 }
 
 static void xchg(void *array, unsigned i, unsigned j)
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
