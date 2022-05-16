Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D418C10E30F
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 14:06:52 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 16 May 2022 19:31:55 +0530
Message-Id: <20220516140201.3428227-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20220516140201.3428227-1-bhanuprakash.modem@intel.com>
References: <20220516140201.3428227-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V4 05/11] tests/kms_cursor_edge_walk: Convert tests to
 dynamic
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

Convert the existing subtests to dynamic subtests at pipe level.

V2:
* Fix nested igt_fixture in igt_subtest
V3:
* Add output name to subtest

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_edge_walk.c | 63 ++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 35 deletions(-)

diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index b775714f..526bc6b3 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -309,6 +309,17 @@ static const char *help_str =
 
 igt_main_args("", long_opts, help_str, opt_handler, &data)
 {
+	struct {
+		const char *name;
+		unsigned flags;
+	} tests[] = {
+		{ "left-edge", EDGE_LEFT },
+		{ "right-edge", EDGE_RIGHT },
+		{ "top-edge", EDGE_TOP },
+		{ "top-bottom", EDGE_BOTTOM },
+	};
+	int i;
+
 	igt_fixture {
 		int ret;
 
@@ -328,44 +339,26 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_require_pipe_crc(data.drm_fd);
 
 		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
 	}
 
-	for_each_pipe_static(data.pipe) {
-		igt_subtest_group {
-			igt_fixture {
-				igt_display_require_output_on_pipe(&data.display, data.pipe);
-				data.output = igt_get_single_output_for_pipe(&data.display, data.pipe);
-			}
-
-			for (data.curw = 64; data.curw <= 256; data.curw *= 2) {
-				data.curh = data.curw;
-
-				igt_fixture
+	igt_describe("Checking cursor by walking left/right/top/bottom edge of screen");
+	igt_subtest_group {
+		for (i = 0; i < ARRAY_SIZE(tests); i++) {
+			igt_subtest_with_dynamic(tests[i].name) {
+				for_each_pipe(&data.display, data.pipe) {
 					igt_require(data.curw <= max_curw && data.curh <= max_curh);
-
-				igt_describe("Checking cursor by walking left edge of screen");
-				igt_subtest_f("pipe-%s-%dx%d-left-edge",
-					kmstest_pipe_name(data.pipe),
-					data.curw, data.curh)
-					test_crtc(&data, EDGE_LEFT);
-
-				igt_describe("Checking cursor by walking right edge of screen");
-				igt_subtest_f("pipe-%s-%dx%d-right-edge",
-					kmstest_pipe_name(data.pipe),
-					data.curw, data.curh)
-					test_crtc(&data, EDGE_RIGHT);
-
-				igt_describe("Checking cursor by walking top edge of screen");
-				igt_subtest_f("pipe-%s-%dx%d-top-edge",
-					kmstest_pipe_name(data.pipe),
-					data.curw, data.curh)
-					test_crtc(&data, EDGE_TOP);
-
-				igt_describe("Checking cursor by walking bottom edge of screen");
-				igt_subtest_f("pipe-%s-%dx%d-bottom-edge",
-					kmstest_pipe_name(data.pipe),
-					data.curw, data.curh)
-					test_crtc(&data, EDGE_BOTTOM);
+					data.output = igt_get_single_output_for_pipe(&data.display, data.pipe);
+
+					for (data.curw = 64; data.curw <= 256; data.curw *= 2) {
+						data.curh = data.curw;
+						igt_dynamic_f("pipe-%s-%s-%dx%d",
+							      kmstest_pipe_name(data.pipe),
+							      data.output->name,
+							      data.curw, data.curh)
+							test_crtc(&data, tests[i].flags);
+					}
+				}
 			}
 		}
 	}
-- 
2.35.1
