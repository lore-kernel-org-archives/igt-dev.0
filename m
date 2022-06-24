Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF5B10F5D9
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jun 2022 04:37:08 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 24 Jun 2022 10:05:25 +0530
Message-Id: <20220624043525.86679-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/kms_cursor_edge_walk: Fix test requirement
 to avoid SKIPs
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

As (54ff3199) introduced dynamic subtets, tests are getting Skipped
on all pipes except pipe-A.

This patch will fix the test requirement condition to avoid such skips.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/6250
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_edge_walk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 526bc6b3..af3769db 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -347,11 +347,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for (i = 0; i < ARRAY_SIZE(tests); i++) {
 			igt_subtest_with_dynamic(tests[i].name) {
 				for_each_pipe(&data.display, data.pipe) {
-					igt_require(data.curw <= max_curw && data.curh <= max_curh);
 					data.output = igt_get_single_output_for_pipe(&data.display, data.pipe);
 
 					for (data.curw = 64; data.curw <= 256; data.curw *= 2) {
 						data.curh = data.curw;
+						igt_require(data.curw <= max_curw && data.curh <= max_curh);
+
 						igt_dynamic_f("pipe-%s-%s-%dx%d",
 							      kmstest_pipe_name(data.pipe),
 							      data.output->name,
-- 
2.35.1
