Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 27 Jan 2020 10:02:22 +0000
Message-Id: <20200127100222.2380741-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200126134811.2084060-2-chris@chris-wilson.co.uk>
References: <20200126134811.2084060-2-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] i915_pm_rps: Be wary if RP0 == RPn
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

If the HW min/max frequencies are the same, there is not much range to
deal with and a couple of our invalid tests become confused as they are
actually no-ops.

Error reporting in i915_pm_rps is rudimentary and we deserve better.

Closes: https://gitlab.freedesktop.org/drm/intel/issues/1008
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/i915_pm_rps.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
index b65eefb03..cb1500d2f 100644
--- a/tests/i915/i915_pm_rps.c
+++ b/tests/i915/i915_pm_rps.c
@@ -397,9 +397,11 @@ static void min_max_config(void (*check)(void), bool load_gpu)
 	writeval_inval(sysfs_files[MIN].filp, origfreqs[RP0] + 1000);
 	check();
 
-	igt_debug("\nDecrease max to RPn (invalid)...\n");
-	writeval_inval(sysfs_files[MAX].filp, origfreqs[RPn]);
-	check();
+	if (origfreqs[RPn] < origfreqs[RP0]) {
+		igt_debug("\nDecrease max to RPn (invalid)...\n");
+		writeval_inval(sysfs_files[MAX].filp, origfreqs[RPn]);
+		check();
+	}
 
 	igt_debug("\nDecrease min to midpoint...\n");
 	writeval(sysfs_files[MIN].filp, fmid);
@@ -429,9 +431,11 @@ static void min_max_config(void (*check)(void), bool load_gpu)
 	writeval_inval(sysfs_files[MAX].filp, 0);
 	check();
 
-	igt_debug("\nIncrease min to RP0 (invalid)...\n");
-	writeval_inval(sysfs_files[MIN].filp, origfreqs[RP0]);
-	check();
+	if (origfreqs[RP0] > origfreqs[RPn]) {
+		igt_debug("\nIncrease min to RP0 (invalid)...\n");
+		writeval_inval(sysfs_files[MIN].filp, origfreqs[RP0]);
+		check();
+	}
 
 	igt_debug("\nIncrease max to midpoint...\n");
 	writeval(sysfs_files[MAX].filp, fmid);
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
