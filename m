Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2360D11B365
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jan 2022 06:23:23 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Mon, 10 Jan 2022 11:41:41 +0530
Message-Id: <20220110061141.1655017-3-priyanka.dandamudi@intel.com>
In-Reply-To: <20220110061141.1655017-1-priyanka.dandamudi@intel.com>
References: <20220110061141.1655017-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] tests/i915/gem_ctx_exec: Skip test
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, ashutosh.dixit@intel.com, John.C.Harrison@Intel.com, saurabhg.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

The test tries to submit non-preemptible spinneris to all engines,
causes a hang and expects the non-preemptible spinners to survive
but fails to do for RCS+CCS.
So, updated the code to skip nohangcheck subtest for a platform with RCS+CCS.

v2: Some minor fixes (Ashutosh).

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_ctx_exec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index a1270a88..4c21542d 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -292,6 +292,7 @@ static void nohangcheck_hostile(int i915)
 	ahnd = get_reloc_ahnd(i915, ctx->id);
 
 	igt_require(__enable_hangcheck(dir, false));
+	igt_require(!has_shared_reset_domain(i915, ctx));
 
 	for_each_ctx_engine(i915, ctx, e) {
 		igt_spin_t *spin;
-- 
2.25.1
