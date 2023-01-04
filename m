Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397D810E5F3
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jan 2023 17:08:43 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Jan 2023 22:30:23 +0530
Message-Id: <20230104170023.3355190-52-bhanuprakash.modem@intel.com>
In-Reply-To: <20230104170023.3355190-1-bhanuprakash.modem@intel.com>
References: <20230104170023.3355190-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v7 51/51] tests/i915/kms_pwrite_crc: Add support
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
V3: - Fix the usage of pipe & output

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/i915/kms_pwrite_crc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/i915/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c
index c84a184d..3278d876 100644
--- a/tests/i915/kms_pwrite_crc.c
+++ b/tests/i915/kms_pwrite_crc.c
@@ -110,6 +110,7 @@ static void prepare_crtc(data_t *data)
 	igt_output_t *output = data->output;
 	drmModeModeInfo *mode;
 
+	igt_display_reset(display);
 	/* select the pipe we want to use */
 	igt_output_set_pipe(output, data->pipe);
 
@@ -156,12 +157,13 @@ static void cleanup_crtc(data_t *data)
 static void run_test(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	igt_output_t *output;
-	enum pipe pipe;
 
-	for_each_pipe_with_valid_output(display, pipe, output) {
-		data->output = output;
-		data->pipe = pipe;
+	for_each_pipe_with_valid_output(display, data->pipe, data->output) {
+		igt_display_reset(display);
+
+		igt_output_set_pipe(data->output, data->pipe);
+		if (!i915_pipe_output_combo_valid(display))
+			continue;
 
 		prepare_crtc(data);
 		test(data);
-- 
2.39.0
