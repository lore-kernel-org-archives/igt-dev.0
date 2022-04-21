Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459D510F413
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 06:10:14 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 08:09:55 +0200
Message-Id: <20220421060955.21016-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220421060955.21016-1-zbigniew.kempczynski@intel.com>
References: <20220421060955.21016-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/i915/gem_exec_schedule: Use
 separate context for spinner
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Iterating over all physical engines on default context is wrong and
it may end with failure when there're more engines than default context
contains. To handle this we should create separate context on top of
all-physical-engines config.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/5444 (semaphore-resolved).
---
 tests/i915/gem_exec_schedule.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index dfcff849c8..cf2625cbf5 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -1065,7 +1065,7 @@ static void semaphore_resolve(int i915, const intel_ctx_cfg_t *cfg,
 	const struct intel_execution_engine2 *e;
 	const uint32_t SEMAPHORE_ADDR = 64 << 10;
 	uint32_t semaphore, *sema;
-	const intel_ctx_t *outer, *inner;
+	const intel_ctx_t *spin_ctx, *outer, *inner;
 	uint64_t ahnd = get_reloc_ahnd(i915, 0);
 
 	/*
@@ -1080,6 +1080,7 @@ static void semaphore_resolve(int i915, const intel_ctx_cfg_t *cfg,
 	igt_require(gem_scheduler_has_preemption(i915));
 	igt_require(intel_get_drm_devid(i915) >= 8); /* for MI_SEMAPHORE_WAIT */
 
+	spin_ctx = intel_ctx_create(i915, cfg);
 	outer = intel_ctx_create(i915, cfg);
 	inner = intel_ctx_create(i915, cfg);
 
@@ -1097,7 +1098,7 @@ static void semaphore_resolve(int i915, const intel_ctx_cfg_t *cfg,
 		if (!gem_class_can_store_dword(i915, e->class))
 			continue;
 
-		spin = __igt_spin_new(i915, .ahnd = ahnd,
+		spin = __igt_spin_new(i915, .ahnd = ahnd, .ctx = spin_ctx,
 				      .engine = e->flags, .flags = flags);
 		igt_spin_end(spin); /* we just want its address for later */
 		gem_sync(i915, spin->handle);
@@ -1190,6 +1191,7 @@ static void semaphore_resolve(int i915, const intel_ctx_cfg_t *cfg,
 
 	intel_ctx_destroy(i915, inner);
 	intel_ctx_destroy(i915, outer);
+	intel_ctx_destroy(i915, spin_ctx);
 	put_ahnd(ahnd);
 }
 
-- 
2.32.0
