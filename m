Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8785410EAB6
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 16:03:56 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 21:29:25 +0530
Message-Id: <20220922160004.2041598-14-bhanuprakash.modem@intel.com>
In-Reply-To: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
References: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 13/52] tests/kms_cursor_edge_walk: Add support
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
---
 tests/kms_cursor_edge_walk.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index b75fc216..8a16ecad 100644
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
2.37.3
