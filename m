Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688F610E03E
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Dec 2023 19:32:37 +0000 (UTC)
From: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [Patch i-g-t v2] tests/intel/gem_pxp: Fix malformed pipectrl command
 in PXP IGT tests
Date: Mon, 11 Dec 2023 11:32:26 -0800
Message-Id: <20231211193226.2801188-1-vivaik.balasubrawmanian@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Five i915 PXP IGT tests were failing due to malformed Pipe-Ctrl cmd.

v2:
    Updated subject and cc lines to follow IGT conventions.
    Maintaining Kamil's review completion.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_pxp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index 4aea765fe..dff4a5d25 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -841,7 +841,7 @@ static void emit_pipectrl(struct intel_bb *ibb, struct intel_buf *fenceb, bool b
 	uint32_t pipe_ctl_flags = 0;
 	uint32_t ps_op_id;
 
-	intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(4));
+	intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(2));
 	intel_bb_out(ibb, pipe_ctl_flags);
 
 	if (before)

base-commit: 222d1bdf8c598bb12164deab127af5d8d7ddc070
-- 
2.34.1
