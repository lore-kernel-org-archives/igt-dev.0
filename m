Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC0710EB87
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 22:55:42 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Mar 2023 15:55:14 -0700
Message-Id: <20230323225534.3739835-11-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230323225534.3739835-1-umesh.nerlige.ramappa@intel.com>
References: <20230323225534.3739835-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 10/30] i915/perf: Add OAM format type
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

Similar to OAG (Global) and OAR (Render), OAM (Observability
Architecture for Media) adds some new OA formats that require different
metrics configurations for B and C counters. Don't do a sanity check for
B and C counters for OAM formats until such metrics are available.

v2: Improve commit message (Kamil)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/perf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index d116667d..a2bc6dc1 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -91,6 +91,7 @@ struct accumulator {
 enum {
 	OAG,
 	OAR,
+	OAM,
 
 	MAX_OA_TYPE,
 };
@@ -1022,7 +1023,7 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
 	/* The TestOa metric set defines all B counters to be a
 	 * multiple of the gpu clock
 	 */
-	if (format.n_b) {
+	if (format.n_b && (format.oa_type == OAG || format.oa_type == OAR)) {
 		if (clock_delta > 0) {
 			b = rpt1_b[0] - rpt0_b[0];
 			igt_debug("B0: delta = %"PRIu32"\n", b);
-- 
2.36.1
