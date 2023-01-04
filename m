Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64EA10E5D8
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jan 2023 17:08:07 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Jan 2023 22:29:45 +0530
Message-Id: <20230104170023.3355190-14-bhanuprakash.modem@intel.com>
In-Reply-To: <20230104170023.3355190-1-bhanuprakash.modem@intel.com>
References: <20230104170023.3355190-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v7 13/51] tests/kms_cursor_edge_walk: Add support
 for Bigjoiner
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

V2: - Use updated helper name

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_cursor_edge_walk.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index e653b9ab..86b880d8 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -351,6 +351,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						data.curh = data.curw;
 						igt_require(data.curw <= max_curw && data.curh <= max_curh);
 
+						igt_display_reset(&data.display);
+						igt_output_set_pipe(data.output, data.pipe);
+						if (!i915_pipe_output_combo_valid(&data.display))
+							continue;
+
+						igt_output_set_pipe(data.output, PIPE_NONE);
 						igt_dynamic_f("pipe-%s-%s-%dx%d",
 							      kmstest_pipe_name(data.pipe),
 							      data.output->name,
-- 
2.39.0
