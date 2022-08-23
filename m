Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A875112FBC
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Aug 2022 18:30:44 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 Aug 2022 18:30:21 +0000
Message-Id: <20220823183036.5270-9-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 08/23] i915/perf: Define OA report types
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

Differentiate between OAG and OAR format types for tests like
oa-formats.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 19c33324..b61dd6e2 100644
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
@@ -110,6 +117,7 @@ struct oa_format {
 	int n_b;
 	int c_off;
 	int n_c;
+	int oa_type;
 };
 
 static struct oa_format hsw_oa_formats[I915_OA_FORMAT_MAX] = {
@@ -1539,6 +1547,9 @@ test_oa_formats(void)
 		if (!format.name) /* sparse, indexed by ID */
 			continue;
 
+		if (format.oa_type != OAG) /* sparse, indexed by ID */
+			continue;
+
 		igt_debug("Checking OA format %s\n", format.name);
 
 		open_and_read_2_oa_reports(i,
-- 
2.25.1
