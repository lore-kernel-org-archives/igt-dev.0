Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  6 Apr 2020 09:53:09 +0100
Message-Id: <20200406085309.1585743-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/perf_pmu: Add the missing igt_dynamic
 to dynamic rcs* test selection
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
Cc: intel-gfx@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

An important ingredient to using igt_subtest_with_dynamic is to include
an igt_dynamic at some point.

Reported-by: Petri Latvala <petri.latvala@intel.com>
Fixes: 311cb1b360b7 ("i915/perf_pmu: Dynamic active engine tests")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 tests/perf_pmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/perf_pmu.c b/tests/perf_pmu.c
index 92aee1d1d..b9ca6a493 100644
--- a/tests/perf_pmu.c
+++ b/tests/perf_pmu.c
@@ -1866,7 +1866,8 @@ static void faulting_read(int gem_fd, const struct mmap_offset *t)
 
 #define test_each_rcs(T, i915, e) \
 	igt_subtest_with_dynamic(T) __for_each_physical_engine(i915, e) \
-		for_each_if((e)->class == I915_ENGINE_CLASS_RENDER)
+		for_each_if((e)->class == I915_ENGINE_CLASS_RENDER) \
+			igt_dynamic_f("%s", e->name)
 
 igt_main
 {
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
