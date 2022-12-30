Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D8010E07F
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Dec 2022 17:52:05 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 30 Dec 2022 23:17:38 +0530
Message-Id: <20221230174825.3016716-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20221230174825.3016716-1-bhanuprakash.modem@intel.com>
References: <20221230174825.3016716-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v6 03/50] tests/kms_async_flips: Add support for
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

V2: - Use updated helper name
V3: - Drop unrelated changes

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_async_flips.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 7cb71f6b..e32ae914 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -542,9 +542,16 @@ static void run_test(data_t *data, void (*test)(data_t *))
 {
 	igt_output_t *output;
 	enum pipe pipe;
+	igt_display_t *display = &data->display;
+
+	for_each_pipe(display, pipe) {
+		for_each_valid_output_on_pipe(display, pipe, output) {
+			igt_display_reset(display);
+
+			igt_output_set_pipe(output, pipe);
+			if (!i915_pipe_output_combo_valid(display))
+				continue;
 
-	for_each_pipe(&data->display, pipe) {
-		for_each_valid_output_on_pipe(&data->display, pipe, output) {
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
 				data->output = output;
 				data->pipe = pipe;
-- 
2.39.0
