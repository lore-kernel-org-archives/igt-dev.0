Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F5418AF05
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Jul 2022 05:50:35 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Wed, 13 Jul 2022 11:18:05 +0530
Message-Id: <20220713054805.633767-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/kms_cursor_edge_walk: Fix the usage of
 single output on pipe
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

igt_get_single_output_for_pipe may return NULL if there is no compatable
output found on a selected pipe.

Instead use for_each_pipe_with_single_output() to iterate all possible
combinations.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/6279
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_edge_walk.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index af3769db..b75fc216 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -346,9 +346,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_subtest_group {
 		for (i = 0; i < ARRAY_SIZE(tests); i++) {
 			igt_subtest_with_dynamic(tests[i].name) {
-				for_each_pipe(&data.display, data.pipe) {
-					data.output = igt_get_single_output_for_pipe(&data.display, data.pipe);
-
+				for_each_pipe_with_single_output(&data.display, data.pipe, data.output) {
 					for (data.curw = 64; data.curw <= 256; data.curw *= 2) {
 						data.curh = data.curw;
 						igt_require(data.curw <= max_curw && data.curh <= max_curh);
-- 
2.35.1
