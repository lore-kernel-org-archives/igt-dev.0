Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A462C10E02D
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Mar 2023 16:56:27 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Mar 2023 22:23:24 +0530
Message-Id: <20230307165324.506526-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_render_copy: Skip the Y-tile
 test for MTL
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

All the tests for y-tile or yf-tile , neither of these tiling formats
are supported on MTL so skipping these tests.

Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
Acked-by: Sinjan Kumar <sinjan.kumar@intel.com>
---
 tests/i915/gem_render_copy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_render_copy.c b/tests/i915/gem_render_copy.c
index 70b96c8f4..2c150b2b0 100644
--- a/tests/i915/gem_render_copy.c
+++ b/tests/i915/gem_render_copy.c
@@ -852,7 +852,7 @@ igt_main_args("dac", NULL, help_str, opt_handler, NULL)
 			 force_vebox_dst_copy ? "vebox-" : "",
 			 dst_mode);
 		igt_subtest_with_dynamic(name) {
-			igt_skip_on(IS_DG2(data.devid) &&
+			igt_skip_on((IS_DG2(data.devid) || IS_METEORLAKE(data.devid)) &&
 				    ((t->src_tiling == I915_TILING_Y) ||
 				     (t->src_tiling == I915_TILING_Yf) ||
 				     (t->dst_tiling == I915_TILING_Y) ||
-- 
2.25.1
