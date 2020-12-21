Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B626E170
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Dec 2020 07:40:00 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Tue, 22 Dec 2020 01:57:53 +0530
Message-Id: <20201221202753.2552621-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_cursor_edge_walk:Add subtest
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
Cc: B@freedesktop.org, Gupta@freedesktop.org, nidhi1.gupta@intel.com, S@freedesktop.org, Patnana@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Added description for all subtests

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
Cc: B S, Karthik <Karthik.B.S@intel.com>
Cc: Patnana, Venkata Sai <Venkata.Sai.Patnana@intel.com>

v2: modified subtests description (Sai)
---
 tests/kms_cursor_edge_walk.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 32b8e711..69662afe 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -339,21 +339,25 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				igt_fixture
 					igt_require(data.curw <= max_curw && data.curh <= max_curh);
 
+				igt_describe("Checking cursor by walking left edge of screen");
 				igt_subtest_f("pipe-%s-%dx%d-left-edge",
 					kmstest_pipe_name(data.pipe),
 					data.curw, data.curh)
 					test_crtc(&data, EDGE_LEFT);
 
+				igt_describe("Checking cursor by walking right edge of screen");
 				igt_subtest_f("pipe-%s-%dx%d-right-edge",
 					kmstest_pipe_name(data.pipe),
 					data.curw, data.curh)
 					test_crtc(&data, EDGE_RIGHT);
 
+				igt_describe("Checking cursor by walking top edge of screen");
 				igt_subtest_f("pipe-%s-%dx%d-top-edge",
 					kmstest_pipe_name(data.pipe),
 					data.curw, data.curh)
 					test_crtc(&data, EDGE_TOP);
 
+				igt_describe("Checking cursor by walking bottom edge of screen");
 				igt_subtest_f("pipe-%s-%dx%d-bottom-edge",
 					kmstest_pipe_name(data.pipe),
 					data.curw, data.curh)
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
