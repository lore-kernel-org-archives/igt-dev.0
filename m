Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A817A10E6E8
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Oct 2022 20:55:41 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 27 Oct 2022 20:55:14 +0000
Message-Id: <20221027205535.12824-8-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221027205535.12824-1-umesh.nerlige.ramappa@intel.com>
References: <20221027205535.12824-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 07/28] i915/perf: Define OA report types
 and fix oa-formats test
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

With newer gen12 platforms, formats used for OAG buffer and
MI_REPORT_PERF_FORMAT differ slightly. This causes issues when the
oa-formats test does a sanity check. Run oa-formats for OAG reports
only.

OAR formats must be tested with the gen12-mi-rpc and
gen12-unprivileged-single-ctx-counters.

v2: Clarify commit message

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/i915/perf.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 974f3755..741af078 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -95,6 +95,13 @@ struct accumulator {
 	uint64_t deltas[MAX_RAW_OA_COUNTERS];
 };
 
+enum {
+	OAG,
+	OAR,
+
+	MAX_OA_TYPE,
+};
+
 struct oa_format {
 	const char *name;
 	size_t size;
@@ -108,6 +115,7 @@ struct oa_format {
 	int n_b;
 	int c_off;
 	int n_c;
+	int oa_type;
 };
 
 static struct oa_format hsw_oa_formats[I915_OA_FORMAT_MAX] = {
@@ -1483,6 +1491,9 @@ test_oa_formats(void)
 		if (!format.name) /* sparse, indexed by ID */
 			continue;
 
+		if (format.oa_type != OAG) /* sparse, indexed by ID */
+			continue;
+
 		igt_debug("Checking OA format %s\n", format.name);
 
 		open_and_read_2_oa_reports(i,
-- 
2.25.1
