Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37ABE10F40F
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 06:10:06 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 08:09:53 +0200
Message-Id: <20220421060955.21016-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220421060955.21016-1-zbigniew.kempczynski@intel.com>
References: <20220421060955.21016-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] i915/gem_exec_schedule: Fix context
 creation for shared-vm
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

submit_slice() is using a single address space for a couple of contexts
to prevent rebinding while active, and so requires that address space to
be shared during context construction.

v2: Add separate context for background spinner (Zbigniew)

Fixes: a9987a8dcb8f ("tests/i915/gem_exec_schedule: Convert to intel_ctx_t (v3)kkk")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_exec_schedule.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index cf7e4d4eb3..caeac255de 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -818,8 +818,8 @@ static void submit_slice(int i915, const intel_ctx_cfg_t *cfg,
 	intel_ctx_cfg_t engine_cfg = {
 		.num_engines = 1,
 	};
-	const intel_ctx_t *ctx;
-	uint64_t ahnd0 = get_reloc_ahnd(i915, 0);
+	const intel_ctx_t *ctx, *bg_ctx;
+	uint64_t ahnd, bg_ahnd;
 
 	/*
 	 * When using a submit fence, we do not want to block concurrent work,
@@ -828,19 +828,25 @@ static void submit_slice(int i915, const intel_ctx_cfg_t *cfg,
 
 	igt_require(gem_scheduler_has_timeslicing(i915));
 	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
+	igt_require(gem_has_vm(i915));
+
+	engine_cfg.vm = gem_vm_create(i915);
+	ahnd = intel_allocator_open_vm(i915, engine_cfg.vm, INTEL_ALLOCATOR_RELOC);
+	bg_ctx = intel_ctx_create(i915, cfg);
+	bg_ahnd = get_reloc_ahnd(i915, bg_ctx->id);
 
 	for_each_ctx_cfg_engine(i915, cfg, cancel) {
 		igt_spin_t *bg, *spin;
 		int timeline = -1;
 		int fence = -1;
-		uint64_t ahndN;
 
 		if (!gem_class_can_store_dword(i915, cancel->class))
 			continue;
 
 		igt_debug("Testing cancellation from %s\n", e->name);
 
-		bg = igt_spin_new(i915, .ahnd = ahnd0, .engine = e->flags);
+		bg = igt_spin_new(i915, .ahnd = bg_ahnd, .ctx = bg_ctx,
+				  .engine = e->flags);
 
 		if (flags & LATE_SUBMIT) {
 			timeline = sw_sync_timeline_create();
@@ -850,8 +856,7 @@ static void submit_slice(int i915, const intel_ctx_cfg_t *cfg,
 		engine_cfg.engines[0].engine_class = e->class;
 		engine_cfg.engines[0].engine_instance = e->instance;
 		ctx = intel_ctx_create(i915, &engine_cfg);
-		ahndN = get_reloc_ahnd(i915, ctx->id);
-		spin = igt_spin_new(i915, .ahnd = ahndN, .ctx = ctx,
+		spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 				    .fence = fence,
 				    .flags =
 				    IGT_SPIN_POLL_RUN |
@@ -880,10 +885,12 @@ static void submit_slice(int i915, const intel_ctx_cfg_t *cfg,
 		igt_spin_free(i915, bg);
 
 		intel_ctx_destroy(i915, ctx);
-		put_ahnd(ahndN);
 	}
 
-	put_ahnd(ahnd0);
+	gem_vm_destroy(i915, engine_cfg.vm);
+	intel_ctx_destroy(i915, bg_ctx);
+	put_ahnd(bg_ahnd);
+	put_ahnd(ahnd);
 }
 
 static uint32_t __batch_create(int i915, uint32_t offset)
-- 
2.32.0
