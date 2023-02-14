Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2299410E02A
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 21:00:13 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 12:59:41 -0800
Message-Id: <20230214210007.2026033-5-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
References: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 04/30] i915/perf: Ensure rcs0 is present for
 gen12-mi-rpc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Make sure rcs0 is present for gen12-mi-rpc.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 015693e7..02414e06 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -5287,8 +5287,12 @@ igt_main
 		igt_fixture igt_require(intel_gen(devid) >= 12);
 
 		igt_describe("Test MI REPORT PERF COUNT for Gen 12");
-		igt_subtest("gen12-mi-rpc")
+		igt_subtest("gen12-mi-rpc") {
+			igt_require_f(has_class_instance(drm_fd,
+							 I915_ENGINE_CLASS_RENDER,
+							 0), "no render engine\n");
 			gen12_test_mi_rpc();
+		}
 
 		igt_describe("Test OA TLB invalidate");
 		igt_subtest("gen12-oa-tlb-invalidate")
-- 
2.36.1
