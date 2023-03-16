Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D5310E09C
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 23:33:28 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 kamil.konieczny@linux.intel.com
Date: Thu, 16 Mar 2023 16:32:56 -0700
Message-Id: <20230316233323.2638668-5-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230316233323.2638668-1-umesh.nerlige.ramappa@intel.com>
References: <20230316233323.2638668-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 04/31] i915/perf: Ensure rcs0 is present
 for gen12-mi-rpc
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
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index ee5a77fc..2a1cecfe 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -5274,8 +5274,12 @@ igt_main
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
