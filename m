Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161DC10E6C9
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Dec 2021 08:04:07 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Wed, 29 Dec 2021 13:22:39 +0530
Message-Id: <20211229075239.1555546-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_exec: Skip test for
 RCS+CCS
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

Updated the nohangcheck test to skip for DG2
as test fails when reset is applied for the RCS+CCS combination.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_ctx_exec.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index a1270a88..dbb46404 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -276,6 +276,9 @@ static void nohangcheck_hostile(int i915)
 	int err = 0;
 	int dir;
 	uint64_t ahnd;
+	bool rcs_found = false;
+	bool ccs_found = false;
+
 
 	/*
 	 * Even if the user disables hangcheck during their context,
@@ -293,6 +296,17 @@ static void nohangcheck_hostile(int i915)
 
 	igt_require(__enable_hangcheck(dir, false));
 
+	for_each_ctx_engine(i915, ctx, e) {
+		if(rcs_found && ccs_found)
+			break;
+		else if(e->class == I915_ENGINE_CLASS_RENDER && rcs_found == false){
+			rcs_found = true;
+			continue;
+		}
+		else if(e->class == I915_ENGINE_CLASS_COMPUTE && ccs_found == false)
+			ccs_found = true;
+	}
+	igt_require(!(rcs_found && ccs_found));
 	for_each_ctx_engine(i915, ctx, e) {
 		igt_spin_t *spin;
 		int new;
-- 
2.25.1
