Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4439E10E097
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Nov 2022 11:56:36 +0000 (UTC)
From: Karolina Drobnik <karolina.drobnik@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  9 Nov 2022 12:56:37 +0100
Message-Id: <9ca8f80844e70f91e9498bc732bf0df5730df4a7.1667994832.git.karolina.drobnik@intel.com>
In-Reply-To: <cover.1667994832.git.karolina.drobnik@intel.com>
References: <cover.1667994832.git.karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/api_intel_bb: Check for blitter
 support in misplaced-blitter
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

BLT copy operations are not supported on all generations, so check
for blitter support before executing the test.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/7493
Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>
---
 tests/i915/api_intel_bb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
index d448f02d..a13626ee 100644
--- a/tests/i915/api_intel_bb.c
+++ b/tests/i915/api_intel_bb.c
@@ -1643,6 +1643,7 @@ igt_main_args("dpibc:", NULL, help_str, opt_handler, NULL)
 
 	igt_describe("Execute intel_bb with set of engines provided by userspace");
 	igt_subtest("misplaced-blitter") {
+		gem_require_blitter(i915);
 		gem_require_contexts(i915);
 		misplaced_blitter(bops);
 	}
-- 
2.25.1
