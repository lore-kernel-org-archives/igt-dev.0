Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5ACF10EA8D
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Dec 2023 19:29:44 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] tests/intel/xe_query: Refactor subtests
Date: Fri, 15 Dec 2023 20:29:33 +0100
Message-ID: <20231215192934.83009-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231215192934.83009-1-kamil.konieczny@linux.intel.com>
References: <20231215192934.83009-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Refactor subtests into simple loop. This is preparation
to extending it into multi-gpu scenario.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_query.c | 53 +++++++++++++++++-------------------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 338ef6151..5424f9dba 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -679,43 +679,32 @@ static void test_engine_cycles_invalid(int fd)
 
 igt_main
 {
+	const struct {
+		const char *name;
+		void (*func)(int);
+	} funcs[] = {
+		{ "query-engines", test_query_engines },
+		{ "query-mem-usage", test_query_mem_regions },
+		{ "query-gt-list", test_query_gt_list },
+		{ "query-config", test_query_config },
+		{ "query-hwconfig", test_query_hwconfig },
+		{ "query-topology", test_query_gt_topology },
+		{ "query-cs-cycles", test_query_engine_cycles },
+		{ "query-invalid-cs-cycles", test_engine_cycles_invalid },
+		{ "query-invalid-query", test_query_invalid_query },
+		{ "query-invalid-size", test_query_invalid_size },
+		{ "query-invalid-extension", test_query_invalid_extension },
+		{ }
+	}, *f;
 	int xe;
 
 	igt_fixture
 		xe = drm_open_driver(DRIVER_XE);
 
-	igt_subtest("query-engines")
-		test_query_engines(xe);
-
-	igt_subtest("query-mem-usage")
-		test_query_mem_regions(xe);
-
-	igt_subtest("query-gt-list")
-		test_query_gt_list(xe);
-
-	igt_subtest("query-config")
-		test_query_config(xe);
-
-	igt_subtest("query-hwconfig")
-		test_query_hwconfig(xe);
-
-	igt_subtest("query-topology")
-		test_query_gt_topology(xe);
-
-	igt_subtest("query-cs-cycles")
-		test_query_engine_cycles(xe);
-
-	igt_subtest("query-invalid-cs-cycles")
-		test_engine_cycles_invalid(xe);
-
-	igt_subtest("query-invalid-query")
-		test_query_invalid_query(xe);
-
-	igt_subtest("query-invalid-size")
-		test_query_invalid_size(xe);
-
-	igt_subtest("query-invalid-extension")
-		test_query_invalid_extension(xe);
+	for (f = funcs; f->name; f++) {
+		igt_subtest_f("%s", f->name)
+			f->func(xe);
+	}
 
 	igt_fixture
 		drm_close_driver(xe);
-- 
2.42.0
