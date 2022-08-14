Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C44098C81
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:22 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:30 +0530
Message-Id: <20220814180908.2553394-14-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 13/51] tests/kms_cursor_edge_walk: Add support for
 Bigjoiner
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

This patch will add a check to Skip the subtest if a selected pipe/output
combo won't support Bigjoiner or 8K mode.

Example:
* Pipe-D wont support a mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_edge_walk.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index b75fc216..3e5832a9 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -351,6 +351,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						data.curh = data.curw;
 						igt_require(data.curw <= max_curw && data.curh <= max_curh);
 
+						igt_display_reset(&data.display);
+						igt_output_set_pipe(data.output, data.pipe);
+						if (!igt_test_constraint(&data.display))
+							continue;
+
+						igt_output_set_pipe(data.output, PIPE_NONE);
 						igt_dynamic_f("pipe-%s-%s-%dx%d",
 							      kmstest_pipe_name(data.pipe),
 							      data.output->name,
-- 
2.35.1
