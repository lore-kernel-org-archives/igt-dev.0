Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76F56E044
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Dec 2020 06:37:30 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Mon, 14 Dec 2020 00:55:43 +0530
Message-Id: <20201213192543.1386992-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_cursor_edge_walk:Add subtest
 description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: B@freedesktop.org, Gupta@freedesktop.org, nidhi1.gupta@intel.com, S@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Added description for all subtests

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
Cc: B S, Karthik <Karthik.B.S@intel.com>
---
 tests/kms_cursor_edge_walk.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 32b8e711..9f86c8de 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -339,21 +339,29 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				igt_fixture
 					igt_require(data.curw <= max_curw && data.curh <= max_curh);
 
+				igt_describe("Checking CHV pipe C cursor by walking"
+                                                "left edge of screen");
 				igt_subtest_f("pipe-%s-%dx%d-left-edge",
 					kmstest_pipe_name(data.pipe),
 					data.curw, data.curh)
 					test_crtc(&data, EDGE_LEFT);
 
+				igt_describe("Checking CHV pipe C cursor by walking"
+                                                "right edge of screen");
 				igt_subtest_f("pipe-%s-%dx%d-right-edge",
 					kmstest_pipe_name(data.pipe),
 					data.curw, data.curh)
 					test_crtc(&data, EDGE_RIGHT);
 
+				igt_describe("Checking CHV pipe C cursor by walking"
+                                                "top edge of screen");
 				igt_subtest_f("pipe-%s-%dx%d-top-edge",
 					kmstest_pipe_name(data.pipe),
 					data.curw, data.curh)
 					test_crtc(&data, EDGE_TOP);
 
+				igt_describe("Checking CHV pipe C cursor by walking"
+                                                "bottom edge of screen");
 				igt_subtest_f("pipe-%s-%dx%d-bottom-edge",
 					kmstest_pipe_name(data.pipe),
 					data.curw, data.curh)
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
