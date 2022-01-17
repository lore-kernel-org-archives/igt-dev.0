Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF5210E482
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jan 2022 09:09:09 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Mon, 17 Jan 2022 14:27:00 +0530
Message-Id: <20220117085700.1723228-3-priyanka.dandamudi@intel.com>
In-Reply-To: <20220117085700.1723228-1-priyanka.dandamudi@intel.com>
References: <20220117085700.1723228-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/2] tests/i915/gem_ctx_exec: Skip test
 for shared reset domain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, ashutosh.dixit@intel.com, John.C.Harrison@Intel.com, saurabhg.gupta@intel.com, matthew.d.roper@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

The test tries to submit non-preemptible spinneris to all engines,
causes a hang and expects the non-preemptible spinners to survive
but fails to do for RCS+CCS.
So, updated the code to skip nohangcheck subtest for a platform with RCS+CCS.

v2: Some minor fixes (Ashutosh).

v3: Updated code to skip test only for RCS/CCS (Roper Matt)

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_ctx_exec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index a1270a88..0b2b7e10 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -276,6 +276,7 @@ static void nohangcheck_hostile(int i915)
 	int err = 0;
 	int dir;
 	uint64_t ahnd;
+	bool has_sh_do = false;
 
 	/*
 	 * Even if the user disables hangcheck during their context,
@@ -292,11 +293,15 @@ static void nohangcheck_hostile(int i915)
 	ahnd = get_reloc_ahnd(i915, ctx->id);
 
 	igt_require(__enable_hangcheck(dir, false));
+	has_sh_do = has_shared_reset_domain(i915, ctx);
 
 	for_each_ctx_engine(i915, ctx, e) {
 		igt_spin_t *spin;
 		int new;
 
+		if (has_sh_do && (e->class == I915_ENGINE_CLASS_RENDER ||
+			    e->class == I915_ENGINE_CLASS_COMPUTE))
+			continue;
 		/* Set a fast hang detection for a dead context */
 		gem_engine_property_printf(i915, e->name,
 					   "preempt_timeout_ms", "%d", 50);
-- 
2.25.1
