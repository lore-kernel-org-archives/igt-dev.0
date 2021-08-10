Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8676B6E054
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 10:54:27 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 12:53:22 +0200
Message-Id: <20210810105323.31375-54-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810105323.31375-1-zbigniew.kempczynski@intel.com>
References: <20210810105323.31375-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 53/54] tests/sysfs_timeslice_duration:
 Adopt to use allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/sysfs_timeslice_duration.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/tests/i915/sysfs_timeslice_duration.c b/tests/i915/sysfs_timeslice_duration.c
index b73ee3889..8a2f1c2f2 100644
--- a/tests/i915/sysfs_timeslice_duration.c
+++ b/tests/i915/sysfs_timeslice_duration.c
@@ -37,6 +37,7 @@
 #include "i915/gem_mman.h"
 #include "igt_dummyload.h"
 #include "igt_sysfs.h"
+#include "intel_allocator.h"
 #include "ioctl_wrappers.h"
 #include "intel_chipset.h"
 #include "intel_reg.h"
@@ -371,6 +372,7 @@ static uint64_t __test_timeout(int i915, int engine, unsigned int timeout)
 	igt_spin_t *spin[2];
 	uint64_t elapsed;
 	const intel_ctx_t *ctx[2];
+	uint64_t ahnd[2];
 
 	igt_assert(igt_sysfs_scanf(engine, "class", "%u", &class) == 1);
 	igt_assert(igt_sysfs_scanf(engine, "instance", "%u", &inst) == 1);
@@ -378,15 +380,18 @@ static uint64_t __test_timeout(int i915, int engine, unsigned int timeout)
 	set_timeslice(engine, timeout);
 
 	ctx[0] = create_ctx(i915, class, inst, 0);
-	spin[0] = igt_spin_new(i915, .ctx = ctx[0],
+	ahnd[0] = get_reloc_ahnd(i915, ctx[0]->id);
+	spin[0] = igt_spin_new(i915, .ahnd = ahnd[0], .ctx = ctx[0],
 			       .flags = (IGT_SPIN_NO_PREEMPTION |
 					 IGT_SPIN_POLL_RUN |
 					 IGT_SPIN_FENCE_OUT));
 	igt_spin_busywait_until_started(spin[0]);
 
 	ctx[1] = create_ctx(i915, class, inst, 0);
+	ahnd[1] = get_reloc_ahnd(i915, ctx[1]->id);
 	igt_nsec_elapsed(&ts);
-	spin[1] = igt_spin_new(i915, .ctx = ctx[1], .flags = IGT_SPIN_POLL_RUN);
+	spin[1] = igt_spin_new(i915, .ahnd = ahnd[1], .ctx = ctx[1],
+				.flags = IGT_SPIN_POLL_RUN);
 	igt_spin_busywait_until_started(spin[1]);
 	elapsed = igt_nsec_elapsed(&ts);
 
@@ -399,6 +404,8 @@ static uint64_t __test_timeout(int i915, int engine, unsigned int timeout)
 
 	intel_ctx_destroy(i915, ctx[1]);
 	intel_ctx_destroy(i915, ctx[0]);
+	put_ahnd(ahnd[1]);
+	put_ahnd(ahnd[0]);
 	gem_quiescent_gpu(i915);
 
 	return elapsed;
@@ -460,6 +467,7 @@ static void test_off(int i915, int engine)
 	unsigned int saved;
 	igt_spin_t *spin[2];
 	const intel_ctx_t *ctx[2];
+	uint64_t ahnd[2];
 
 	/*
 	 * As always, there are some who must run uninterrupted and simply do
@@ -482,14 +490,17 @@ static void test_off(int i915, int engine)
 	set_timeslice(engine, 0);
 
 	ctx[0] = create_ctx(i915, class, inst, 0);
-	spin[0] = igt_spin_new(i915, .ctx = ctx[0],
+	ahnd[0] = get_reloc_ahnd(i915, ctx[0]->id);
+	spin[0] = igt_spin_new(i915, .ahnd = ahnd[0], .ctx = ctx[0],
 			       .flags = (IGT_SPIN_NO_PREEMPTION |
 					 IGT_SPIN_POLL_RUN |
 					 IGT_SPIN_FENCE_OUT));
 	igt_spin_busywait_until_started(spin[0]);
 
 	ctx[1] = create_ctx(i915, class, inst, 0);
-	spin[1] = igt_spin_new(i915, .ctx = ctx[1], .flags = IGT_SPIN_POLL_RUN);
+	ahnd[1] = get_reloc_ahnd(i915, ctx[1]->id);
+	spin[1] = igt_spin_new(i915, .ahnd = ahnd[1], .ctx = ctx[1],
+				.flags = IGT_SPIN_POLL_RUN);
 
 	for (int i = 0; i < 150; i++) {
 		igt_assert_eq(sync_fence_status(spin[0]->out_fence), 0);
@@ -508,6 +519,8 @@ static void test_off(int i915, int engine)
 
 	intel_ctx_destroy(i915, ctx[1]);
 	intel_ctx_destroy(i915, ctx[0]);
+	put_ahnd(ahnd[1]);
+	put_ahnd(ahnd[0]);
 
 	igt_assert(enable_hangcheck(i915, true));
 	gem_quiescent_gpu(i915);
-- 
2.26.0
