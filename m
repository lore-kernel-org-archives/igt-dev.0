Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4F610EA06
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Feb 2023 00:46:55 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 16:46:27 -0800
Message-Id: <20230215004648.2100655-11-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
References: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 10/31] i915/perf: Add OAM format type
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

Don't check for B and C counters sanity for OAM formats.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index c3c5663b..e9613dc9 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -104,6 +104,7 @@ struct accumulator {
 enum {
 	OAG,
 	OAR,
+	OAM,
 
 	MAX_OA_TYPE,
 };
@@ -1035,7 +1036,7 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
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
