Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633AC10E55D
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 23:33:30 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 kamil.konieczny@linux.intel.com
Date: Thu, 16 Mar 2023 16:33:17 -0700
Message-Id: <20230316233323.2638668-26-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230316233323.2638668-1-umesh.nerlige.ramappa@intel.com>
References: <20230316233323.2638668-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 25/31] i915/perf: Make sanity check
 failures descriptive
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

Make the asserts in the sanity check descriptive.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/perf.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 3aa8ecb0..5f516aef 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -1017,7 +1017,9 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
 			continue;
 
 		igt_debug("A40_%d: delta = %"PRIu64"\n", j, delta);
-		igt_assert(delta <= max_delta);
+		igt_assert_f(delta <= max_delta,
+			     "A40_%d: delta = %"PRIu64", max_delta = %"PRIu64"\n",
+			     j, delta, max_delta);
 	}
 
 	for (int j = 0; j < format.n_a64; j++) {
@@ -1029,7 +1031,9 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
 			continue;
 
 		igt_debug("A64_%d: delta = %"PRIu64"\n", format.first_a + j, delta);
-		igt_assert(delta <= max_delta);
+		igt_assert_f(delta <= max_delta,
+			     "A64_%d: delta = %"PRIu64", max_delta = %"PRIu64"\n",
+			     format.first_a + j, delta, max_delta);
 	}
 
 	for (int j = 0; j < format.n_a; j++) {
@@ -1044,7 +1048,9 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
 			continue;
 
 		igt_debug("A%d: delta = %"PRIu32"\n", a_id, delta);
-		igt_assert(delta <= max_delta);
+		igt_assert_f(delta <= max_delta,
+			     "A%d: delta = %"PRIu32", max_delta = %"PRIu64"\n",
+			     a_id, delta, max_delta);
 	}
 
 	/* The TestOa metric set defines all B counters to be a
@@ -1106,7 +1112,9 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
 
 		igt_debug("C%d: delta = %"PRIu32", max_delta=%"PRIu64"\n",
 			  j, delta, max_delta);
-		igt_assert(delta <= max_delta);
+		igt_assert_f(delta <= max_delta,
+			     "C%d: delta = %"PRIu32", max_delta = %"PRIu64"\n",
+			     j, delta, max_delta);
 	}
 }
 
-- 
2.36.1
