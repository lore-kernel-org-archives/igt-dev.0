Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8659A10E869
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Mar 2022 12:13:12 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  2 Mar 2022 13:12:53 +0100
Message-Id: <20220302121253.25299-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220302121253.25299-1-zbigniew.kempczynski@intel.com>
References: <20220302121253.25299-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/gem_render_copy: Added skip for
 I915_TILING_Y and I915_TILING_Yf on DG2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Gowtham <sai.gowtham.ch@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Arjun Melkaveri <arjun.melkaveri@intel.com>

Added skip for I915_TILING_Y and I915_TILING_Yf on DG2, as those tiling
formats are not supported.

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: Sai Gowtham <sai.gowtham.ch@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_render_copy.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/gem_render_copy.c b/tests/i915/gem_render_copy.c
index d485e3415a..3da29ec4e3 100644
--- a/tests/i915/gem_render_copy.c
+++ b/tests/i915/gem_render_copy.c
@@ -852,6 +852,12 @@ igt_main_args("dac", NULL, help_str, opt_handler, NULL)
 			 force_vebox_dst_copy ? "vebox-" : "",
 			 dst_mode);
 		igt_subtest_with_dynamic(name) {
+			igt_skip_on(IS_DG2(data.devid) &&
+				    ((t->src_tiling == I915_TILING_Y) ||
+				     (t->src_tiling == I915_TILING_Yf) ||
+				     (t->dst_tiling == I915_TILING_Y) ||
+				     (t->dst_tiling == I915_TILING_Yf)));
+
 			igt_require_f(data.vebox_copy || !vebox_copy_used,
 				      "no vebox-copy function\n");
 			for_each_combination(region_set, 1, set) {
-- 
2.32.0
