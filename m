Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B89D911BC
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:38 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:43 +0530
Message-Id: <20220814180908.2553394-27-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 26/51] tests/kms_plane_multiple: Add support for
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
 tests/kms_plane_multiple.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 1679f7ce..c59fd4df 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -296,6 +296,9 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 	bool loop_forever;
 	char info[256];
 
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	if (opt.iterations == LOOP_FOREVER) {
 		loop_forever = true;
 		sprintf(info, "forever");
@@ -366,12 +369,18 @@ static void
 test_plane_position(data_t *data, enum pipe pipe, uint64_t modifier)
 {
 	igt_output_t *output;
+	igt_display_t *display = &data->display;
 	int n_planes = opt.all_planes ?
 			data->display.pipes[pipe].n_planes : DEFAULT_N_PLANES;
 
-	output = igt_get_single_output_for_pipe(&data->display, pipe);
+	output = igt_get_single_output_for_pipe(display, pipe);
 	igt_require(output);
 
+	igt_display_reset(display);
+
+	igt_output_set_pipe(output, pipe);
+	igt_require(igt_test_constraint(display));
+
 	if (!opt.user_seed)
 		opt.seed = time(NULL);
 
-- 
2.35.1
