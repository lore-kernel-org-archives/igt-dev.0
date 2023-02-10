Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54A710EC51
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Feb 2023 04:28:56 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	karthik.b.s@intel.com
Date: Fri, 10 Feb 2023 09:54:18 +0530
Message-Id: <20230210042419.1744563-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 1/2] tests/kms_cursor_edge_walk: Re-org dynamic
 subtests
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

Instead of clubbing all dynamic subtests, let's have an individual
subtest for each size & type.

Fixes: 54ff3199b (tests/kms_cursor_edge_walk: Convert tests to dynamic)
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_edge_walk.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index e653b9ab9..96812776c 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -342,21 +342,21 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_display_require_output(&data.display);
 	}
 
-	igt_describe("Checking cursor by walking left/right/top/bottom edge of screen");
-	igt_subtest_group {
-		for (i = 0; i < ARRAY_SIZE(tests); i++) {
-			igt_subtest_with_dynamic(tests[i].name) {
+	for (i = 0; i < ARRAY_SIZE(tests); i++) {
+		for (data.curw = 64; data.curw <= 256; data.curw *= 2) {
+			data.curh = data.curw;
+			igt_fixture
+				igt_require(data.curw <= max_curw && data.curh <= max_curh);
+
+			igt_describe_f("Checking cursor size %dx%d by walking %s of screen",
+					data.curw, data.curh, tests[i].name);
+			igt_subtest_with_dynamic_f("%dx%d-%s", data.curw,
+						   data.curh, tests[i].name) {
 				for_each_pipe_with_single_output(&data.display, data.pipe, data.output) {
-					for (data.curw = 64; data.curw <= 256; data.curw *= 2) {
-						data.curh = data.curw;
-						igt_require(data.curw <= max_curw && data.curh <= max_curh);
-
-						igt_dynamic_f("pipe-%s-%s-%dx%d",
-							      kmstest_pipe_name(data.pipe),
-							      data.output->name,
-							      data.curw, data.curh)
-							test_crtc(&data, tests[i].flags);
-					}
+					igt_dynamic_f("pipe-%s-%s",
+						      kmstest_pipe_name(data.pipe),
+						      data.output->name)
+						test_crtc(&data, tests[i].flags);
 				}
 			}
 		}
-- 
2.39.0
