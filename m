Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3769B10EDAC
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 14:07:22 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Sep 2022 19:33:31 +0530
Message-Id: <20220909140331.1041095-53-bhanuprakash.modem@intel.com>
In-Reply-To: <20220909140331.1041095-1-bhanuprakash.modem@intel.com>
References: <20220909140331.1041095-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 52/52] tests/i915/kms_pwrite_crc: Add support
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
 tests/i915/kms_pwrite_crc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/i915/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c
index 584e6a19..cbdb7d84 100644
--- a/tests/i915/kms_pwrite_crc.c
+++ b/tests/i915/kms_pwrite_crc.c
@@ -110,6 +110,7 @@ static void prepare_crtc(data_t *data)
 	igt_output_t *output = data->output;
 	drmModeModeInfo *mode;
 
+	igt_display_reset(display);
 	/* select the pipe we want to use */
 	igt_output_set_pipe(output, data->pipe);
 
@@ -160,6 +161,12 @@ static void run_test(data_t *data)
 	enum pipe pipe;
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
+		igt_display_reset(display);
+
+		igt_output_set_pipe(output, data->pipe);
+		if (!i915_pipe_output_combo_valid(display))
+			continue;
+
 		data->output = output;
 		data->pipe = pipe;
 
-- 
2.35.1
