Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD1910FE4A
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Apr 2022 07:28:30 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
To: arjun.melkaveri@intel.com, ramalingam.c@intel.com,
 ashutosh.dixit@intel.com, igt-dev@lists.freedesktop.org
Date: Fri,  1 Apr 2022 12:58:26 +0530
Message-Id: <20220401072826.6447-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_lmem_swapping: Fix bug in
 test_smem_oom
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

ctx was not initialized with all physical engines,
after device reopening.
This change would resolve assert issue seen in __do_evict.

v2: Added missing intel_ctx_destroy.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 tests/i915/gem_lmem_swapping.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 43f0688f..432607b0 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -428,10 +428,14 @@ static void test_smem_oom(int i915,
 
 		fill_params(i915, &params, region, 0, 1, true);
 
+		ctx = intel_ctx_create_all_physical(fd);
+		__gem_context_set_persistence(fd, ctx->id, false);
+
 		igt_install_exit_handler(smem_oom_exit_handler);
 		__do_evict(fd, ctx, &region->region, &params,
 			   params.seed + child + 1);
 
+		intel_ctx_destroy(fd, ctx);
 		close(fd);
 	}
 
-- 
2.25.1
